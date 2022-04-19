<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<html>
<head>
<!-- Bootstrap core CSS -->
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="/css/blog.css" rel="stylesheet">
<link href="/css/index.css" rel="stylesheet">
<!-- 구글웹폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap"
   rel="stylesheet">
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<!-- 모달 -->
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="/css/bootstrap.min.css" />
<script src="/js/bootstrap.min.js"></script>

<!-- DataTimePicker template -->
<script type="text/javascript"
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
   src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script type="text/javascript"
   src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
<link rel="stylesheet"
   href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.css" />
<!-- 인원수 -->
<link rel="stylesheet" href="../css/airDnDCSS.css">
<!-- sockJS -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<%
   String memail = (String) session.getAttribute("memail");
   long mseq = (long) session.getAttribute("mseq");
%>
<style>
body{
     margin-bottom:60px;
     font-family: 'Poor Story', cursive!important;
     font-size: 20px;
        }
</style>
<script type="text/javascript">
   $(document).ready(function() {
      // notifySend
      $('#notifySendBtn').click(function(e) {
         //let modal = $('.modal-content').has(e.target);
         //let type = '70';
         //let target = modal.find('.modal-body input').val();
         //let content = modal.find('.modal-body textarea').val();
         //let url = '${contextPath}/member/notify.do';
         let target = $("#mseq").val;
         let url = '${contextPath}/notify.do';
         // 전송한 정보를 db에 저장   
         $.ajax({
            type : 'post',
            url : '${contextPath}/notify.do',
            dataType : 'text',
            data : {
               /* target: target,
               content: content,
               type: type,
               url: url */
               target : target,
               content : content
            },
            success : function() { // db전송 성공시 실시간 알림 전송
               // 소켓에 전달되는 메시지
               // 위에 기술한 EchoHandler에서 ,(comma)를 이용하여 분리시킨다.
               //socket.send("관리자,"+target+","+content+","+url);   
               socket.send(target + "," + content);
            }
         });
      });
   });
</script>
</head>
<body>
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous">
      
   </script>
   <header class="blog-header py-3" style="margin-bottom: 5%;">
      <div
         class="row flex-nowrap justify-content-between align-items-center">
         <div class="col-4 pt-1"></div>
         <div class="col-4 text-center">
            <a class="blog-header-logo text-dark" href="/"
               style="text-decoration: none">YourTrip</a>
         </div>
         <div class="col-4 d-flex justify-content-end align-items-center">
            <a class="link-secondary" href="#" aria-label="Search"> <svg
                  xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                  fill="none" stroke="currentColor" stroke-linecap="round"
                  stroke-linejoin="round" stroke-width="2" class="mx-3" role="img"
                  viewBox="0 0 24 24">
                  <title>Search</title><circle cx="10.5" cy="10.5" r="7.5" />
                  <path d="M21 21l-5.2-5.2" /></svg>
            </a>
            <c:choose>
               <c:when test="${msg =='failure'}">
                  <a class="btn btn-secondary" href="../login/loginPage"
                     style="background-color: #2AC1BC !important; border-color: #2AC1BC !important;">Sign
                     up</a>
               </c:when>
               <c:when test="${msg == null}">
                  <!-- 로그인X -->

                  <%
                     if (memail == null) {
                  %>
                  <a class="btn btn-secondary" href="../login/loginPage"
                     style="background-color: #2AC1BC !important; border-color: #2AC1BC !important;">Sign
                     up</a>
                  <%
                     } else {
                  %>
                  <a href="/mypage/home" style="margin-top: 3%; margin-right: 3%;"><%=memail%>님
                     반갑습니다! </a>
                  <a href="../login/logout.do" class="btn btn-secondary"
                     style="background-color: #2AC1BC !important; border-color: #2AC1BC !important;">로그아웃</a>
                  <%
                     }
                  %>
               </c:when>
               <c:otherwise>
                  <a href="/mypage/home" style="margin-top: 3%; margin-right: 3%;"><%=memail%>님
                     반갑습니다! </a>
                  <a href="../login/logout.do" class="btn btn-secondary"
                     style="background-color: #2AC1BC !important; border-color: #2AC1BC !important;">로그아웃</a>
               </c:otherwise>
            </c:choose>
         </div>
      </div>
   </header>
   <form action="/res/reservation.do" method="post">
      <input type="hidden" value="${rdetail.aid}" name="aid"> <input
         type="hidden" value="<%=mseq%>" name="mseq" id="mseq"> <input
         type="hidden" value="${rdetail.apeople}" name="rpeople"> <input
         type="hidden" value="${rdetail.rstart}" name="rstart"> <input
         type="hidden" value="${rdetail.rend}" name="rend"> <input
         type="hidden" value="${rdetail.aprice}" name="rprice">
      <div class="container px-4 px-lg-5">
         <!-- Heading Row-->
         <div class="row gx-4 gx-lg-5 align-items-center my-5 ">
            <div class="col-lg-5">
               <img class="img-fluid rounded mb-4 mb-lg-0"
                  src="../../../resources/images/roomImg/${rdetail.aid}/${rdetail.ipath1}"
                  alt="..." />
            </div>
            <div class="col-lg-7">
               <h6 class="font-weight-light">${rdetail.aname}</h6>
               </br>
               <h3>${rdetail.anotice}</h3>
               </br> <span class="badge bg-warning text-dark">${rdetail.apoint}</span>
            </div>
         </div>
         <!-- content-->
         <div class="card text-white bg-secondary my-2 py-2 h-70">
            <div class="card-header">
               <p class="text-white m-0 text-center">예약 정보</p>
            </div>
            <div class="card-body">
               <p class="text-white m-0">날짜</p>
               </br>
               <div class="sort">
                  <span class="text-white">${rdetail.rstart} ~
                     ${rdetail.rend}</span>
                  <button type="button" class="btn text-white move-left"
                     data-bs-toggle="modal" data-bs-target="#date">수정</button>
               </div>
               <p class="text-white m-0">인원수</p>
               </br>
               <div class="sort">
                  <span class="text-white">${rdetail.apeople}명</span>
                  <button type="button" class="btn text-white move-left"
                     data-bs-toggle="modal" data-bs-target="#people">수정</button>
               </div>
            </div>
         </div>
         <div class="card text-white bg-secondary my-2 py-2 h-70 ">
            <div class="card-header">
               <p class="text-white m-0 text-center">가격 정보</p>
            </div>
            <div class="card-body">
               <p class="text-white m-0">요금 세부정보</p>
               </br>
               <p class="text-white">1박가격: ${rdetail.aprice}</p>
               <p class="text-white">숙박일수 : ${rdetail.days}</p>
               <p class="text-white">합계: ${rdetail.resultprice}</p>
               <div class="text-lg-end text-center">
                  <button type="button" class="btn text-white" style="flaot: right;"
                     data-bs-toggle="modal" data-bs-target="#price">가격 상세보기</button>
               </div>
            </div>
         </div>
         <div class="card text-white bg-secondary my-2 py-2 h-70 ">
            <div class="card-header">
               <p class="text-white m-0 text-center">환불 정책</p>
            </div>
            <div class="card-body">
               <p class="text-white m-3">날짜 전까지 무료 취소가 가능합니다. 날짜 체크인 전에 취소하면
                  부분 환불을 받으실 수 있습니다.</p>
               <a data-toggle="modal" href="#myModal1" class="m-3">자세히 알아보기</a>
               <p class="text-white m-3">코로나19로 인한 여행 문제에는 정상참작이 가능한 상황 정책이 적용
                  되지 않습니다.</p>
               <a data-toggle="modal" href="#myModal2" class="m-3">자세히 알아보기</a>
            </div>
         </div>
         <div class="card text-white bg-secondary my-2 py-2 h-70 ">
            <div class="card-body">
               <p class="text-white m-3">아래 버튼을 선택함으로써, 호스트가 설정한 숙소 이용규칙,
                  에어비앤비 코로나19 방역 수칙 및 게스트 환불 정책에 동의합니다.</p>
               <div class="d-grid gap-2">
                  <button id="notifySendBtn" class="btn btn-warning text-white"
                     type="submit">예약 완료하기</button>
               </div>
            </div>
         </div>
   </form>

   <!-- Modal -->

   <div class="modal fade" id="date" tabindex="-1"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title" id="exampleModalLabel">달력</h5>
               <button type="button" class="btn-close" data-bs-dismiss="modal"
                  aria-label="Close"></button>
            </div>
            <div class="modal-body">
               <div class="form-group">
                  <div class="input-group date" id="datetimepicker1"
                     data-target-input="nearest">
                     <input type="text" class="form-control datetimepicker-input"
                        data-target="#datetimepicker1" placeholder="Start-date"
                        onkeyup="invalid()" id="startdate" name="startdate">
                     <div class="input-group-append" data-target="#datetimepicker1"
                        data-toggle="datetimepicker">
                        <div class="input-group-text">
                           <i class="fa fa-calendar"></i>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="form-group">
                  <div class="input-group date" id="datetimepicker2"
                     data-target-input="nearest">
                     <input type="text" class="form-control datetimepicker-input"
                        data-target="#datetimepicker2" placeholder="Deadline"
                        onkeyup="invalid()" id="deadline" name="deadline">
                     <div class="input-group-append" data-target="#datetimepicker2"
                        data-toggle="datetimepicker">
                        <div class="input-group-text">
                           <i class="fa fa-calendar"></i>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-primary">수정</button>
               <button type="button" class="btn btn-secondary"
                  data-bs-dismiss="modal">취소</button>

            </div>
         </div>
      </div>
   </div>


   <!-- Modal -->
   <div class="modal fade" id="people" tabindex="-1"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title" id="exampleModalLabel">인원 수</h5>
               <button type="button" class="btn-close" data-bs-dismiss="modal"
                  aria-label="Close"></button>
            </div>
            <div class="modal-body">
               <div id="personnelDiv">
                  <p class="searchFont">인원수를 선택하세요</p>
                  <select id="personnel" name="apeople">
                     <option value=1>인원 1명</option>
                     <option value=2>인원 2명</option>
                     <option value=3>인원 3명</option>
                     <option value=4>인원 4명</option>
                     <option value=5>인원 5명</option>
                     <option value=6>인원 6명</option>
                  </select>
               </div>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-primary">수정</button>
               <button type="button" class="btn btn-secondary"
                  data-bs-dismiss="modal">취소</button>

            </div>
         </div>
      </div>
   </div>
   <!-- Modal -->
   <div class="modal fade" id="price" tabindex="-1"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title" id="exampleModalLabel">가격 상세보기</h5>
               <button type="button" class="btn-close" data-bs-dismiss="modal"
                  aria-label="Close"></button>
            </div>
            <div class="modal-body">가격정보를 선택하세요</div>
            <div class="modal-footer">
               <button type="button" class="btn btn-secondary"
                  data-bs-dismiss="modal">Close</button>
               <button type="button" class="btn btn-primary">Save changes</button>
            </div>
         </div>
      </div>
   </div>
   <!-- Modal -->
   <div class="modal fade" id="myModal1" tabindex="-1"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title" id="exampleModalLabel">자세히 알아보기</h5>
               <button type="button" class="btn-close" data-bs-dismiss="modal"
                  aria-label="Close"></button>
            </div>
            <div class="modal-body">환불정책 알아보기1</div>
            <div class="modal-footer">
               <button type="button" class="btn btn-secondary"
                  data-bs-dismiss="modal">Close</button>
               <button type="button" class="btn btn-primary">Save changes</button>
            </div>
         </div>
      </div>
   </div>
   <!-- Modal -->
   <div class="modal fade" id="myModal2" tabindex="-1"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title" id="exampleModalLabel">자세히 알아보기</h5>
               <button type="button" class="btn-close" data-bs-dismiss="modal"
                  aria-label="Close"></button>
            </div>
            <div class="modal-body">환불 정책알아보기2</div>
            <div class="modal-footer">
               <button type="button" class="btn btn-secondary"
                  data-bs-dismiss="modal">Close</button>
               <button type="button" class="btn btn-primary">Save changes</button>
            </div>
         </div>
      </div>
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
         <p class="text-center text-muted">© 2021 Company, Inc</p>
      </footer>
   </div>
</body>
</html>