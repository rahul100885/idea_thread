# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $("#attach_more").click ->
    $("#upload_box").after "<div class=\"controls\", id=\"upload_box\" > <input name=\"idea[documents_attributes][][data]\" type=\"file\"></div>"
    false
