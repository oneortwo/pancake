arduino = require 'johnny-five'
express = require 'express'
app = express()
server = require('http').createServer(app)
io = require('socket.io').listen(server)

board = new arduino.Board()

server.listen(8000)

app.configure ->
  app.use(express.static(__dirname + '/public'))

board.on 'ready', ->
  pan = arduino.Servo(5)
  tilt = arduino.Servo
    pin: 6
    range: [ 70, 130 ]

  io.sockets.on 'connection', (socket) ->
    socket.emit 'news', { hello: 'world' }
    socket.on 'pan', (data) ->
      pan.move data.value
      console.log "pan " + data.value
    socket.on 'tilt', (data) ->
      tilt.move data.value
      console.log "tilt " + data.value

  pan.center()
  tilt.center()