$ ->
  if $('#reinforcement_timer_show').length != 0
    utc_time = $('#reinforcement_timer_expires_at').text()
    $('#reinforcement_timer_countdown').countdown({until: new Date(utc_time)})
