<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>YourStay</title>
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
body, h3 {
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
               <a class="blog-header-logo text-dark" href="/">YourStay</a>
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

      <main class="container">
         <form name="roomoption" method="post" action="/mypage/register.do" enctype="multipart/form-data">
            <input type="hidden" name="mseq" value="${vo.mseq}">
            <div class="row mb-2">
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">숙소 이름</h3>
                        <p class="card-text mb-auto">숙소 이름을 입력해주세요.</p>
                     </div>
                     <input class="form-control me-2" type="text" name="aname"
                        size="60" placeholder="Room's Name" style="margin-bottom: 11%;">
                  </div>
               </div>
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">숙소 위치</h3>
                        <p class="card-text mb-auto">숙소 위치를 입력해주세요.</p>
                     </div>
                     <input class="form-control me-2" type="text" name="aloc"
                        size="60" placeholder="Room's Location"
                        style="margin-bottom: 11%;">
                  </div>
               </div>
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">숙소 가격</h3>
                        <p class="card-text mb-auto">숙소 가격을 입력해주세요.</p>
                     </div>
                     <input class="form-control me-2" type="number" name="aprice"
                        size="60" placeholder="Room's Price" style="margin-bottom: 11%;">
                  </div>
               </div>
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">숙소 방 타입</h3>
                        <p class="card-text mb-auto">숙소 방 타입을 선택해주세요.</p>
                     </div>
                     <div id="personnelDiv"
                        style="width: 400px !important; height: 81px !important; margin-top: 0px !important; margin-bottom: 11%;">
                        <p class="searchFont">Room Type</p>
                        <select id="personnel" name="atype">
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
                        <h3 class="mb-0">최대 수용 인원 수</h3>
                        <p class="card-text mb-auto">숙소에 수용 가능한 최대 인원 수를 선택해주세요.</p>
                     </div>
                     <div id="personnelDiv"
                        style="width: 400px !important; height: 81px !important; margin-top: 0px !important; margin-bottom: 11%;">
                        <p class="searchFont">Maximum Capacity</p>
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
               </div>
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">숙소 공지사항</h3>
                        <p class="card-text mb-auto">숙소 공지사항을 입력해주세요.</p>
                     </div>
                     <input class="form-control me-2" type="text" name="anotice"
                        size="60" placeholder="Room's Name" style="margin-bottom: 11%;">
                  </div>
               </div>
                <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">숙소 주소</h3>
                        <p class="card-text mb-auto">숙소 위치의 주소를 입력해주세요.</p>
                     </div>
                     <input class="form-control me-2" type="text" name="amap"
                        size="60" placeholder="Room's Location"
                        style="margin-bottom: 11%;">
                  </div>
               </div>
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">방 갯수</h3>
                        <p class="card-text mb-auto">숙소의 방 갯수를 입력해주세요.</p>
                     </div>
                     <input class="form-control me-2" type="number" name="rnum"
                        size="60" placeholder="The number of Room"
                        style="margin-bottom: 11%;">
                  </div>
               </div>
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">와이파이</h3>
                        <p class="card-text mb-auto">와이파이가 있나요?</p>
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
                        <h3 class="mb-0">화장실 갯수</h3>
                        <p class="card-text mb-auto">숙소의 화장실 갯수를 입력해주세요.</p>
                     </div>
                     <input class="form-control me-2" type="number" name="tnum"
                        size="60" placeholder="The number of Room"
                        style="margin-bottom: 11%;">
                  </div>
               </div>
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">침대 갯수</h3>
                        <p class="card-text mb-auto">숙소의 침대 갯수를 입력해주세요.</p>
                     </div>
                     <input class="form-control me-2" type="number" name="bnum"
                        size="60" placeholder="The number of Room"
                        style="margin-bottom: 11%;">
                  </div>
               </div>
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">전자레인지</h3>
                        <p class="card-text mb-auto">숙소 내에 전자레인지가 있나요?</p>
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
                        <h3 class="mb-0">냉장고</h3>
                        <p class="card-text mb-auto">숙소 내에 냉장고가 있나요?</p>
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
                        <h3 class="mb-0">비데</h3>
                        <p class="card-text mb-auto">숙소 내에 비데가 있나요?</p>
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
                        <p class="card-text mb-auto">숙소 내에 TV가 있나요?</p>
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
                        <h3 class="mb-0">반려동물</h3>
                        <p class="card-text mb-auto">반려동물 동반 가능한가요?</p>
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
                        <h3 class="mb-0">주방</h3>
                        <p class="card-text mb-auto">주방이 있나요?</p>
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
                        <h3 class="mb-0">세탁기</h3>
                        <p class="card-text mb-auto">숙소 내에 세탁기가 있나요?</p>
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
                        <h3 class="mb-0">주차장</h3>
                        <p class="card-text mb-auto">주차 공간이 있나여?</p>
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
                        <h3 class="mb-0">화재경보기</h3>
                        <p class="card-text mb-auto">숙소 내에 화재경보기가 있나요?</p>
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
                        <h3 class="mb-0">흡연</h3>
                        <p class="card-text mb-auto">숙소 내에서 흡연이 가능한가요?</p>
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
                        <h3 class="mb-0">옥상</h3>
                        <p class="card-text mb-auto">옥상 사용 가능한가요?</p>
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
                        <h3 class="mb-0">바베큐</h3>
                        <p class="card-text mb-auto">바베큐 서비스 있나요?</p>
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
                        <h3 class="mb-0">식당</h3>
                        <p class="card-text mb-auto">숙소 주변 맛집 추천해주세요.</p>
                     </div>
                     <input class="form-control me-2" type="text" name="ures"
                        size="60" placeholder="The number of Room"
                        style="margin-bottom: 11%;">
                  </div>
               </div>
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">카페</h3>
                        <p class="card-text mb-auto">숙소 주변 카페 추천해주세요.</p>
                     </div>
                     <input class="form-control me-2" type="text" name="ucafe"
                        size="60" placeholder="The number of Room"
                        style="margin-bottom: 11%;">
                  </div>
               </div>
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">편의점</h3>
                        <p class="card-text mb-auto">숙소 주변 편의점을 적어주세요.</p>
                     </div>
                     <input class="form-control me-2" type="text" name="ucon"
                        size="60" placeholder="The number of Room"
                        style="margin-bottom: 11%;">
                  </div>
               </div>

               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">숙소 이미지</h3>
                        <p class="card-text mb-auto">숙소 이미지를 넣어주세요</p>
                     </div>
                     <input class="form-control me-2" multiple="multiple" type="file" id="ipath1" size="60" name="file"
                        placeholder="Room's Image"
                        style="margin-bottom: 6%; height: 16%;"> 
                  </div>
               </div>
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                     <div class="col p-4 d-flex flex-column position-static">
                        <span class="badge rounded-pill bg-secondary"
                           style="width: 18%; margin-bottom: 2%;">YourStay</span>
                        <h3 class="mb-0">액티비티</h3>
                        <p class="card-text mb-auto">숙소 주변에서 할 수 있는 액티비티를 입력해주세요.</p>
                     </div>
                     <input class="form-control me-2" type="text" name="uact"
                        size="60" placeholder="The number of Room"
                        style="margin-bottom: 11%;">
                  </div>
               </div>
               <div class="col-md-6" style="width: 33%;">
                  <div
                     class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm position-relative"
                     style="height: 100px;">
                     <button id="addRoomsBtn" type="submit" class="btn btn-secondary"
                        style="padding: 0.9999rem 0.75rem !important; font-weight: 999 !important; line-height: 1.7 !important; background-color: #2AC1BC !important; border-color: #2AC1BC !important;">
                  Room Register
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
</body>
</html>