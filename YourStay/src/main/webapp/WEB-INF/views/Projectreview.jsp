<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/carousel.css" rel="stylesheet"> 
<link rel="stylesheet" href="../css/blog.css">
<link href="/css/footers.css" rel="stylesheet">
<!-- 구글웹폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap"
   rel="stylesheet">
<script type="text/javascript" language="javascript" 
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<style>
	body{
		font-family: 'Poor Story', cursive;
	}
</style>
<%
   String memail = (String) session.getAttribute("memail");
%>  
</head>
<body>
    
<header class="blog-header py-3" style="margin-bottom: 5%;">
    <div class="row flex-nowrap justify-content-between align-items-center">
      <div class="col-4 pt-1">
      </div>
      <div class="col-4 text-center">
        <a class="blog-header-logo text-dark" href="/" style="text-decoration:none">YourTrip</a>
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
         <a href="/mypage/home" style="margin-top: 3%; margin-right: 3%;"><%=memail %>님 반갑습니다!</a>
         <a href="../login/logout.do" class="btn btn-secondary" style="background-color: #2AC1BC!important;border-color: #2AC1BC!important;">로그아웃</a>
         <%} %>
         </c:when> 
         <c:otherwise>
         <a href="/mypage/home" style="margin-top: 3%; margin-right: 3%;"><%=memail%>님 반갑습니다!</a>
         <a href="../login/logout.do" class="btn btn-secondary" style="background-color: #2AC1BC!important;border-color: #2AC1BC!important;">로그아웃</a>
         </c:otherwise>
         </c:choose>
      </div>
    </div>
  </header>

<div class="container marketing">

    <!-- Three columns of text below the carousel -->
    <div class="row">
      <div class="col-lg-4">
        <img src="../images/조한영.jpg" class="bd-placeholder-img rounded-circle" width="220" height="230" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/></svg>

        <h2>선장 이재성</h2>
        <p>Some representative placeholder content for the three columns of text below the carousel. This is the first column.</p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
        <img src="../images/조한영.jpg" class="bd-placeholder-img rounded-circle" width="220" height="230" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/></svg>

        <h2>선원 조한영</h2>
        <p>MVC Model2 패턴의 데이터 이동 및 기능에 대해서 정확히 잘 몰랐지만, 이번 프로젝트를 통해 조금 더 자세히 알게 되었습니다. 또, 팀단위의 협업을 통해서 어려운 부분에 대한 개선을 하다보니 점차적으로 흥미가 생겼습니다.</p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
        <img src="../images/조한영.jpg" class="bd-placeholder-img rounded-circle" width="220" height="230" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/></svg>

        <h2>선원 임서영</h2>
        <p>Some representative placeholder content for the three columns of text below the carousel. This is the first column.</p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
        <img src="../images/허희진.jpg" class="bd-placeholder-img rounded-circle" width="220" height="230" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/></svg>

        <h2>선원 허희진</h2>
        <p>프로젝트를 하며 그 동안 배운 Spring, JSP, RDBMS등을 좀 더 깊이 있게 이해할 수 있었고, 오류에 따른 대처 방법과 협업이 얼마나 중요한 지 느꼈습니다. 많은 시행착오가 있었지만 서로 배려하고 도와주는 팀원들 덕분에 힘든 프로젝트 기간에 즐겁고, 웃으며 진행해 나갈 수 있었습니다.</p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
        <img src="../images/조한영.jpg" class="bd-placeholder-img rounded-circle" width="220" height="230" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/></svg>

        <h2>선원 김민경</h2>
        <p>Some representative placeholder content for the three columns of text below the carousel. This is the first column.</p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
        <img src="../images/신현민.jpg" class="bd-placeholder-img rounded-circle" width="220" height="230" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/></svg>
        <h2>선원 신현민</h2>
        <p>개인이 아닌 팀으로 움직이며 이슈 및 정보 공유, 상황 설명, 지속적인 의견 조율 등 혼자서는 해결할 수 없는 문제를 협업을 통해 문제 해결의 길을 열 수 있었다.</p>
        
      </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->
    </div>


<!-- 푸터 -->
   <div class="container">
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
         <p class="text-center text-muted">© 2022 Company, Inc</p>
      </footer>
   </div>


   <!--  <script src="../assets/dist/js/bootstrap.bundle.min.js"></script> -->

      
  </body>
</html>
