var express = require('express')
var app = express()

app.get('/', function (req, res) {
  res.header('Access-Control-Allow-Origin', '*');
  res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
  res.header('Access-Control-Allow-Headers', 'Content-Type');

  res.json({ emoji: random() })
})

app.listen(3000, function () {
  console.log('Example app listening on port 3000!')
})

function random() {
	return list[Math.floor(Math.random() * list.length)];
}


var list = ["🍕", "🌳", "💯", "😂", "😱", "😷", "👹", "🌮", "🎯"];
console.log(list);
