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
<link href="/css/info_slide.css" rel="stylesheet">
<!-- 구글웹폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap"
   rel="stylesheet">
<!-- alert -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<!-- Fontawesome -->
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
   integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg=="
   crossorigin="anonymous" referrerpolicy="no-referrer" />
   
   <!-- JS -->
<script src="/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="/js/info_bootstrap.bundle.min.js"></script>

   
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
                  $("#locSubmitBtn")
                  .click(
                        function() {
                              location.href = "../locInListFromMainGet.do?aloc="
                                    + $("#locSubmitBtn").val();
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
   $(function(){
       document.getElementById('my_btn').click();
    });
   function buttonCheck(check,loginCheck){
     
       var mnum = loginCheck;
       if(loginCheck !=null && check!=0){//checkNum이 널이면 로그인이 안되어있거나 메세지가없는것,0이면 알림을끝상태
          const Toast = Swal.mixin({
              toast: true,
              position: 'top-end',
              showConfirmButton: true,
              showCancelButton: true,
              confirmButtonText : "예약내용 보러가기",
              cancelButtonText: '알림끄기',
              timer: 20000,
              timerProgressBar: true,
              didOpen: (toast) => {
                toast.addEventListener('mouseenter', Swal.stopTimer);
                toast.addEventListener('mouseleave', Swal.resumeTimer);
              }
            })
            Toast.fire({
              icon: 'success',
              title: '새로운 예약이 있습니다'
            }).then((result) => {
                 if (result.isConfirmed) {//여기에 예약보러가는 로직
                       location.href="mypage/goReservationList?mseq="+${mvo.getMseq()};
                    } else if (
                      /* Read more about handling dismissals below */
                      result.dismiss === Swal.DismissReason.cancel
                    ) {//여기에 로직 알림끄는 
                       //RESERVATION 테이블 checkview 1로 업데이트해주면 됨
                    }    
            })
       }
   }
  
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
<c:choose>
   <c:when test="${check eq null }">
      <c:set value="null" var="check"/>
   </c:when>
   <c:otherwise>
      <c:set value="${check}" var="check"/>
   </c:otherwise>
</c:choose>
<c:choose>
   <c:when test="${loginOkUser eq null }">
      <c:set value="null" var="loginOkUser"/>
   </c:when>
   <c:otherwise>
      <c:set value="${loginOkUser.mseq}" var="loginOkUser"/>
   </c:otherwise>
</c:choose>

   <div class="container">
      <header class="blog-header py-3">
         <div
            class="row flex-nowrap justify-content-between align-items-center">
            <div class="col-4 pt-1">
            </div>
            <div class="col-4 text-center">
               <a class="blog-header-logo text-dark" href="/">YourStay</a>
            </div>
            <div class="col-4 d-flex justify-content-end align-items-center" style="padding-right: 10px; padding-top: 14px;">
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
         <input type="hidden" name="mseq" value="${vo[0].mseq}">
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
    <div class="row mb-2" style="margin-top: 4%;">
      <div class="col-md-6">
         <div class="card" style="width: 18rem;">
           <img class="card-img-top" src="../images/가평.jpg"
                  alt="Card image cap">
              <div class="card-body">
                <h5 class="card-title">${vo[0].aloc}</h5>
                <p class="card-text">가평에 위치한 인기 만점 숙소를 보려면 아래 버튼을 클릭해주세요.</p>
                <a href="/searchByLocation?aloc=${vo[0].aloc}" class="btn btn-secondary" style="background-color: #2AC1BC!important;border-color: #2AC1BC!important;">Button</a>
              </div>
         </div>
      </div>
      
      <div class="col-md-6">
         <div class="card" style="width: 18rem;">
           <img class="card-img-top" src="../images/제주도.jpg"
                  alt="Card image cap">
              <div class="card-body">
                <h5 class="card-title">${vo[4].aloc}</h5>
                <p class="card-text">제주도에 위치한 인기 만점 숙소를 보려면 아래 버튼을 클릭해주세요.</p>
                <a href="/searchByLocation?aloc=${vo[4].aloc}" class="btn btn-secondary" style="background-color: #2AC1BC!important;border-color: #2AC1BC!important;">Button</a>
              </div>
         </div>
      </div>
      <div class="col-md-6">
         <div class="card" style="width: 18rem;">
           <img class="card-img-top" src="../images/전주.jpg"
                  alt="Card image cap">
              <div class="card-body">
                <h5 class="card-title">${vo[2].aloc}</h5>
                <p class="card-text">여주에 위치한 인기 만점 숙소를 보려면 아래 버튼을 클릭해주세요.</p>
                <a href="/searchByLocation?aloc=${vo[2].aloc}" class="btn btn-secondary" style="background-color: #2AC1BC!important;border-color: #2AC1BC!important;">Button</a>
              </div>
         </div>
      </div>
      <div class="col-md-6">
         <div class="card" style="width: 18rem;">
           <img class="card-img-top" src="../images/강원도.jpg"
                  alt="Card image cap">
              <div class="card-body">
                <h5 class="card-title">${vo[8].aloc}</h5>
                <p class="card-text">강원도에 위치한 인기 만점 숙소를 보려면 아래 버튼을 클릭해주세요.</p>
                <a href="/searchByLocation?aloc=${vo[8].aloc}" class="btn btn-secondary" style="background-color: #2AC1BC!important;border-color: #2AC1BC!important;">Button</a>
              </div>
         </div>
      </div>
   </div>
   <!-- 슬라이드 -->
      <div id="carouselExampleCaptions" class="carousel slide"
         data-bs-ride="carousel" style="margin-top: 3%;">
         <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleCaptions"
               data-bs-slide-to="0" class="active" aria-current="true"
               aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions"
               data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions"
               data-bs-slide-to="2" aria-label="Slide 3"></button>
         </div>
         <div class="carousel-inner" style="width: 98.5%; border-radius: 1%;">
            <div class="carousel-item active"
               style="background:url('../images/forest.jpg') no-repeat; background-position: center;
  background-size: cover;">
               <div class="carousel-caption">
                  <h5>YourStay</h5>
                  <p>피톤치드와 함께 힐링을 느낄 수 있는 숙소도 있습니다.</p>
               </div>
            </div>
            <div class="carousel-item"
               style="background:url('../images/ocean.jpg') no-repeat;background-position: center;
  background-size: cover;">
               <div class="carousel-caption">
                  <h5>YourStay</h5>
                  <p>뻥 뚫린 수평선을 바라보며 힐링을 느낄 수 있는 숙소도 있습니다.</p>
               </div>
            </div>
            <div class="carousel-item"
               style="background:url('../images/house.jpg') no-repeat;background-position: center;
  background-size: cover;">
               <div class="carousel-caption">
                  <h5>YourStay</h5>
                  <p>아무도 없는 곳에서의 독채! 연인과 가족과 함께 하면 더욱 좋은 숙소도 있습니다.</p>
               </div>
            </div>
         </div>
         <button class="carousel-control-prev" type="button"
            data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true" style="margin-top: 200%;"></span>
            <span class="visually-hidden">Previous</span>
         </button>
         <button class="carousel-control-next" type="button"
            data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true" style="margin-top: 200%;"></span>
            <span class="visually-hidden">Next</span>
         </button>
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
   <input id="my_btn" type="button" onclick="buttonCheck(${check},${loginOkUser})"/>
</body>
</html>