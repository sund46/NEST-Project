var express = require('express');
var http = require('http');

var app = express();
var server = http.createServer(app);
server.listen(3000);

console.log("채팅서버 작동");

// ------------------------ DB 연결 ------------------------//
const MongoClient = require('mongodb').MongoClient;
const assert = require('assert');

// Connection URL
const url = 'mongodb://localhost:27017';

// Database Name
const dbName = 'myproject';

// Create a new MongoClient
const client = new MongoClient(url,{ useNewUrlParser: true });

var io = require('socket.io')(server);

// MongoDB 연결
var db = "";
client.connect(function(err) {
	  assert.equal(null, err);
	  console.log("MongoDB와 연결되었습니다.");  
	   db = client.db(dbName);
});



io.on('connect',function(socket){
    console.log("새로운 클라이언트가 서버에 들어왔습니다.");

    	
      // 메세지 전송 이벤트 발생시
  	  socket.on('sendMsg',function(data){
    	// 상대방과 자신의 채팅창에 전송 메세지를 띄우기 위한 이벤트
  		
    	io.to(data.roomNo).emit('serverResponse', {msg : data.msg, sender : data.sender, receiver:data.receiver } );
    	
    		// DB에 채팅 내역 저장
    	  insertDocuments(db,data,function() {
           
    		  
    	  });
    	
  	   });
  	   // 상대방과의 채팅로그 요청하는 이벤트 발생 시
  	   socket.on('callChatLogs',function(data){
  
  		   findDocuments(db,data,function(logs){
  			  console.log("보내는 로그들 : " + logs);
  			 socket.emit('returnChatLogs',{logs:logs});
  			   
  		   });
  		   
  	   });
    
    
    
    
    // io.emit('serverAllMsg',{msg : "모든 소켓에 보내는 서버 메세지입니다."})
    // socket.emit('serverMsg',{msg : "한 소켓에 보내는 서버 메세지입니다."});
    // socket.on('clientMsg',function(data){
    //     var msg = data['msg'];
    //     console.log(msg);

    // 한 유저가 메세지를 전송했을 때 (DB에 저장 + 브로드 캐스팅 필요)
    
    	
    	// 브로드 캐스팅
    	
    	// 나중에는 룸번호 받아와서 줄거임
//    	var room = data.room;
//    	var room = 1;
//        io.to('1').emit('resToRoom',{msg : data.msg});
        
    	// Use connect method to connect to the Server
    
  	// 상대방과 채팅을 시작하려 할때 이벤트 리스폰
    socket.on('joinRoom',function(data){
    
    	var roomNo = data;
        socket.join(data.roomNo);
      
    });
    
  	// 소켓 접속 해제 시 
    socket.on('disconnect',function(){
    	
        console.log('클라이언트 접속 종료');
    });

    
});

   	
const insertDocuments = function(db,data,callback) {
	  // Get the documents collection
	  const collection = db.collection('chatlogs');
	  // Insert some documents
	  console.log("디비 인서트");
	  collection.insertOne({receiver:data.receiver,sender:data.sender,content:data.msg,date:Date()}), 
	 
	  function(err, result) {
	    assert.equal(err, null);
	    assert.equal(3, result.result.n);
	    assert.equal(3, result.ops.length);
	    callback(result);
	  }
}

const findDocuments = function(db,data,callback) {
	  // Get the documents collection
	  const collection = db.collection('chatlogs');
	  // Find some documents
	  collection.find({'sender': {$in:[data.sender,data.receiver]}, 'receiver':{$in:[data.receiver,data.sender]}}).toArray(function(err, docs) {
	    assert.equal(err, null);
	    console.log("채팅 로그 불러오기 성공");
	    console.log(docs);
	    callback(docs);
	  });
}
