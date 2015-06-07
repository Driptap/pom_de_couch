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
//= require TweenMax.min
//= require chat
//= require turbolinks
//= require_tree .

getShow = function() {
  $.get(suggest_show_url, {}, 
    function(ret){
      populateShowDetails(ret);   
    }
  )
}

likeShow = function() {
  $.get(like_show_url, { }, 
    function(ret){
     populateShowDetails(ret);
    }
  )
}

dislikeShow = function() {
  $.get(dislike_show_url, { }, 
    function(ret){
      populateShowDetails(ret);
    }
  )
}

watchShow = function() {
  $.get(watch_show_url, { }, 
    function(ret){
     populateShowDetails(ret);
    }
  )
}

watchedShow = function() {
  $.get(watched_show_url, { }, 
    function(ret){
     populateShowDetails(ret);
    }
  )
}

populateShowDetails = function(ret) {
  $('#showTitle').text(ret.title);
  $('#showGenre').text(ret.genre);
  $('#showImg').attr("src", ret.img_link);
}

$(document).ready(function(){
  getShow();
});

submitReaction = function() {
  $.post(new_reaction_url, {reaction: $('input').val() }, 
    function(ret){
      populateReactions(ret);
      console.log(ret);
    }
  )
}
var f;
getReactions = function() {
  $.get(get_reactions_url, {}, 
    function(ret){
      populateReactions(ret);
      console.log(ret);
    }
  )
}

populateReactions = function(ret) {
  if(ret.constructor === Array){ 
    for(var x=0; x < ret.length; x++){
      $('ol').prepend('<li class="chat-message chat-message-friend"><div class="chat-message-bubble">' + ret[x].reaction + '</div></li>'); 
    }
  } else {
      $('ol').prepend('<li class="chat-message chat-message-friend"><div class="chat-message-bubble">' + ret.reaction + '</div></li>');  
  }
}




