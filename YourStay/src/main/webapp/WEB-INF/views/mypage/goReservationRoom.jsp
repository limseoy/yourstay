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
               <a class="blog-header-logo text-dark" style="font-size: 3rem;" href="/">YourStay</a>
            </div>
            <div class="col-4 d-flex justify-content-end align-items-center">
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
<div style="padding: 0px 65px 0;">
    <div class="table-responsive" style="margin-top: 2%;">
      <table class="table text-center" style="margin-top: 3%;">
        <tbody>
          <tr>
            <th scope="row" class="text-center" style="width: 20%;">숙소 위치</th>
            <td>${vo[0].aloc}</td>
          </tr>
          <th scope="row" class="text-center">숙소 이름</th>
            <td>${vo[0].aname}</td>
          </tr>
          <th scope="row" class="text-center">숙소 1박 당 가격</th>
            <td>${vo[0].aprice}</td>
          </tr>
          <tr>
            <th scope="row" class="text-center">제목</th>
            <td>${vo[0].rstart} ~ ${vo[0].rend}</td>
          </tr>
          <tr>
            <th scope="row" class="text-center">숙소 예약한 사람</th>
            <td>${vo[0].mname}</td>
          </tr>
   </tbody>
   </table>
      <div style="margin-left: 45%">
   <button class="btn btn-secondary" style="background-color: #2AC1BC !important; border-color: #2AC1BC !important;">예약 수락하기</button>
   <button class="btn btn-secondary" style="background-color: #2AC1BC !important; border-color: #2AC1BC !important;">예약 거절하기</button>
   <hr width='600' size='2' color='gray' noshade>
        </div>
   <hr width='600' size='2' color='gray' noshade>
   </div>
   </div>
      <footer class="py-3 my-4" style="margin-top: 13%!important;">
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
</body>
</html>