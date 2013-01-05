 $(document).ready ->
  pan = 90
  tilt = 90

  socket = io.connect '192.168.1.67'
  socket.on 'news', (data) ->
    console.log data
    socket.emit 'my other event', { my: 'data' }

  $('#left').click ->
    pan -= 10
    socket.emit 'pan', {value: pan}
  $('#right').click ->
    pan += 10
    socket.emit 'pan', {value: pan}
  $('#up').click ->
    tilt += 10
    socket.emit 'tilt', {value: tilt}
  $('#down').click ->
    tilt -= 10
    socket.emit 'tilt', {value: tilt}
  $('button').click ->
    console.log "sent pan: " + pan + " tilt: " + tilt