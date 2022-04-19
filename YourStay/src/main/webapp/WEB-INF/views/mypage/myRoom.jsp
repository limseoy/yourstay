<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/blog.css" rel="stylesheet"> 
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
        <a class="blog-header-logo text-dark" href="/" style="text-decoration:none">YourStay</a>
      </div>
      <div class="col-4 d-flex justify-content-end align-items-center">
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

<main>
  <div class="album py-5">
    <div class="container">
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
      <c:forEach items="${vo}" var="vo">
      <form action="modifyRoom" method="get">
      <input type="hidden" name="aid" value="${vo.aid}">
      <input type="hidden" name="mseq" value="${vo.mseq}">
        <div class="col">
          <div class="card shadow-sm">
            <img class="cover" src="../../../resources/images/roomImg/${vo.aid}/${vo.ipath1}"/>
            <div class="card-body">
              <p class="card-text">숙소 위치: ${vo.aloc}<br/>숙소 이름: ${vo.aname}<br/>숙소 번호: ${vo.aid}</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="submit" class="btn btn-sm btn-outline-secondary" style="padding: 5px 30px;">숙소 수정하러 가기</button>
                  </form>
                  &nbsp; &nbsp; &nbsp;
                  <form action="delete" method="post">
               <input type="hidden" name="aid" value="${vo.aid}">
                  <button type="submit" class="btn btn-sm btn-outline-secondary deleteMyRoom" style="padding: 5px 30px;">숙소 삭제하기</button>
                </form>
                </div>
              </div>
            </div>
          </div>
        </div>
        
        </c:forEach>
      </div>
    </div>
  </div>
</main>

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