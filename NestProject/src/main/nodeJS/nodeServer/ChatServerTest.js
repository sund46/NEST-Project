var express = require('express');
var http = require('http');

var app = express();
var server = http.createServer(app);
server.listen(3000);

console.log("채팅서버 작동22");
app.get('/', function(req,res){
    res.sendfile(__dirname + '/client.html');

});

var io = require('socket.io')(server);
io.on('connect',function(socket){
    console.log("새로운 클라이언트가 서버에 들어왔습니다.");
    // io.emit('serverAllMsg',{msg : "모든 소켓에 보내는 서버 메세지입니다."})
    // socket.emit('serverMsg',{msg : "한 소켓에 보내는 서버 메세지입니다."});
    // socket.on('clientMsg',function(data){
    //     var msg = data['msg'];
    //     console.log(msg);

    socket.on('joinRoom',function(data){
        var room;
        socket.leave(room);
        room = data.room;
        socket.join(room);
        socket.emit('roomChange',{room : room});

    });

    socket.on('disconnect',function(){
        console.log('클라이언트 접속 종료');
    });

    socket.on('sendToRoom1',function(data){
        io.to('1번방').emit('resToRoom',{msg : '1번방 소켓들에게 보내는 메세지'});

    });

    socket.on('sendToRoom2',function(data){
        io.to('2번방').emit('resToRoom',{msg : '2번방 소켓들에게 보내는 메세지'});

    });

});

   
