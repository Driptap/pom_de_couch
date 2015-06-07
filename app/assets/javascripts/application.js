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
//= require turbolinks
//= require_tree .

// Gets a suggested show
var blah;
getShow = function() {
  $.get(suggest_show_url, {}, 
    function(ret){
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
  blah = ret;

  $('#showTitle').text(ret.show.title);
  //$('#showGenre').text(ret.genre);
  $('#showImg').attr("src", ret.show.img_link);
  $('.profilePic > img').attr("src", ret.reaction_author.fb_profile_picture);
  $('#reaction').text(ret.reaction.reaction);
  $('#namez').text(ret.reaction_author.name);


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
        blah = ret;
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
}

$(document).ready(function(){
  if ($('body').hasClass("dash")) {
    dashScripts();
  } else 
  if ($('body').hasClass("after_show")) {
    afterShowScripts();
  }
});