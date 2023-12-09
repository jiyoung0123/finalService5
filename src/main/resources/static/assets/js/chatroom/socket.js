'use strict';

// document.write("<script src='jquery-3.6.1.js'></script>")
document.write("<script\n" +
    "  src=\"https://code.jquery.com/jquery-3.6.1.min.js\"\n" +
    "  integrity=\"sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=\"\n" +
    "  crossorigin=\"anonymous\"></script>")


var usernamePage = document.querySelector('#username-page');
var chatPage = document.querySelector('#chat-page');
var usernameForm = document.querySelector('#usernameForm');
var messageForm = document.querySelector('#messageForm');
var messageInput = document.querySelector('#message');
var messageArea = document.querySelector('#messageArea');
var connectingElement = document.querySelector('.connecting');

var stompClient = null;
var username = null;

var colors = [
    '#2196F3', '#32c787', '#00BCD4', '#ff5652',
    '#ffc107', '#ff85af', '#FF9800', '#39bbb0'
];

// roomId 파라미터 가져오기
const url = new URL(location.href).searchParams;
const roomId = url.get('roomId');

function connect(event) {
    username = document.querySelector('#name').value.trim();
    console.log(username);

    // username 중복 확인
    isDuplicateName();

    // usernamePage 에 hidden 속성 추가해서 가리고
    // chatPage 를 등장시킴
    usernamePage.classList.add('hidden');
    chatPage.classList.remove('hidden');

    // 연결하고자하는 Socket 의 endPoint
    var socket = new SockJS('http://172.16.20.78:8088/randomWs');
    stompClient = Stomp.over(socket);
    stompClient.connect({}, onConnected, onError);
    event.preventDefault();
}

function onConnected() {

    // sub 할 url => /sub/chat/room/roomId 로 구독한다
    stompClient.subscribe('/sub/chat/room/'+ roomId, onMessageReceived);
    stompClient.subscribe('/sub/chat/room/'+ roomId, function(chat){
        console.log(chat);
        //$("#messageArea").prepend( JSON.parse(chat.body).sendid);
    });
    console.log("onMessageReceived 연결해보쟈~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");

    // 서버에 username 을 가진 유저가 들어왔다는 것을 알림
    // /pub/chat/enterUser 로 메시지를 보냄
    stompClient.send("/pub/chat/enterUser",
        {},
        JSON.stringify({
            'roomId': roomId,
            sendid: username,
            type: 'ENTER'
        })
    )
    connectingElement.classList.add('hidden');
}

// 유저 닉네임 중복 확인
function isDuplicateName() {
    $.ajax({
        type: "GET",
        url: "/chat/duplicateName",
        data: {
            "username": username,
            "roomId": roomId
        },
        success: function (data) {
            console.log("함수 동작 확인 : " + data);

            username = data;
        }
    })

}

// 유저 리스트 받기
// ajax 로 유저 리스를 받으며 클라이언트가 입장/퇴장 했다는 문구가 나왔을 때마다 실행된다.
function getUserList(userName) {
    const $list = $('#list');
    console.log("userName들어오냐??"+userName);
    // var users = "";
    // users = "<li class='dropdown-item'>" + userName + "</li>"

    var listItem = "<li class='dropdown-item'>" + userName + "</li>";
    $list.append(listItem);
    // $list.html(users);
    // $.ajax({
    //     type: "GET",
    //     url: "/pub/chat/userlist",
    //     data: {
    //         "roomId": roomId,
    //         "userId":chat.sendid
    //     },
    //     success: function (data) {
    //         var users = "";
    //         for (let i = 0; i < data.length; i++) {
    //             //console.log("data[i] : "+data[i]);
    //             users += "<li class='dropdown-item'>" + data[i] + "</li>"
    //         }
    //         $list.html(users);
    //     }
    // })
}

function minusUserList(userName){
    const $list = $('#list');
    console.log("userName들어오냐??"+userName);
    $list.find('li').each(function() {
        if ($(this).text().trim() === userName.trim()) {
            $(this).remove();
        }
    });
}


function onError(error) {
    connectingElement.textContent = 'Could not connect to WebSocket server. Please refresh this page to try again!';
    connectingElement.style.color = 'red';
}

// 메시지 전송때는 JSON 형식을 메시지를 전달한다.
function sendMessage(event) {
    var messageContent = messageInput.value.trim();

    if (messageContent && stompClient) {
        var chatMessage = {
            roomId: roomId,
            sendid: username,
            content1: messageInput.value,
            type: 'TALK'
        };

        stompClient.send("/pub/chat/sendMessage", {}, JSON.stringify(chatMessage));
        // messageArea.innerHTML = JSON.stringify(chatMessage.content1);
        // messageArea.appendChild(JSON.stringify(chatMessage.content1));
        // messageArea.scrollTop = messageArea.scrollHeight;
        messageInput.value = '';


    }
    event.preventDefault();
}



//
// 메시지를 받을 때도 마찬가지로 JSON 타입으로 받으며,
// 넘어온 JSON 형식의 메시지를 parse 해서 사용한다.
function onMessageReceived(payload) {
    console.log("payload 들어오냐? :"+payload);
    // var chat = payload.body;
    // console.log(chat.sendid);
    var chat = JSON.parse(payload.body);
    console.log(chat.type); // "TALK"
    console.log(chat.roomId); // "d52379d5-0fbb-43fa-aba3-aebc9bdc1a9e"
    console.log(chat.sendid); // "서지영"
    console.log(chat.content1); // "dd"

    var messageElement = document.createElement('li');

    if (chat.type === 'ENTER') {  // chatType 이 enter 라면 아래 내용
        messageElement.classList.add('event-message');
        chat.content = chat.sendid + chat.content1;
        console.log("-------------------------------------------------");
        var messageText = document.createTextNode(chat.content1);
        messageElement.appendChild(messageText);
        let userName = chat.sendid;
        console.log(userName);
        getUserList(userName);

    } else if (chat.type === 'LEAVE') { // chatType 가 leave 라면 아래 내용
        messageElement.classList.add('event-message');
        chat.content = chat.sendid + chat.content1;
        console.log("-------------------------------------------------");
        console.log(chat.content);
        var messageText = document.createTextNode(chat.content1);
        messageElement.appendChild(messageText);
        let userName = chat.sendid;
        // getUserList();
        minusUserList(userName);

    } else { // chatType 이 talk 라면 아래 내용
        messageElement.classList.add('chat-message');

        var avatarElement = document.createElement('i');
        var avatarText = document.createTextNode(chat.sendid[0]);
        var messageText = document.createTextNode(chat.content1);
        avatarElement.appendChild(avatarText);
        avatarElement.style['background-color'] = getAvatarColor(chat.sendid);
        messageElement.appendChild(avatarElement);

        var usernameElement = document.createElement('span');
        var usernameText = document.createTextNode(chat.sendid);
        usernameElement.appendChild(usernameText);
        messageElement.appendChild(usernameElement);

        var colonText = document.createTextNode(":");
        messageElement.appendChild(colonText);
        messageElement.appendChild(messageText);
    }

    var contentElement = document.createElement('p');


    // 말하는 사람 이름 성 붙여주는것
    messageElement.appendChild(contentElement);
    messageArea.appendChild(messageElement);
    messageArea.scrollTop = messageArea.scrollHeight;

}


function getAvatarColor(messageSender) {
    var hash = 0;
    for (var i = 0; i < messageSender.length; i++) {
        hash = 31 * hash + messageSender.charCodeAt(i);
    }

    var index = Math.abs(hash % colors.length);
    return colors[index];
}

usernameForm.addEventListener('submit', connect, true)
messageForm.addEventListener('submit', sendMessage, true)
messageForm.addEventListener('submit', onMessageReceived, true)

/// 파일 업로드 부분 ////
function uploadFile(){
    var file = $("#file")[0].files[0];
    var formData = new FormData();
    formData.append("file",file);
    formData.append("roomId", roomId);

    // 확장자 추출
    var fileDot = file.name.lastIndexOf(".");

    // 확장자 검사
    var fileType = file.name.substring(fileDot + 1, file.name.length);
    // console.log("type : " + fileType);

    if (!(fileType == "png" || fileType == "jpg" || fileType == "jpeg" || fileType == "gif"))
    {
        alert("파일 업로드는 png, jpg, gif, jpeg 만 가능합니다");
        return;
    }

    // ajax 로 multipart/form-data 를 넘겨줄 때는
    //         processData: false,
    //         contentType: false
    // 처럼 설정해주어야 한다.

    // 동작 순서
    // post 로 rest 요청한다.
    // 1. 먼저 upload 로 파일 업로드를 요청한다.
    // 2. upload 가 성공적으로 완료되면 data 에 upload 객체를 받고,
    // 이를 이용해 chatMessage 를 작성한다.
    $.ajax({
        type : 'POST',
        url : '/s3/upload',
        data : formData,
        processData: false,
        contentType: false
    }).done(function (data){
        // console.log("업로드 성공")

        var chatMessage = {
            "roomId": roomId,
            sendid: username,
            content1: username+"님의 파일 업로드",
            type: 'TALK',
            s3DataUrl : data.s3DataUrl, // Dataurl
            "fileName": file.name, // 원본 파일 이름
            "fileDir": data.fileDir // 업로드 된 위치
        };

        // 해당 내용을 발신한다.
        stompClient.send("/pub/chat/sendMessage", {}, JSON.stringify(chatMessage));
    }).fail(function (error){
        alert(error);
    })
}

// 파일 다운로드 부분 //
// 버튼을 누르면 downloadFile 메서드가 실행됨
// 다운로드 url 은 /s3/download+원본파일이름
function downloadFile(name, dir){
    // console.log("파일 이름 : "+name);
    // console.log("파일 경로 : " + dir);
    let url = "/s3/download/"+name;

    // get 으로 rest 요청한다.
    $.ajax({
        url: "/s3/download/"+name, // 요청 url 은 download/{name}
        data: {
            "fileDir" : dir // 파일의 경로를 파라미터로 넣는다.
        },
        dataType: 'binary', // 파일 다운로드를 위해서는 binary 타입으로 받아야한다.
        xhrFields: {
            'responseType': 'blob' // 여기도 마찬가지
        },
        success: function(data) {

            var link = document.createElement('a');
            link.href = URL.createObjectURL(data);
            link.download = name;
            link.click();
        }
    });
}