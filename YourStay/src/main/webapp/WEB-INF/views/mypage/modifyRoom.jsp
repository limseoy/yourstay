<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>YourTrip</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
   content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<!-- bootstrap-css -->
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"
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

<!--// bootstrap-css -->
<!-- css -->
<link rel="stylesheet" href="../css/blog.css" type="text/css"
   media="all" />
<link rel="stylesheet" href="../css/navbar.css" type="text/css"
   media="all" />
<%
   String memail = (String) session.getAttribute("memail");
%>
</head>
<style>
p {
   font-family: 'Poor Story', cursive !important;
}
</style>
<script>
   function f() {
      input.aname.value = "";
      input.aloc.value = "";
      input.aprice.value = "";
      input.rnum.value = "";
      input.tnum.value = "";
      input.bnum.value = "";
      input.ures.value = "";
      input.ucafe.value = "";
      input.ucon.value = "";
      input.iid.value = "";
      input.uact.value = "";

      //input.content.innerText = "";

      input.aname.focus();
   }
</script>
<body>

   <div class="container">
      <header class="blog-header py-3" style="margin-bottom: 5%;">
         <div
            class="row flex-nowrap justify-content-between align-items-center">
            <div class="col-4 pt-1"></div>
            <div class="col-4 text-center">
               <a class="blog-header-logo text-dark" href="/">YourTrip</a>
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

      <main class="container">
         <form name="roomoption" method="post" action="/mypage/modifyRoom" enctype="multipart/form-data">
         
            <input type="hidden" name="mseq" value="${vo[0].mseq}">
            <input type="hidden" name="aid" value="${vo[0].aid}">
            <div class="row mb-2">
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">Accomodation's Name</h3>
                        <p class="card-text mb-auto">Please write your
                           accomodation's name.</p>
                     </div>
                     <input class="form-control me-2" type="text" name="aname"
                        size="60" placeholder="Room's Name" style="margin-bottom: 11%;" value="${vo[0].aname}">
                  </div>
               </div>
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">Accomodation's Location</h3>
                        <p class="card-text mb-auto">Please write your
                           accomodation's location.</p>
                     </div>
                     <input class="form-control me-2" type="text" name="aloc"
                        size="60" placeholder="Room's Location"
                        style="margin-bottom: 11%;" value="${vo[0].aloc}">
                  </div>
               </div>
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">Accomodation's Price</h3>
                        <p class="card-text mb-auto">Please write your
                           accomodation's price.</p>
                     </div>
                     <input class="form-control me-2" type="number" name="aprice"
                        size="60" placeholder="Room's Price" style="margin-bottom: 11%;" value="${vo[0].aprice}">
                  </div>
               </div>
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">Accomodation Name</h3>
                        <p class="card-text mb-auto">Please select your accomodation
                           type.</p>
                     </div>
                     <div id="personnelDiv"
                        style="width: 400px !important; height: 81px !important; margin-top: 0px !important; margin-bottom: 11%;">
                        <p class="searchFont">Room Type</p>
                        <select id="personnel" name="atype" value="${vo[0].atype}">
                           <option value="집전체">집전체</option>
                           <option value="개인실">개인실</option>
                           <option value="호텔객실">호텔객실</option>
                           <option value="다인실">다인실</option>
                        </select>
                     </div>
                  </div>
               </div>
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">Maximum Capacity</h3>
                        <p class="card-text mb-auto">Please select accomodation's
                           maximum capacity.</p>
                     </div>
                     <div id="personnelDiv"
                        style="width: 400px !important; height: 81px !important; margin-top: 0px !important; margin-bottom: 11%;">
                        <p class="searchFont">Maximum Capacity</p>
                        <select id="personnel" name="apeople" value="${vo[0].apeople}">
                           <option value=1>인원 1명</option>
                           <option value=2>인원 2명</option>
                           <option value=3>인원 3명</option>
                           <option value=4>인원 4명</option>
                           <option value=5>인원 5명</option>
                           <option value=6>인원 6명</option>
                        </select>
                     </div>
                  </div>
               </div>
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">Accomodation's notice</h3>
                        <p class="card-text mb-auto">Please write your
                           accomodation's notice.</p>
                     </div>
                     <input class="form-control me-2" type="text" name="anotice"
                        size="60" placeholder="Room's Name" style="margin-bottom: 11%;" value="${vo[0].anotice}">
                  </div>
               </div>
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">Accomodation's address</h3>
                        <p class="card-text mb-auto">Please write your
                           accomodation's address.</p>
                     </div>
                     <input class="form-control me-2" type="text" name="amap"
                        size="60" placeholder="Room's Location"
                        style="margin-bottom: 11%;" value="${vo[0].amap}">
                  </div>
               </div>
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">The number of Room</h3>
                        <p class="card-text mb-auto">Please write the number of
                           room.</p>
                     </div>
                     <input class="form-control me-2" type="number" name="rnum"
                        size="60" placeholder="The number of Room"
                        style="margin-bottom: 11%;" value="${vo[0].rnum}">
                  </div>
               </div>
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">Wi-Fi</h3>
                        <p class="card-text mb-auto">Please select if there's Wi-Fi.</p>
                     </div>
                     <div id="personnelDiv"
                        style="width: 400px !important; height: 50px !important; margin-top: 9px !important; margin-bottom: 11%;">
                        <select id="personnel" name="wifi">
                           <option value=0>Yes</option>
                           <option value=1>No</option>
                        </select>
                     </div>
                  </div>
               </div>
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">The number of Toilet</h3>
                        <p class="card-text mb-auto">Please write the number of
                           toilet.</p>
                     </div>
                     <input class="form-control me-2" type="number" name="tnum"
                        size="60" placeholder="The number of Room"
                        style="margin-bottom: 11%;" value="${vo[0].tnum}">
                  </div>
               </div>
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">The number of Bed</h3>
                        <p class="card-text mb-auto">Please write the number of bed.</p>
                     </div>
                     <input class="form-control me-2" type="number" name="bnum"
                        size="60" placeholder="The number of Room"
                        style="margin-bottom: 11%;" value="${vo[0].bnum}">
                  </div>
               </div>
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">MicroWave</h3>
                        <p class="card-text mb-auto">Is there a microwave?</p>
                     </div>
                     <div id="personnelDiv"
                        style="width: 400px !important; height: 50px !important; margin-top: 9px !important; margin-bottom: 11%;">
                        <select id="personnel" name="wave">
                           <option value=0>Yes</option>
                           <option value=1>No</option>
                        </select>
                     </div>
                  </div>
               </div>
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">Fridge</h3>
                        <p class="card-text mb-auto">Is there a fridge?</p>
                     </div>
                     <div id="personnelDiv"
                        style="width: 400px !important; height: 50px !important; margin-top: 9px !important; margin-bottom: 11%;">
                        <select id="personnel" name="refg">
                           <option value=0>Yes</option>
                           <option value=1>No</option>
                        </select>
                     </div>
                  </div>
               </div>
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">Bidet</h3>
                        <p class="card-text mb-auto">Is there a bidet?</p>
                     </div>
                     <div id="personnelDiv"
                        style="width: 400px !important; height: 50px !important; margin-top: 9px !important; margin-bottom: 11%;">
                        <select id="personnel" name="bd">
                           <option value=0>Yes</option>
                           <option value=1>No</option>
                        </select>
                     </div>
                  </div>
               </div>
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">TV</h3>
                        <p class="card-text mb-auto">Is there a TV?</p>
                     </div>
                     <div id="personnelDiv"
                        style="width: 400px !important; height: 50px !important; margin-top: 9px !important; margin-bottom: 11%;">
                        <select id="personnel" name="tv">
                           <option value=0>Yes</option>
                           <option value=1>No</option>
                        </select>
                     </div>
                  </div>
               </div>
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">Pet</h3>
                        <p class="card-text mb-auto">Is it possible to bring the
                           pets?</p>
                     </div>
                     <div id="personnelDiv"
                        style="width: 400px !important; height: 50px !important; margin-top: 9px !important; margin-bottom: 11%;">
                        <select id="personnel" name="pet">
                           <option value=0>Yes</option>
                           <option value=1>No</option>
                        </select>
                     </div>
                  </div>
               </div>
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">Kitchen</h3>
                        <p class="card-text mb-auto">Is there a kitchen?</p>
                     </div>
                     <div id="personnelDiv"
                        style="width: 400px !important; height: 50px !important; margin-top: 9px !important; margin-bottom: 11%;">
                        <select id="personnel" name="kitchen">
                           <option value=0>Yes</option>
                           <option value=1>No</option>
                        </select>
                     </div>
                  </div>
               </div>
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">Washing Machine</h3>
                        <p class="card-text mb-auto">Is there a washing machine?</p>
                     </div>
                     <div id="personnelDiv"
                        style="width: 400px !important; height: 50px !important; margin-top: 9px !important; margin-bottom: 11%;">
                        <select id="personnel" name="wash">
                           <option value=0>Yes</option>
                           <option value=1>No</option>
                        </select>
                     </div>
                  </div>
               </div>
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">Parking</h3>
                        <p class="card-text mb-auto">Is there a parking space?</p>
                     </div>
                     <div id="personnelDiv"
                        style="width: 400px !important; height: 50px !important; margin-top: 9px !important; margin-bottom: 11%;">
                        <select id="personnel" name="parking">
                           <option value=0>Yes</option>
                           <option value=1>No</option>
                        </select>
                     </div>
                  </div>
               </div>
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">Fire Alarm</h3>
                        <p class="card-text mb-auto">Is there a fire alarm?</p>
                     </div>
                     <div id="personnelDiv"
                        style="width: 400px !important; height: 50px !important; margin-top: 9px !important; margin-bottom: 11%;">
                        <select id="personnel" name="fire">
                           <option value=0>Yes</option>
                           <option value=1>No</option>
                        </select>
                     </div>
                  </div>
               </div>
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">Smoking</h3>
                        <p class="card-text mb-auto">Is it possible to smoke inside?</p>
                     </div>
                     <div id="personnelDiv"
                        style="width: 400px !important; height: 50px !important; margin-top: 9px !important; margin-bottom: 11%;">
                        <select id="personnel" name="smoking">
                           <option value=0>Yes</option>
                           <option value=1>No</option>
                        </select>
                     </div>
                  </div>
               </div>
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">Roof Top</h3>
                        <p class="card-text mb-auto">Is there a roof top?</p>
                     </div>
                     <div id="personnelDiv"
                        style="width: 400px !important; height: 50px !important; margin-top: 9px !important; margin-bottom: 11%;">
                        <select id="personnel" name="roof">
                           <option value=0>Yes</option>
                           <option value=1>No</option>
                        </select>
                     </div>
                  </div>
               </div>
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">Barbecue</h3>
                        <p class="card-text mb-auto">Is there a barbecue?</p>
                     </div>
                     <div id="personnelDiv"
                        style="width: 400px !important; height: 50px !important; margin-top: 9px !important; margin-bottom: 11%;">
                        <select id="personnel" name="bbq">
                           <option value=0>Yes</option>
                           <option value=1>No</option>
                        </select>
                     </div>
                  </div>
               </div>
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">Restaurant</h3>
                        <p class="card-text mb-auto">Please recommend a good
                           restaurant nearby.</p>
                     </div>
                     <input class="form-control me-2" type="text" name="ures"
                        size="60" placeholder="The number of Room"
                        style="margin-bottom: 11%;" value="${vo[0].ures}">
                  </div>
               </div>
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">Cafe</h3>
                        <p class="card-text mb-auto">Please recommend a good cafe
                           nearby.</p>
                     </div>
                     <input class="form-control me-2" type="text" name="ucafe"
                        size="60" placeholder="The number of Room"
                        style="margin-bottom: 11%;" value="${vo[0].ucafe}">
                  </div>
               </div>
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">Convenience Store</h3>
                        <p class="card-text mb-auto">Is there a convenience store
                           nearby?</p>
                     </div>
                     <input class="form-control me-2" type="text" name="ucon"
                        size="60" placeholder="The number of Room"
                        style="margin-bottom: 11%;" value="${vo[0].ucon}">
                  </div>
               </div>

               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative"
                     >
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">Accomodation's Image</h3>
                        <p class="card-text mb-auto">Please add your accomodation's
                           Image.</p>
                     </div>
                     <input class="form-control me-2" multiple="multiple" type="file" id="ipath1" size="60" name="file"
                        placeholder="Room's Image"
                        style="margin-bottom: 6%; height: 16%;" value="${vo[0].org_file_name}"> 
                        
                  </div>
               </div>
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">Activity</h3>
                        <p class="card-text mb-auto">Please recommend a good
                           activity nearby.</p>
                     </div>
                     <input class="form-control me-2" type="text" name="uact"
                        size="60" placeholder="The number of Room"
                        style="margin-bottom: 11%;" value="${vo[0].uact}">
                  </div>
               </div>
               
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm position-relative"
                     style="height: 100px;">
                     <button id="addRoomsBtn" type="submit" class="btn btn-secondary"
                        style="padding: 0.9999rem 0.75rem !important; font-weight: 999 !important; line-height: 1.7 !important; background-color: #2AC1BC !important; border-color: #2AC1BC !important;">
                   	수정하기
                  </button>
                  </div>
                  </form>
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm position-relative"
                     style="height: 100px;">
                     <button id="resetBtn" type="button" onclick="f()"
                        class="btn btn-secondary"
                        style="padding: 0.9999rem 0.75rem !important; font-weight: 999 !important; line-height: 1.7 !important; background-color: #f25546 !important; border-color: #f25546 !important;">
                        다시 입력</button>
                  </div>
                  
                  </main>
               </div>
               
      <footer class="blog-footer">
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