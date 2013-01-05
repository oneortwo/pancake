 $(document).ready ->
  pan_limit = [0, 180]
  tilt_limit = [70, 130]
  width = parseInt $('#touch').width()
  height = parseInt $('#touch').height()
  left = parseInt $('#touch').position().left
  top = parseInt $('#touch').position().top

  pan = 90
  tilt = 90

  socket = io.connect '192.168.1.67'
  socket.on 'news', (data) ->
    console.log data
    socket.emit 'my other event', { my: 'data' }

  $("#touch").hammer().bind "tap", (ev) ->
    x = ((ev.position[0].x - left) / width)*(pan_limit[1] - pan_limit[0])+pan_limit[0]
    y = ((ev.position[0].y - top) / height)*(tilt_limit[1] - tilt_limit[0])+tilt_limit[0]
    console.log "x: " + x + " y: " + y
    socket.emit 'pan', {value: x}
    socket.emit 'tilt', {value: y}