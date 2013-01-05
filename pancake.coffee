arduino = require 'johnny-five'
http = require 'http'
url = require 'url'
connect = require 'connect'

board = new arduino.Board()

board.on "ready", ->

  pan = arduino.Servo(5)
  tilt = arduino.Servo
    pin: 6
    range: [ 70, 130 ]

  s1 = http.createServer (req, res) ->
    query = url.parse(req.url, true).query

    console.log query

    #if query.led is 'on' then led.on() else led.off()
    if query.pan
      pan.move(query.pan)
      console.log "wrote " + query.pan + " to pan"
    if query.tilt
      tilt.move(query.tilt)
      console.log "wrote " + query.tilt + " to tilt"
    res.end 'done!\n'
    res.writeHead 200, {'Content-Type': 'text/plain'}

  c1 = connect.createServer(
    connect.static("public")
  ).use (req, res) ->
    console.log req.url
    res.end 'hello world\n'

  pan.center()
  tilt.center()

  server = connect().use(connect.static('public')).use (req, res) ->
    console.log req.url
    res.end 'hello world\n'

  # c3 = connect().createServer.use (req, res) ->
  #   console.log req
  #   res.end 'hello worldddd\n'

  s1.listen 1337
  c1.listen 8080
  server.listen 3000
  # c3.listen 3030
  
  console.log "servers started"