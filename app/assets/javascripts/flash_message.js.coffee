show_ajax_message = (msg, type) ->
  $("#flash-messages").append "<a class=\"close\" data-dismiss=\"alert\">&#215;</a><div class='alert alert-#{type}'>#{msg}</div>"
 
$(document).ajaxComplete (event, request) ->
  msg = request.getResponseHeader("X-Message")
  type = if request.getResponseHeader("X-Message-Type") == "notice" then "success" else "error"
  show_ajax_message msg, type #use whatever popup, notification or whatever plugin you want
