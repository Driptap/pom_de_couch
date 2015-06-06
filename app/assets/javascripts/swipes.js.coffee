# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

getShow = ->
  $('marquee > h2').text 'loading track.. '
  $.ajax(url: '<%= url_for(swipes_suggest_show_path) %>').done (url) ->
    $('h1').html(url)
    return
  return

storeTrackInfo = (tags) ->
  $.post '/users/1/store_track_info', {
    track_title: tags.title
    track_album: tags.album
    track_artist: tags.artist
  }, (returnedData) ->
    console.log returnedData
    return
  return

$(document).ready ->
  getShow()