<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/login.css">
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="../css/blog.css" type="text/css" media="all" />

<style>
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

.loginForm {
  width: 360px;
  padding: 8% 0 0;
  margin: auto;
}
.form {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 360px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  margin-top:60px;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.form input[type=text],input[type=password] {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
.form input[type=button] {
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #FF5A5F; /* fallback for old browsers */
  background: -webkit-linear-gradient(right, #FF5A5F, #FF5A5F);
  background: -moz-linear-gradient(right, #FF5A5F, #FF5A5F);
  background: -o-linear-gradient(right, #FF5A5F, #FF5A5F);
  background: linear-gradient(to left, #FF5A5F, #FF5A5F);
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
.form button:hover,.form button:active,.form button:focus {
  background: #43A047;
}
.form .message {
  margin: 15px 0 0;
  color: #b3b3b3;
  font-size: 12px;
}
.form .message a {
  color: #4CAF50;
  text-decoration: none;
}
.form .register-form {
  display: none;
}
.container {
  position: relative;
  z-index: 1;
  max-width: 300px;
  margin: 0 auto;
}
.container:before, .container:after {
  content: "";
  display: block;
  clear: both;
}
.container .info {
  margin: 50px auto;
  text-align: center;
}
.container .info h1 {
  margin: 0 0 15px;
  padding: 0;
  font-size: 36px;
  font-weight: 300;
  color: #1a1a1a;
}
.container .info span {
  color: #4d4d4d;
  font-size: 12px;
}
.container .info span a {
  color: #000000;
  text-decoration: none;
}
.container .info span .fa {
  color: #EF3B3A;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
   $("#password").keypress(function(e) { 
       if (e.keyCode == 13){
          var userId = $("#id").val();
           var userPw = $("#password").val();
           if(userId == ""){
               alert("아이디를 입력하세요.");
               $("#id").focus(); // 입력포커스 이동
               return; // 함수 종료
           }
           if(userPw == ""){
               alert("비밀번호를 입력하세요.");
               $("#password").focus();
               return;
           }
           // 폼 내부의 데이터를 전송할 주소
           document.form1.action="loginCheck.do"
           // 제출
           document.form1.submit();

       }   
   });

    $("#loginBtn").click(function(){
        // 태크.val() : 태그에 입력된 값
        // 태크.val("값") : 태그의 값을 변경 
        var userId = $("#id").val();
        var userPw = $("#password").val();
        if(userId == ""){
            alert("아이디를 입력하세요.");
            $("#id").focus(); // 입력포커스 이동
            return; // 함수 종료
        }
        if(userPw == ""){
            alert("비밀번호를 입력하세요.");
            $("#password").focus();
            return;
        }
        // 폼 내부의 데이터를 전송할 주소
        document.form1.action="loginCheck.do"
        // 제출
        document.form1.submit();
    });
});
</script>
 <title>Insert title here</title>
 
 </head>
 <body class="body">
<header class="blog-header py-3">
    <div class="row flex-nowrap justify-content-between align-items-center">
      <div class="col-4 pt-1">
      </div>
      <div class="col-4 text-center">
        <a class="blog-header-logo text-dark" href="/">YourStay</a>
      </div>
      <div class="col-4 d-flex justify-content-end align-items-center">
        <a class="link-secondary" href="#" aria-label="Search">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img" viewBox="0 0 24 24"><title>Search</title><circle cx="10.5" cy="10.5" r="7.5"/><path d="M21 21l-5.2-5.2"/></svg>
        </a>
        <a class="btn btn-sm btn-outline-secondary" href="login/loginPage">Sign up</a>
      </div>
    </div>
  </header>
   
   <div id="body" style="background-image: URL(img/background2.jpg); background-repeat: no-repeat; width: 100%; height:700px;">
   
      <div class="loginForm">
      <form method="post" name="form1" class="form" action="loginCheck.do">
      <c:if test="${member == null}">
         <div class="box">
            <input type="text" name="memail" id="id" class="iText" placeholder="E-mail">
            <br> 
            <input type="password" name="mpwd" id="password" class="iText" placeholder="Password">
            <br>
            <input type="button" id="loginBtn" class="loginBtn" value="로그인" style="background: linear-gradient(to left, #2AC1BC, #2AC1BC);">
                  <p class="message">ID가 없으신가요? <a href="joinPage">회원가입</a></p>
         </div>
         </c:if>
      </form>
   </div>
   </div> 
      <footer class="py-3 my-4">
         <ul class="nav justify-content-center border-bottom pb-3 mb-3">
            <li class="nav-item"><a href="/"
               class="nav-link px-2 text-muted">Home</a></li>
            <li class="nav-item"><a href="/mypage/home"
               class="nav-link px-2 text-muted">MyPage</a></li>
            <li class="nav-item"><a href="/board/list"
               class="nav-link px-2 text-muted">FAQs</a></li>
            <li class="nav-item"><a href="/Projectreview"
               class="nav-link px-2 text-muted">About</a></li>
         </ul>
         <p class="text-center text-muted">© 2021 Company, Inc</p>
      </footer>
</body>
</html>