// Generated by CoffeeScript 1.4.0
(function() {

  $(document).ready(function() {
    var pan, tilt;
    pan = 90;
    tilt = 90;
    $('#left').click(function() {
      return pan -= 10;
    });
    $('#right').click(function() {
      return pan += 10;
    });
    $('#up').click(function() {
      return tilt += 10;
    });
    $('#down').click(function() {
      return tilt -= 10;
    });
    return $('button').click(function() {
      $.post('http://localhost:1337?pan=' + pan + '&tilt=' + tilt);
      return console.log("sent pan: " + pan + " tilt: " + tilt);
    });
  });

}).call(this);
