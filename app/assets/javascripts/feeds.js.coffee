# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#feeds').imagesLoaded ->
    $('#feeds').masonry
      itemSelector: '.box'
      isFitWidth: true
  $('.iframe').colorbox
  	iframe:true
  	width:"80%" 
  	height:"80%"
		