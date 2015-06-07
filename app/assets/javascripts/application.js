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

// Gets a suggested show
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
  $.get(watch_show_url, { }, 
    function(ret){
     populateShowDetails(ret);
    }
  )
}
// Posts a watched show 
watchedShow = function() {
  $.get(watched_show_url, { }, 
    function(ret){
     populateShowDetails(ret);
    }
  )
}
// Loads show into view
populateShowDetails = function(ret) {
  $('#showTitle').text(ret.title);
  $('#showGenre').text(ret.genre);
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
$(document).ready(function(){
  getShow();
  getReactions();
});