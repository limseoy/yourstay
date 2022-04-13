<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>YourTrip</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- bootstrap-css -->
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="../css/features.css" type="text/css" media="all" />
<link rel="stylesheet" href="../css/blog.css" type="text/css" media="all" />
<!-- 구글웹폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">
<%
   String memail = (String) session.getAttribute("memail");
%>
</head>
<style>
h2, h3,p {
  font-family: 'Poor Story', cursive!important;
  }
</style>
<body>
    
<div class="container">
  <header class="blog-header py-3" style="margin-bottom: 3%;">
      <div class="row flex-nowrap justify-content-between align-items-center">
        <div class="col-4 pt-1">
        </div>
        <div class="col-4 text-center">
          <a class="blog-header-logo text-dark" href="/" style="text-decoration:none">MyPage</a>
        </div>
        <div class="col-4 d-flex justify-content-end align-items-center">
          <a class="link-secondary" href="#" aria-label="Search">
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img" viewBox="0 0 24 24"><title>Search</title><circle cx="10.5" cy="10.5" r="7.5"/><path d="M21 21l-5.2-5.2"/></svg>
          </a>
          <c:choose>
         <c:when test="${msg =='failure'}">
        <a class="btn btn-secondary" href="../login/loginPage" style="background-color: #2AC1BC!important;border-color: #2AC1BC!important;">Sign up</a>
        </c:when> 
         <c:when test="${msg == null}"> <!-- 로그인X -->
         
         <% 
            if(memail == null){
         %>
           <a class="btn btn-secondary" href="../login/loginPage" style="background-color: #2AC1BC!important;border-color: #2AC1BC!important;">Sign up</a>
          <%
            }else{
         %>
         <a style="margin-top: 3%; margin-right: 3%;" href="/mypage/home"><%=memail %>님 반갑습니다!</a>
         <a href="../login/logout.do" class="btn btn-secondary" style="background-color: #2AC1BC!important;border-color: #2AC1BC!important;">로그아웃</a>
         <%} %>
         </c:when> 
         <c:otherwise>
         <a style="margin-top: 3%; margin-right: 3%;" href="/mypage/home"><%=memail%>님 반갑습니다!</a>
         <a href="../login/logout.do" class="btn btn-secondary" style="background-color: #2AC1BC!important;border-color: #2AC1BC!important;">로그아웃</a>
         </c:otherwise>
         </c:choose>
      </div>
    </div>
  </header>

<main class="container">
<h3>나의 정보</h3>
<table class="table">
  <thead>
    <tr>
      <th>Name</th>
      <th>Email</th>
      <th>Phone Number</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>${member.mname}</td>
      <td>${member.memail}</td>
      <td>${member.mcallnum}</td>
    </tr>
  </tbody>
</table>
<div class="container px-4 py-5" id="featured-3">
<h3>바로 가기</h3><a class="btn btn-secondary" type="submit" href="roomRegister?mseq=${member.mseq}" style="background-color: #2AC1BC!important;border-color: #2AC1BC!important;">숙소 등록 하러 가기</a>
	<a class="btn btn-secondary" type="submit" href="myRoom?mseq=${member.mseq}" style="background-color: #2AC1BC!important;border-color: #2AC1BC!important;">내가 등록한 숙소 보러 가기</a>
    <div class="row g-4 py-5 row-cols-1 row-cols-lg-3">
      <div class="feature col">
          <img class="bi" id="like" width="63em" height="63em" src="../images/like.png"/>
        <h2>찜 목록</h2>
        <p>찜한 숙소들을 보고 싶으시면 아래 버튼을 눌러주세요!</p>
        <a class="btn btn-secondary" type="submit" href="wishlist/${member.mseq}" style="background-color: #2AC1BC!important;border-color: #2AC1BC!important;">찜 목록</a>
      </div>
      <div class="feature col">
      <img class="bi" id="reservation" width="63em" height="63em" src="../images/reservation.png"/>
        <h2>예약 목록</h2>
        <p>예약 목록을 보고 싶으시면 아래 버튼을 눌러주세요!</p>
        <a class="btn btn-secondary" type="submit" href="roomReservation?mseq=${member.mseq}" style="background-color: #2AC1BC!important;border-color: #2AC1BC!important;">예약 목록</a>
      </div>
      <div class="feature col">
        <img class="bi" id="review" width="63em" height="63em" src="../images/review.png"/>
        <h2>리뷰 쓰러 가기</h2>
        <p>방문하셨던 숙소의 리뷰를 쓰고 싶으시면 아래 버튼을 눌러주세요!</p>
        <input type="hidden" name="mseq" value="${member.mseq}">
        <a class="btn btn-secondary" type="submit" href="roomHistory?mseq=${member.mseq}" style="background-color: #2AC1BC!important;border-color: #2AC1BC!important;">리뷰 쓰러 가기</a>
      </div>
    </div>
  </div>
</main>
<footer class="blog-footer">
  <p>Blog template built for <a href="https://getbootstrap.com/">Bootstrap</a> by <a href="https://twitter.com/mdo">@mdo</a>.</p>
  <p>
    <a href="#">Back to top</a>
  </p>
</footer>
    
  </body>
</html>