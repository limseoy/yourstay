<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>Spring Boot WebSocket Chat Application</title>
    <link rel="stylesheet" href="/css/chat.css" />
    <script>
    function c() {
        username = document.querySelector('#name').value.trim();

        if(username) {
            usernamePage.classList.add('hidden');
            chatPage.classList.remove('hidden');

            var socket = new SockJS('/ws'); //소켓 연결
            stompClient = Stomp.over(socket);

            stompClient.connect({}, onConnected, onError);
          //~ (void) connect(headers, connectCallback, errorCallback)
          //onConnected - connect 콜백 함수
          //onError - error 콜백 함수
        }
        event.preventDefault();
    }
    </script>
</head>
<body onload="c()">

<div id="username-page">
    <div class="username-page-container">
        <h1 class="title">username을 입력하세요</h1>
        <form id="usernameForm" name="usernameForm">
            <div class="form-group">
                <input type="text" id="name" placeholder="Username" value="${loginOkUser.mname}" autocomplete="off" class="form-control" />
            </div>
            <div class="form-group">
                <button type="submit" class="accent username-submit">채팅 시작하기</button>
            </div>
        </form>
    </div>
</div>
<!--  <input type="hidden" id="aid" value="${aid}"/>-->
<div id="chat-page" class="hidden">
    <div class="chat-container">
        <div class="chat-header">
            <h2>Spring WebSocket Chat Demo</h2>
        </div>
        <div class="connecting">
            연결중...
        </div>
        <ul id="messageArea">

        </ul>
        <form id="messageForm" name="messageForm">
            <div class="form-group">
                <div class="input-group clearfix">
                    <input type="text" id="message" placeholder="Type a message..." autocomplete="off" class="form-control"/>
                    <button type="submit" class="primary">보내기</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="/js/main.js"></script>
</body>
</html>