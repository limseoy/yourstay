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
<script src="///js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<link rel="stylesheet" href="../css/airDnDCSS.css">
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/reset.css">

<!-- 구글웹폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap"
   rel="stylesheet">
<!-- Fontawesome -->
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
   integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg=="
   crossorigin="anonymous" referrerpolicy="no-referrer" />
<script>
   $(document)
         .ready(
               function() {
                  var checkShow = false;
                  $("#searchSubmitBtn")
                        .click(
                              function() {
                                 //alert($("#city").val() + " , " + $("#datepicker1").val() + " ~ " + $("#datepicker2").val() +" , "+$("#personnel option:selected").val());
                                 if ($("#aloc").val() == "모든 위치"
                                       || $("#aloc").val() == "") {
                                    alert("위치를 입력해 주세요.");
                                 } else if ($("#datepicker1").val() == "모든 날짜"
                                       || $("#datepicker1").val() == "") {
                                    alert("출발 날짜를 입력해 주세요.");
                                 } else if ($("#datepicker2").val() == "모든 날짜"
                                       || $("#datepicker2").val() == "") {
                                    alert("도착 날짜를 입력해 주세요.");
                                 } else {
                                    location.href = "../searchInListFromMainGet.do?aloc="
                                          + $("#aloc").val()
                                          + "&startdate="
                                          + $("#datepicker1")
                                                .val()
                                          + "&deadline="
                                          + $("#datepicker2")
                                                .val()
                                          + "&person="
                                          + $("#personnel").val();
                                 }
                              });
                  $("#datepicker1").datepicker({
                     dateFormat : 'yy-mm-dd'
                  });
                  $("#datepicker2").datepicker({
                     dateFormat : 'yy-mm-dd'
                  });
                  $("#rollDown").hide();
                  $("#tempImg").click(function() {
                     if (checkShow == false) {
                        $("#rollDown").show();
                        checkShow = true;
                     } else {
                        $("#rollDown").hide();
                        checkShow = false;
                     }
                  });
                  $("#logo").click(function() {
                     window.location = "index.jsp";
                  });
               });
</script>
<!--// bootstrap-css -->
<!-- css -->
<link rel="stylesheet" href="../css/blog.css" type="text/css"
   media="all" />
<%
	String memail = (String) session.getAttribute("memail");
%>
</head>
<style>
.bd-placeholder-img {
   font-size: 1.125rem;
   text-anchor: middle;
   -webkit-user-select: none;
   -moz-user-select: none;
   user-select: none;
}

@media ( min-width : 768px) {
   .bd-placeholder-img-lg {
      font-size: 3.5rem;
   }
}
</style>
<body>

   <div class="container">
      <header class="blog-header py-3">
      <a href="/chat">채팅하기</a>
         <div
            class="row flex-nowrap justify-content-between align-items-center">
            <div class="col-4 pt-1">
            </div>
            <div class="col-4 text-center">
               <a class="blog-header-logo text-dark" href="/">YourStay</a>
            </div>
            <div class="col-4 d-flex justify-content-end align-items-center" style="padding-right: 10px; padding-top: 14px;">
               <a class="link-secondary" href="#" aria-label="Search"> 
				<i class='fa fa-bell' style="margin-right: 30px;"></i>
                     <title>Search</title><circle cx="10.5" cy="10.5"
                        r="7.5" />
                     <path d="M21 21l-5.2-5.2" /></svg>
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

      <div class="nav-scroller py-1 mb-2">
         <nav class="nav d-flex justify-content-between">
         </nav>
      </div>
   </div>

   <main class="container">
      <div id="searchBar">
         <form id="seatrchForm">
            <div id="search" class="radius">
               <p id="indexH1">YourStay 숙소 찾기</p>
               <div id="cityDiv">
                  <p class="searchFont">위치</p>
                  <input type="text" id="aloc" name="aloc" placeholder="지역명을 입력해주세요." style="width: 60%;height: 50%;border: none;">
               </div>
               <div id="datepickerDiv" />
               <div class='col-md-3 col-xs-4'>
                  <div class="form-group">
                     <div class="input-group date" id="datetimepicker1"
                        data-target-input="nearest">
                        <input type="text" id="datepicker1" name="startdate"
                           placeholder="날짜를 선택해주세요." style="margin-left: 7px!important;">
                        <div class="input-group-append" data-target="#datetimepicker1"
                           data-toggle="datetimepicker">
                           <div class="input-group-text">
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class='col-md-3 col-xs-4'>
                  <div class="form-group">
                     <div class="input-group date" id="datetimepicker2"
                        data-target-input="nearest">
                        <input type="text" id="datepicker2" name="deadline"
                           placeholder="날짜를 선택해주세요." style="margin-left: 7px!important;">
                        <div class="input-group-append" data-target="#datetimepicker2"
                           data-toggle="datetimepicker">
                           <div class="input-group-text">
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <div id="personnelDiv">
               <p class="searchFont">인원</p>
               <select id="personnel" name="person">
                  <option value=1>인원 1명</option>
                  <option value=2>인원 2명</option>
                  <option value=3>인원 3명</option>
                  <option value=4>인원 4명</option>
                  <option value=5>인원 5명</option>
                  <option value=6>인원 6명</option>
               </select>
            </div>
            <input type="button" id="searchSubmitBtn" value="검색"
               style="cursor: pointer;">
      </div>
      </form>
      </div>
      <div background-repeat:no-repeat; width: 100%;"></div>
   <!--   <div class=" mb-4 text-white flower-bg">
    <div class="col-md-6 px-0">
      <h1 class="display-4 fst-italic"></h1>
      <p class="lead my-3">Multiple lines of text that form the lede, informing new readers quickly and efficiently about what’s most interesting in this post’s contents.</p>
      <p class="lead mb-0"><a href="#" class="text-white fw-bold">Continue reading...</a></p>
    </div>
  </div> -->
   <div class="image-box slider">
      <div class="img-w">
         <p class="img-w-p">설레는 다음 여행을 위한 아이디어</p>
      </div>
      <img class="image-thumbnail" src="../images/river.jpg">
   </div>

   <div class="row mb-2">
      <div class="col-md-6">
         <div class="card" style="width: 18rem;">
           <img class="card-img-top" src="../images/river.jpg"
                  alt="Card image cap">
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
              </div>
         </div>
      </div>
      <div class="col-md-6">
         <div class="card" style="width: 18rem;">
           <img class="card-img-top" src="../images/river.jpg"
                  alt="Card image cap">
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
              </div>
         </div>
      </div>
      <div class="col-md-6">
         <div class="card" style="width: 18rem;">
           <img class="card-img-top" src="../images/river.jpg"
                  alt="Card image cap">
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
              </div>
         </div>
      </div>
      <div class="col-md-6">
         <div class="card" style="width: 18rem;">
           <img class="card-img-top" src="../images/river.jpg"
                  alt="Card image cap">
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
              </div>
         </div>
      </div>
   </div>
   <!-- 슬라이드 -->
      <div id="carouselExampleCaptions" class="carousel slide"
         data-bs-ride="carousel">
         <div class="carousel-indicators">
            <button type="button"
               data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0"
               class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button"
               data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"
               aria-label="Slide 2"></button>
            <button type="button"
               data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"
               aria-label="Slide 3"></button>
         </div>
         <div class="carousel-inner">
            <div class="carousel-item active"
               style="background-image: url('https://source.unsplash.com/LAaSoL0LrYs/1920x1080')">
               <div class="carousel-caption">
                  <h5>First slide label</h5>
                  <p>Some representative placeholder content for the first
                     slide.</p>
               </div>
            </div>
            <div class="carousel-item"
               style="background-image: url('https://source.unsplash.com/bF2vsubyHcQ/1920x1080')">
               <div class="carousel-caption">
                  <h5>Second slide label</h5>
                  <p>Some representative placeholder content for the second
                     slide.</p>
               </div>
            </div>
            <div class="carousel-item"
               style="background-image: url('https://source.unsplash.com/szFUQoyvrxM/1920x1080')">
               <div class="carousel-caption">
                  <h5>Third slide label</h5>
                  <p>Some representative placeholder content for the third
                     slide.</p>
               </div>
            </div>
         </div>
         <button class="carousel-control-prev" type="button"
            data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
         </button>
         <button class="carousel-control-next" type="button"
            data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
         </button>
      </div>
   </main>
   <!-- 푸터 -->
   <div class="container">
      <footer class="py-3 my-4">
         <ul class="nav justify-content-center border-bottom pb-3 mb-3">
            <li class="nav-item"><a href="#"
               class="nav-link px-2 text-muted">Home</a></li>
            <li class="nav-item"><a href="#"
               class="nav-link px-2 text-muted">Features</a></li>
            <li class="nav-item"><a href="#"
               class="nav-link px-2 text-muted">Pricing</a></li>
            <li class="nav-item"><a href="/board/list"
               class="nav-link px-2 text-muted">FAQs</a></li>
            <li class="nav-item"><a href="#"
               class="nav-link px-2 text-muted">About</a></li>
         </ul>
         <p class="text-center text-muted">© 2021 Company, Inc</p>
      </footer>
   </div>
</body>
</html>