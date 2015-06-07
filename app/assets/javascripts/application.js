// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require interact.min
//= require turbolinks
//= require_tree .

// Gets a suggested show
var blah;
getShow = function() {
  $.get(suggest_show_url, {}, 
    function(ret){
      blah = ret;
      populateShowDetails(ret);   
    }
  )
}
// Posts a liked show
likeShow = function() {
  $.get(like_show_url, { }, 
    function(ret){
     populateShowDetails(ret);
    }
  )
}
// Posts a disliked show
dislikeShow = function() {
  $.get(dislike_show_url, { }, 
    function(ret){
      populateShowDetails(ret);
    }
  )
}
// Loads the show to watch
watchShow = function() {
  window.location.replace(watch_show_url);
}
// Posts a watched show 
watchedShow = function() {
  $.get(watched_show_url, { }, 
    function(ret){
     populateShowDetails(ret);
    }
  )
}
// Loads show info
showInfo = function() {
  window.location.replace(show_info_url); 
}
// Loads show into view
populateShowDetails = function(ret) {
  $('#showTitle').text(ret.title);
  //$('#showGenre').text(ret.genre);
  $('#showImg').attr("src", ret.img_link);
}
//Submits new reaction
submitReaction = function() {
  $.post(new_reaction_url, {reaction: $('input').val() }, 
    function(ret){
      populateReactions(ret);
      console.log(ret);
    }
  )
}
// Requests reactions from rails
getReactions = function() {
  $.get(get_reactions_url, {}, 
    function(ret){
      populateReactions(ret);
      console.log(ret);
    }
  )
}
// Loads reactions into view
populateReactions = function(ret) {
  if(ret.constructor === Array){ 
    for(var x=0; x < ret.length; x++){
      $('ol').prepend('<li class="chat-message chat-message-friend"><div class="chat-message-bubble">' + ret[x].reaction + '</div></li>'); 
    }
  } else {
      $('ol').prepend('<li class="chat-message chat-message-friend"><div class="chat-message-bubble">' + ret.reaction + '</div></li>');  
  }
}
// Initiates pages specific scripts
afterShowScripts = function() {
  getReactions();
}

dashScripts = function() {
  getShow();
  $('#watch').click(watchShow);
  $('#dontLike').click(dislikeShow);
  $('#like').click(likeShow);
  $('#watched').click(watchedShow);
  $('#moreInfo').click(showInfo);
  
  // enable draggables to be dropped into this
  interact('.dropzone').dropzone({
  // only accept elements matching this CSS selector
  accept: '#yes-drop',
  // Require a 75% element overlap for a drop to be possible
  overlap: 0.75,

  // listen for drop related events:

  ondropactivate: function (event) {
    // add active dropzone feedback
    event.target.classList.add('drop-active');
  },
  ondragenter: function (event) {
    var draggableElement = event.relatedTarget,
        dropzoneElement = event.target;

    // feedback the possibility of a drop
    dropzoneElement.classList.add('drop-target');
    draggableElement.classList.add('can-drop');
    draggableElement.textContent = 'Dragged in';
  },
  ondragleave: function (event) {
    // remove the drop feedback style
    event.target.classList.remove('drop-target');
    event.relatedTarget.classList.remove('can-drop');
    event.relatedTarget.textContent = 'Dragged out';
  },
  ondrop: function (event) {
    event.relatedTarget.textContent = 'Dropped';
  },
  ondropdeactivate: function (event) {
    // remove active dropzone feedback
    event.target.classList.remove('drop-active');
    event.target.classList.remove('drop-target');
  }
});



}

$(document).ready(function(){
  if ($('body').hasClass("dash")) {
    dashScripts();
  } else 
  if ($('body').hasClass("after_show")) {
    afterShowScripts();
  }
});