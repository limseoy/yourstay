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
    	<div style="padding: 0px 65px 0;">
        <div class="page-header">
            <h1>공지사항</h1>
        </div>
        <c:if test="${empty listResult}">
			<tr align="center" noshade>
			   <td colspan="5">데이터가 하나도 없음</td>
			</tr>
		</c:if>
        <div class="pull-right" style="width:100px;margin:10px 0;">
            <a href="/board" class="btn btn-secondary" style="background-color: #2AC1BC !important; border-color: #2AC1BC !important;">
            등록</a>
        </div>
        <br/><br/><br/>

        <div id="mainHide">
            <table class="table table-hover">
            
                <tr>
                    <th class="col-md-1">글번호</th>
                    <th class="col-md-2">서비스분류</th>
                    <th class="col-md-5">제목</th>
                    <th class="col-md-2">작성날짜</th>
                </tr>
                <tr>
                <c:forEach items="${listResult.list}" var="board">
                    <td>${board.boardnum}</td>
                    <td>${board.category}</td>
                    <td><a href="content.do?boardnum=${board.boardnum}">
					    ${board.subject}
					  </a></td>
                    <td>${board.rdate}</td>
                </tr>
                </c:forEach>
            </table>
        </div>
    <br/>
    <hr width='600' size='2' color='gray' noshade>
<div style="margin-left: 500px;">
    (총페이지수 : ${listResult.totalPageCount})
    &nbsp;&nbsp;&nbsp;
    <c:forEach begin="1" end="${listResult.totalPageCount}" var="i">
        <a href="list.do?cp=${i}">
   			<c:choose>
   			    <c:when test="${i==listResult.cp}">
                	<strong>${i}</strong>
                </c:when>
                <c:otherwise>
                    ${i}
                </c:otherwise>
			</c:choose>
    	</a>&nbsp;
    </c:forEach>
    ( TOTAL : ${listResult.totalCount} )
    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       페이지 싸이즈 : 
    <select id="psId" name="ps" onchange="f(this)">
    	<c:choose>
    		<c:when test="${listResult.ps == 3}">
    		   <option value="3" selected>3</option>
		       <option value="5">5</option>
		       <option value="10">10</option>
    		</c:when>
    		<c:when test="${listResult.ps == 5}">
    		   <option value="3">3</option>
		       <option value="5" selected>5</option>
		       <option value="10">10</option>
    		</c:when>
    		<c:when test="${listResult.ps == 10}">
    		   <option value="3">3</option>
		       <option value="5">5</option>
		       <option value="10" selected>10</option>
    		</c:when>
    	</c:choose>
    </select>
</div>

    
    <script language="javascript">
       function f(select){
           //var el = document.getElementById("psId");
           var ps = select.value;
           //alert("ps : " + ps);
           location.href="list.do?ps="+ps;
       }
    </script>	
    <footer class="blog-footer" style="margin-top: 8%;">
         <p>
            Blog template built for <a href="https://getbootstrap.com/">Bootstrap</a>
            by <a href="https://twitter.com/mdo">@mdo</a>.
         </p>
         <p>
            <a href="#">Back to top</a>
         </p>
      </footer>
</body>
</html>