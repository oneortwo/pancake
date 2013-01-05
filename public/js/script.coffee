 $(document).ready ->
  pan = 90
  tilt = 90

  $('#left').click ->
    pan -= 10
  $('#right').click ->
    pan += 10
  $('#up').click ->
    tilt += 10
  $('#down').click ->
    tilt -= 10
  $('button').click ->
    $.post 'http://localhost:1337?pan=' + pan + '&tilt=' + tilt
    console.log "sent pan: " + pan + " tilt: " + tilt