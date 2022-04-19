<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Board Form</title>
	<!-- bootstrap-css -->
	<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"
	   media="all" />
	  <!--// bootstrap-css -->
	<!-- css -->
	<link rel="stylesheet" href="../css/blog.css" type="text/css"
	   media="all" />
	<link rel="stylesheet" href="../css/navbar.css" type="text/css"
	   media="all" />
	<link rel="stylesheet"
	   href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script
	   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	<link rel="stylesheet" href="../css/airDnDCSS.css">
		
	<!-- 구글웹폰트 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link
	   href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap"
	   rel="stylesheet">
	    
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">
    <style>
        /*html{position:relative;min-height:100%;}*/
        body{
            margin-bottom:60px;
            font-family: 'Poor Story', cursive!important;
            font-size: 20px;
        }

        body > .container{
            padding:60px 15px 0;
        }
    </style>
<%
   String memail = (String) session.getAttribute("memail");  
%>  
</head>
<body>
    <header class="blog-header py-3" style="margin-top: 1%;padding: 0px 65px 0;">
         <div
            class="row flex-nowrap justify-content-between align-items-center">
            <div class="col-4 pt-1"></div>
            <div class="col-4 text-center">
               <a class="blog-header-logo text-dark" style="font-size: 3rem;" href="/">YourTrip</a>
            </div>
            <div class="col-4 d-flex justify-content-end align-items-center">
               <a class="link-secondary" href="/" aria-label="Search"> <svg
                     xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                     fill="none" stroke="currentColor" stroke-linecap="round"
                     stroke-linejoin="round" stroke-width="2" class="mx-3" role="img"
                     viewBox="0 0 24 24">
                     <title>Search</title><circle cx="10.5" cy="10.5" r="7.5" />
                     <path d="M21 21l-5.2-5.2" /></svg>
               </a>
               <c:choose>
                  <c:when test="${msg =='failure'}">
                     <a class="btn btn-secondary" href="login/loginPage"
                        style="background-color: #2AC1BC !important; border-color: #2AC1BC !important;">Sign
                        up</a>
                  </c:when>
                  <c:when test="${msg == null}">
                     <!-- 로그인X -->

                     <%
                        if (memail == null) {
                     %>
                     <a class="btn btn-secondary" href="login/loginPage"
                        style="background-color: #2AC1BC !important; border-color: #2AC1BC !important;">Sign
                        up</a>
                     <%
                        } else {
                     %>
                     <a style="margin-top: 3%; margin-right: 3%;" href="/mypage/home"><%=memail%>님
                        반갑습니다!
                     </a>
                     <a href="/login/logout.do" class="btn btn-secondary"
                        style="background-color: #2AC1BC !important; border-color: #2AC1BC !important;">로그아웃</a>
                     <%
                        }
                     %>
                  </c:when>
                  <c:otherwise>
                     <a style="margin-top: 3%; margin-right: 3%;" href="/mypage/home"><%=memail%>님
                        반갑습니다!
                     </a>
                     <a href="/login/logout.do" class="btn btn-secondary"
                        style="background-color: #2AC1BC !important; border-color: #2AC1BC !important;">로그아웃</a>
                  </c:otherwise>
               </c:choose>
            </div>
         </div>
      </header>
<form method="post" action="delete">
<input type="hidden" value="${board.boardnum}" name="boardnum">
<div style="padding: 0px 65px 0;">
    <div class="table-responsive">
      <table class="table text-center" style="margin-top: 3%;">
        <tbody>
          <tr>
            <th scope="row" class="text-center" style="width: 20%;">서비스 분류</th>
            <td>${board.category}</td>
          </tr>
          <tr>
            <th scope="row" class="text-center">제목</th>
            <td>${board.subject}</td>
          </tr>
          <th scope="row" class="text-center">내용</th>
            <td>${board.content}</td>
          </tr>
	</tbody>
	</table>
	<h4 style="margin-left: 88%;">작성 날짜: ${board.rdate}</h4>
	<hr width='600' size='2' color='gray' noshade>
	<div class="pull-right" style="width:100px;margin:10px 0;">
      <a href="/board/list" class="btn btn-secondary" style="background-color: #2AC1BC !important; border-color: #2AC1BC !important;">
            목록 보러 가기</a>
     <c:if test="${memail=='admin'}">
      <a href="/board/modify?boardnum=${board.boardnum}" class="btn btn-secondary" style="background-color: #2AC1BC !important; border-color: #2AC1BC !important;margin-top: 10%;">
           글 수정하기</a>
      <button type="submit"class="btn btn-secondary" style="background-color: #2AC1BC !important; border-color: #2AC1BC !important;margin-top: 10%;">
           글 삭제하기</button>
     </c:if>
        </div>
	<hr width='600' size='2' color='gray' noshade>
	</div>
	</div>
	</form>
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
