# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

getShow = () ->
  console.log(suggest_show_url)
  $.ajax(url: suggest_show_url).done (url) ->
    $('h4').html(url)
    return
  return

ting = ->
  console.log("ting")


#$(document).ready ->
#  getShow()