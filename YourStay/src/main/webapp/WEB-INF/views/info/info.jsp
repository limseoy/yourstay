<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../login/login_check_module.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>info</title>

<!-- Fontawesome -->
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
   integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg=="
   crossorigin="anonymous" referrerpolicy="no-referrer" />


<!-- 구글웹폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap"
   rel="stylesheet">

<!-- Bootstrap core CSS -->
<link href="/css/info_bootstrap.min.css" rel="stylesheet">
<link href="/css/info_blog.css" rel="stylesheet">
<link href="/css/info_footers.css" rel="stylesheet">
<link href="/css/info_cheatsheet.css" rel="stylesheet">
<link href="/css/info_features.css" rel="stylesheet">
<link href="/css/info_fontawesome.css" rel="stylesheet">
<link href="/css/info_review.css" rel="stylesheet">
<link href="/css/info_slide.css" rel="stylesheet">
<link href="/css/info_bill.css" rel="stylesheet">

<!-- JS -->
<script src="/js/info_bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="/js/info_price.js"></script>


<!-- DataTimePicker-->
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script>
   $(function() {
      $("#from").datepicker({
         dateFormat : 'yy-mm-dd'
      });
      $("#to").datepicker({
         dateFormat : 'yy-mm-dd'
      });
      var from = $("#from").datepicker({
         defaultDate : "+1w",
         changeMonth : true,
         numberOfMonths : 1
      }).on("change", function() {
         console.log("test1");
         to.datepicker("option", "minDate", getDate(this));
      }), to = $("#to").datepicker({
         defaultDate : "+1w",
         changeMonth : true,
         numberOfMonths : 1
      }).on("change", function() {
         console.log("test2");
         from.datepicker("option", "maxDate", getDate(this));
      });

      function getDate(element) {
         var date;
         try {
            date = $.datepicker.parseDate('yy-mm-dd', element.value);
         } catch (error) {
            date = null;
         }
         return date;
      }
   });
</script>


<style>
body, h1, h2, h3 {
   font-family: 'Poor Story', cursive;
}

.sort {
   display: flex;
   flex-direction: row;
   justify-content: space-around;
}

.sort-in {
   width: 35%
}

.wrap {
   position: absolute;
   left: 0;
   bottom: 40px;
   width: 288px;
   height: 132px;
   margin-left: -144px;
   text-align: left;
   overflow: hidden;
   font-size: 12px;
   font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
   line-height: 1.5;
}

.wrap * {
   padding: 0;
   margin: 0;
}

.wrap .info {
   width: 286px;
   height: 120px;
   border-radius: 5px;
   border-bottom: 2px solid #ccc;
   border-right: 1px solid #ccc;
   overflow: hidden;
   background: #fff;
}

.wrap .info:nth-child(1) {
   border: 0;
   box-shadow: 0px 1px 2px #888;
}

.info .title {
   padding: 5px 0 0 10px;
   height: 30px;
   background: #eee;
   border-bottom: 1px solid #ddd;
   font-size: 18px;
   font-weight: bold;
}

.info .close {
   position: absolute;
   top: 10px;
   right: 10px;
   color: #888;
   width: 17px;
   height: 17px;
   background:
      url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

.info .close:hover {
   cursor: pointer;
}

.info .body {
   position: relative;
   overflow: hidden;
}

.info .desc {
   position: relative;
   margin: 13px 0 0 90px;
   height: 75px;
}

.desc .ellipsis {
   overflow: hidden;
   text-overflow: ellipsis;
   white-space: nowrap;
}

.desc .jibun {
   font-size: 11px;
   color: #888;
   margin-top: -2px;
}

.info .img {
   position: absolute;
   top: 6px;
   left: 5px;
   width: 73px;
   height: 71px;
   border: 1px solid #ddd;
   color: #888;
   overflow: hidden;
}

.info:after {
   content: '';
   position: absolute;
   margin-left: -12px;
   left: 50%;
   bottom: 0;
   width: 22px;
   height: 12px;
   background:
      url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.info .link {
   color: #5085BB;
}

.like{
	padding: 0;
	border: none;
	background: none;
}
</style>
<%
   String memail = (String) session.getAttribute("memail");
%>
</head>
<body>
   <!-- 상단 -->
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
                  <title>Search</title><circle cx="10.5" cy="10.5"
                     r="7.5" />
                  <path d="M21 21l-5.2-5.2" /></svg></a>

            <c:choose>
               <c:when test="${empty loginOkUser}">
            &nbsp;
            <a class="py-2" href="../login/loginPage">로그인</a>
            &nbsp;&nbsp;
         </c:when>
               <c:otherwise>
                  <div>
                     <a id="fontline" class="py-2 nav-link active"
                        style="color: green; texg-align: center" href="/mypage/home"><%=memail%>
                        님 환영합니다</a>
                  </div>
                  <li class="nav-item"><a class="py-2 nav-link active"
                     href="../login/logout.do">로그아웃</a></li>
               </c:otherwise>
            </c:choose>

         </div>
      </div>
   </header>

   <main class="container">
      <!-- 제목 -->
      <div class="p-4 p-md-5 mb-4 text-white rounded bg-dark">
         <div class="col-md-6 px-0">
            <h1 class="display-4 fst-italic">숙소 이름: ${resVO.aname}</h1>
            <p class="lead my-3">
               숙소 위치: ${resVO.aloc}<br /> 숙소 가격: ${resVO.aprice}<br /> 숙소 별점:
               ${resVO.apoint}<br /> 숙소 타입: ${resVO.atype}<br /> 숙소 최대 가능 인원:
               ${resVO.apeople}<br />
            </p>
            <p class="lead mb-0">
               <a href="#" class="text-white fw-bold">무슨무슨 링크...</a>
            </p>
         </div>
      </div>

      <!-- 사진 -->
      <div id="carouselExampleCaptions" class="carousel slide"
         data-bs-ride="carousel">
         <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleCaptions"
               data-bs-slide-to="0" class="active" aria-current="true"
               aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions"
               data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions"
               data-bs-slide-to="2" aria-label="Slide 3"></button>
         </div>
         <div class="carousel-inner">
            <div class="carousel-item active"
               style="background:url('../../../resources/images/roomImg/${resVO.aid}/${resVO.ipath1}') no-repeat; background-position: center;
  background-size: cover;">
               <div class="carousel-caption">
                  <h5>First slide label</h5>
                  <p>Some representative placeholder content for the first
                     slide.</p>
               </div>
            </div>
            <div class="carousel-item"
               style="background:url('../../../resources/images/roomImg/${resVO.aid}/${resVO.ipath2}') no-repeat;background-position: center;
  background-size: cover;">
               <div class="carousel-caption">
                  <h5>Second slide label</h5>
                  <p>Some representative placeholder content for the second
                     slide.</p>
               </div>
            </div>
            <div class="carousel-item"
               style="background:url('../../../resources/images/roomImg/${resVO.aid}/${resVO.ipath3}') no-repeat;background-position: center;
  background-size: cover;">
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
      <hr>
      <!-- 내용 -->
      <div class="row g-5">
         <div class="col-md-8">
            <article class="blog-post">
               <h2 class="blog-post-title">${resVO.mname}님이
                  운영하는 숙소입니다 <button class='fas fa-hand-holding-heart like' type="submit"></button>
               </h2>
               <p class="blog-post-meta">
                  방 갯수: ${resVO.rnum}<br />화장실 갯수: ${resVO.tnum}<br />침대 갯수:
                  ${resVO.bnum}<br />
               </p>
               <hr>
               <h2 class="fw-bold">편의시설</h2>
               <div
                  class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4 py-5">
                  <c:set var="wifi" value="${resVO.wifi}" />
                  <c:choose>
                     <c:when test="${wifi == 0}">
                        <div class="col d-flex align-items-start">
                           <svg class="bi text-muted flex-shrink-0 me-3" width="1.75em"
                              height="1.75em">
                        <i class="fa-solid fa-wifi accom-op"></i></svg>
                           <div>
                              <p class="mb-0">와이파이</p>
                           </div>
                        </div>
                     </c:when>
                  </c:choose>
                  <c:set var="wave" value="${resVO.wave}" />
                  <c:choose>
                     <c:when test="${wave == 0}">
                        <div class="col d-flex align-items-start">
                           <svg class="bi text-muted flex-shrink-0 me-3" width="1.75em"
                              height="1.75em">
                        <i class="fa-solid fa-car-battery accom-op"></i></svg>
                           <div>
                              <p class="mb-0">전자렌지</p>
                           </div>
                        </div>
                     </c:when>
                  </c:choose>
                  <c:set var="refg" value="${resVO.refg}" />
                  <c:choose>
                     <c:when test="${refg == 0}">
                        <div class="col d-flex align-items-start">
                           <svg class="bi text-muted flex-shrink-0 me-3" width="1.75em"
                              height="1.75em">
                        <i class="fa-solid fa-carrot accom-op"></i></svg>
                           <div>
                              <p class="mb-0">냉장고</p>
                           </div>
                        </div>
                     </c:when>
                  </c:choose>
                  <c:set var="bd" value="${resVO.bd}" />
                  <c:choose>
                     <c:when test="${bd == 0}">
                        <div class="col d-flex align-items-start">
                           <svg class="bi text-muted flex-shrink-0 me-3" width="1.75em"
                              height="1.75em">
                        <i class="fa-solid fa-droplet accom-op"></i></svg>
                           <div>
                              <p class="mb-0">비데</p>
                           </div>
                        </div>
                     </c:when>
                  </c:choose>
                  <c:set var="tv" value="${resVO.tv}" />
                  <c:choose>
                     <c:when test="${tv == 0}">
                        <div class="col d-flex align-items-start">
                           <svg class="bi text-muted flex-shrink-0 me-3" width="1.75em"
                              height="1.75em">
                        <i class="fa-solid fa-tv accom-op"></i></svg>
                           <div>
                              <p class="mb-0">TV</p>
                           </div>
                        </div>
                     </c:when>
                  </c:choose>
                  <c:set var="pet" value="${resVO.pet}" />
                  <c:choose>
                     <c:when test="${pet == 0}">
                        <div class="col d-flex align-items-start">
                           <svg class="bi text-muted flex-shrink-0 me-3" width="1.75em"
                              height="1.75em">
                        <i class="fa-solid fa-dog accom-op"></i></svg>
                           <div>
                              <p class="mb-0">반려견동반</p>
                           </div>
                        </div>
                     </c:when>
                  </c:choose>
                  <c:set var="kitchen" value="${resVO.kitchen}" />
                  <c:choose>
                     <c:when test="${kitchen == 0}">
                        <div class="col d-flex align-items-start">
                           <svg class="bi text-muted flex-shrink-0 me-3" width="1.75em"
                              height="1.75em">
                        <i class="fa-solid fa-utensils accom-op"></i></svg>
                           <div>
                              <p class="mb-0">주방</p>
                           </div>
                        </div>
                     </c:when>
                  </c:choose>
                  <c:set var="wash" value="${resVO.wash}" />
                  <c:choose>
                     <c:when test="${wash == 0}">
                        <div class="col d-flex align-items-start">
                           <svg class="bi text-muted flex-shrink-0 me-3" width="1.75em"
                              height="1.75em">
                        <i class="fa-solid fa-soap accom-op"></i></svg>
                           <div>
                              <p class="mb-0">세탁기</p>
                           </div>
                        </div>
                     </c:when>
                  </c:choose>
                  <c:set var="parking" value="${resVO.parking}" />
                  <c:choose>
                     <c:when test="${parking == 0}">
                        <div class="col d-flex align-items-start">
                           <svg class="bi text-muted flex-shrink-0 me-3" width="1.75em"
                              height="1.75em">
                      <i class='fa fa-car'></i></svg>
                           <div>
                              <p class="mb-0">주차</p>
                           </div>
                        </div>
                     </c:when>
                  </c:choose>
                  <c:set var="fire" value="${resVO.fire}" />
                  <c:choose>
                     <c:when test="${fire == 0}">
                        <div class="col d-flex align-items-start">
                           <svg class="bi text-muted flex-shrink-0 me-3" width="1.75em"
                              height="1.75em">
                      <i class='fa fa-fire-extinguisher'></i></svg>
                           <div>
                              <p class="mb-0">화재경보기</p>
                           </div>
                        </div>
                     </c:when>
                  </c:choose>
                  <c:set var="smoking" value="${resVO.smoking}" />
                  <c:choose>
                     <c:when test="${smoking == 0}">
                        <div class="col d-flex align-items-start">
                           <svg class="bi text-muted flex-shrink-0 me-3" width="1.75em"
                              height="1.75em">
                        <i class='fas fa-smoking'></i></svg>
                           <div>
                              <p class="mb-0">흡연 가능</p>
                           </div>
                        </div>
                     </c:when>
                  </c:choose>
                  <c:set var="roof" value="${resVO.roof}" />
                  <c:choose>
                     <c:when test="${roof == 0}">
                        <div class="col d-flex align-items-start">
                           <svg class="bi text-muted flex-shrink-0 me-3" width="1.75em"
                              height="1.75em">
                        <i class='fa fa-home'></i></svg>
                           <div>
                              <p class="mb-0">루프탑</p>
                           </div>
                        </div>
                     </c:when>
                  </c:choose>
                  <c:set var="bbq" value="${resVO.bbq}" />
                  <c:choose>
                     <c:when test="${bbq == 0}">
                        <div class="col d-flex align-items-start">
                           <svg class="bi text-muted flex-shrink-0 me-3" width="1.75em"
                              height="1.75em">
                        <i class="fa-solid fa-utensils accom-op"></i></svg>
                           <div>
                              <p class="mb-0">루프탑</p>
                           </div>
                        </div>
                     </c:when>
                  </c:choose>
               </div>

               <hr>
               <h2 class="fw-bold">숙소 공지사항</h2>
               <p>${resVO.anotice}</p>

               <hr>
               <!-- 지도 -->
               <h2 class="fw-bold">위치</h2>
                  <div class="map-area">
                  <div id="map" style="height: 580px;"></div>
                   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b87f2182c111fec7ca0b3a2aaede2356&libraries=services,clusterer,drawing">
</script>
                  <script>

      var container = document.getElementById('map');
      var options = {
         center: new kakao.maps.LatLng(33.450701, 126.570667),
         level: 6
      };

      var map = new kakao.maps.Map(container, options);
      
      // 주소-좌표 변환 객체를 생성합니다
      var geocoder = new kakao.maps.services.Geocoder();
      // 주소로 좌표를 검색합니다
      geocoder.addressSearch('${resVO.amap}', function(result, status) {
            
          // 정상적으로 검색이 완료됐으면 
           if (status === kakao.maps.services.Status.OK) {

              var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

              // 결과값으로 받은 위치를 마커로 표시합니다
              var marker = new kakao.maps.Marker({
                  map: map,
                  position: coords
              });

              // 커스텀 오버레이에 표시할 컨텐츠 입니다
              // 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
              // 별도의 이벤트 메소드를 제공하지 않습니다 
              var content = '<div class="wrap">' + 
                          '    <div class="info">' + 
                          '        <div class="title">' + 
                          '            ${resVO.aname}' + 
                          '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
                          '        </div>' + 
                          '        <div class="body">' + 
                          '            <div class="img">' +
                          '                <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
                          '           </div>' + 
                          '            <div class="desc">' + 
                          '                <div class="ellipsis">${resVO.amap}</div>' + 
                          '                <div><a href="https://map.kakao.com/link/to/${maps.aname},${maps.amap}" target="_blank" class="link">길찾기</a>' + 
                          '            </div>' + 
                          '        </div>' + 
                          '    </div>' +    
                          '</div>';
   
              // 마커 위에 커스텀오버레이를 표시합니다
              // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
              var overlay = new kakao.maps.CustomOverlay({
                  content: content,
                  map: map,
                  position: marker.getPosition()       
              });
   
              // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
              kakao.maps.event.addListener(marker, 'click', function() {
                  overlay.setMap(map);
              });
   
              // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
              function closeOverlay() {
                  overlay.setMap(null);     
              }
              // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
              map.setCenter(coords);
          } 
      });    
      </script>
               </div>
               <hr>
               <!-- 후기게시판 -->
               <h2 class="fw-bold">후기</h2>
               <p>방문하신 분들의 후기를 찾아보세요 :)</p>
               <link rel="stylesheet"
                  href="https://allyoucan.cloud/cdn/icofont/1.0.1/icofont.css"
                  integrity="sha384-jbCTJB16Q17718YM9U22iJkhuGbS0Gd2LjaWb4YJEZToOPmnKDjySVa323U+W7Fv"
                  crossorigin="anonymous">
               <div class="container">
                  <div class="col-md-12">
                     <div class="offer-dedicated-body-left">
                        <div class="tab-content" id="pills-tabContent">
                           <div class="tab-pane fade" id="pills-order-online"
                              role="tabpanel" aria-labelledby="pills-order-online-tab">
                              <div id="#menu"
                                 class="bg-white rounded shadow-sm p-4 mb-4 explore-outlets">
                                 <h5 class="mb-4">Recommended</h5>
                                 <form class="explore-outlets-search mb-4">
                                    <div class="input-group">
                                       <input type="text" placeholder="Search for dishes..."
                                          class="form-control">
                                       <div class="input-group-append">
                                          <button type="button" class="btn btn-link">
                                             <i class="icofont-search"></i>
                                          </button>
                                       </div>
                                    </div>
                                 </form>
                                 <h6 class="mb-3">
                                    Most Popular <span class="badge badge-success"><i
                                       class="icofont-tags"></i> 15% Off All Items </span>
                                 </h6>
                                 <div
                                    class="owl-carousel owl-theme owl-carousel-five offers-interested-carousel mb-3 owl-loaded owl-drag owl-hidden">

                                    <div class="owl-stage-outer">
                                       <div class="owl-stage"
                                          style="transform: translate3d(-682px, 0px, 0px); transition: all 0s ease 0s; width: 2183px;">
                                          <div class="owl-item cloned" style="width: 136.4px;">
                                             <div class="item">
                                                <div class="mall-category-item">
                                                   <a href="#"> <img class="img-fluid"
                                                      src="img/list/2.png">
                                                      <h6>Sandwiches</h6> <small>8 ITEMS</small>
                                                   </a>
                                                </div>
                                             </div>
                                          </div>
                                          <div class="owl-item cloned" style="width: 136.4px;">
                                             <div class="item">
                                                <div class="mall-category-item">
                                                   <a href="#"> <img class="img-fluid"
                                                      src="img/list/3.png">
                                                      <h6>Soups</h6> <small>2 ITEMS</small>
                                                   </a>
                                                </div>
                                             </div>
                                          </div>
                                          <div class="owl-item cloned" style="width: 136.4px;">
                                             <div class="item">
                                                <div class="mall-category-item">
                                                   <a href="#"> <img class="img-fluid"
                                                      src="img/list/4.png">
                                                      <h6>Pizzas</h6> <small>56 ITEMS</small>
                                                   </a>
                                                </div>
                                             </div>
                                          </div>
                                          <div class="owl-item cloned" style="width: 136.4px;">
                                             <div class="item">
                                                <div class="mall-category-item">
                                                   <a href="#"> <img class="img-fluid"
                                                      src="img/list/5.png">
                                                      <h6>Pastas</h6> <small>10 ITEMS</small>
                                                   </a>
                                                </div>
                                             </div>
                                          </div>
                                          <div class="owl-item cloned" style="width: 136.4px;">
                                             <div class="item">
                                                <div class="mall-category-item">
                                                   <a href="#"> <img class="img-fluid"
                                                      src="img/list/6.png">
                                                      <h6>Chinese</h6> <small>25 ITEMS</small>
                                                   </a>
                                                </div>
                                             </div>
                                          </div>
                                          <div class="owl-item active" style="width: 136.4px;">
                                             <div class="item">
                                                <div class="mall-category-item">
                                                   <a href="#"> <img class="img-fluid"
                                                      src="img/list/1.png">
                                                      <h6>Burgers</h6> <small>5 ITEMS</small>
                                                   </a>
                                                </div>
                                             </div>
                                          </div>
                                          <div class="owl-item active" style="width: 136.4px;">
                                             <div class="item">
                                                <div class="mall-category-item">
                                                   <a href="#"> <img class="img-fluid"
                                                      src="img/list/2.png">
                                                      <h6>Sandwiches</h6> <small>8 ITEMS</small>
                                                   </a>
                                                </div>
                                             </div>
                                          </div>
                                          <div class="owl-item active" style="width: 136.4px;">
                                             <div class="item">
                                                <div class="mall-category-item">
                                                   <a href="#"> <img class="img-fluid"
                                                      src="img/list/3.png">
                                                      <h6>Soups</h6> <small>2 ITEMS</small>
                                                   </a>
                                                </div>
                                             </div>
                                          </div>
                                          <div class="owl-item active" style="width: 136.4px;">
                                             <div class="item">
                                                <div class="mall-category-item">
                                                   <a href="#"> <img class="img-fluid"
                                                      src="img/list/4.png">
                                                      <h6>Pizzas</h6> <small>56 ITEMS</small>
                                                   </a>
                                                </div>
                                             </div>
                                          </div>
                                          <div class="owl-item active" style="width: 136.4px;">
                                             <div class="item">
                                                <div class="mall-category-item">
                                                   <a href="#"> <img class="img-fluid"
                                                      src="img/list/5.png">
                                                      <h6>Pastas</h6> <small>10 ITEMS</small>
                                                   </a>
                                                </div>
                                             </div>
                                          </div>
                                          <div class="owl-item" style="width: 136.4px;">
                                             <div class="item">
                                                <div class="mall-category-item">
                                                   <a href="#"> <img class="img-fluid"
                                                      src="img/list/6.png">
                                                      <h6>Chinese</h6> <small>25 ITEMS</small>
                                                   </a>
                                                </div>
                                             </div>
                                          </div>
                                          <div class="owl-item cloned" style="width: 136.4px;">
                                             <div class="item">
                                                <div class="mall-category-item">
                                                   <a href="#"> <img class="img-fluid"
                                                      src="img/list/1.png">
                                                      <h6>Burgers</h6> <small>5 ITEMS</small>
                                                   </a>
                                                </div>
                                             </div>
                                          </div>
                                          <div class="owl-item cloned" style="width: 136.4px;">
                                             <div class="item">
                                                <div class="mall-category-item">
                                                   <a href="#"> <img class="img-fluid"
                                                      src="img/list/2.png">
                                                      <h6>Sandwiches</h6> <small>8 ITEMS</small>
                                                   </a>
                                                </div>
                                             </div>
                                          </div>
                                          <div class="owl-item cloned" style="width: 136.4px;">
                                             <div class="item">
                                                <div class="mall-category-item">
                                                   <a href="#"> <img class="img-fluid"
                                                      src="img/list/3.png">
                                                      <h6>Soups</h6> <small>2 ITEMS</small>
                                                   </a>
                                                </div>
                                             </div>
                                          </div>
                                          <div class="owl-item cloned" style="width: 136.4px;">
                                             <div class="item">
                                                <div class="mall-category-item">
                                                   <a href="#"> <img class="img-fluid"
                                                      src="img/list/4.png">
                                                      <h6>Pizzas</h6> <small>56 ITEMS</small>
                                                   </a>
                                                </div>
                                             </div>
                                          </div>
                                          <div class="owl-item cloned" style="width: 136.4px;">
                                             <div class="item">
                                                <div class="mall-category-item">
                                                   <a href="#"> <img class="img-fluid"
                                                      src="img/list/5.png">
                                                      <h6>Pastas</h6> <small>10 ITEMS</small>
                                                   </a>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="owl-nav">
                                       <button type="button" role="presentation" class="owl-prev">
                                          <i class="icofont-thin-left"></i>
                                       </button>
                                       <button type="button" role="presentation" class="owl-next">
                                          <i class="icofont-thin-right"></i>
                                       </button>
                                    </div>
                                    <div class="owl-dots disabled"></div>
                                 </div>
                              </div>
                              <div class="row">
                                 <h5 class="mb-4 mt-3 col-md-12">Best Sellers</h5>
                                 <div class="col-md-4 col-sm-6 mb-4">
                                    <div
                                       class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm">
                                       <div class="list-card-image">
                                          <div class="star position-absolute">
                                             <span class="badge badge-success"><i
                                                class="icofont-star"></i> 3.1 (300+)</span>
                                          </div>
                                          <div class="favourite-heart text-danger position-absolute">
                                             <a href="#"><i class="icofont-heart"></i></a>
                                          </div>
                                          <div class="member-plan position-absolute">
                                             <span class="badge badge-dark">Promoted</span>
                                          </div>
                                          <a href="#"> <img src="img/list/7.png"
                                             class="img-fluid item-img">
                                          </a>
                                       </div>
                                       <div class="p-3 position-relative">
                                          <div class="list-card-body">
                                             <h6 class="mb-1">
                                                <a href="#" class="text-black">Bite Me Sandwiches</a>
                                             </h6>
                                             <p class="text-gray mb-2">North Indian • Indian</p>
                                             <p class="text-gray time mb-0">
                                                <a class="btn btn-link btn-sm pl-0 text-black pr-0"
                                                   href="#">$550 </a> <span class="badge badge-success">NEW</span>
                                                <span class="float-right"> <a
                                                   class="btn btn-outline-secondary btn-sm" href="#">ADD</a>
                                                </span>
                                             </p>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 <div class="col-md-4 col-sm-6 mb-4">
                                    <div
                                       class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm">
                                       <div class="list-card-image">
                                          <div class="star position-absolute">
                                             <span class="badge badge-success"><i
                                                class="icofont-star"></i> 3.1 (300+)</span>
                                          </div>
                                          <div class="favourite-heart text-danger position-absolute">
                                             <a href="#"><i class="icofont-heart"></i></a>
                                          </div>
                                          <div class="member-plan position-absolute">
                                             <span class="badge badge-dark">Promoted</span>
                                          </div>
                                          <a href="#"> <img src="img/list/8.png"
                                             class="img-fluid item-img">
                                          </a>
                                       </div>
                                       <div class="p-3 position-relative">
                                          <div class="list-card-body">
                                             <h6 class="mb-1">
                                                <a href="#" class="text-black">Famous Dave's Bar-B </a>
                                             </h6>
                                             <p class="text-gray mb-2">Hamburgers • Indian</p>
                                             <p class="text-gray time mb-0">
                                                <a class="btn btn-link btn-sm pl-0 text-black pr-0"
                                                   href="#">$250 </a> <span class="badge badge-primary">NEW</span>
                                                <span class="float-right"> <span
                                                   class="count-number">
                                                      <button
                                                         class="btn btn-outline-secondary  btn-sm left dec">
                                                         <i class="icofont-minus"></i>
                                                      </button> <input class="count-number-input" type="text"
                                                      value="1" readonly="">
                                                      <button
                                                         class="btn btn-outline-secondary btn-sm right inc">
                                                         <i class="icofont-plus"></i>
                                                      </button>
                                                </span>
                                                </span>
                                             </p>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 <div class="col-md-4 col-sm-6 mb-4">
                                    <div
                                       class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm">
                                       <div class="list-card-image">
                                          <div class="star position-absolute">
                                             <span class="badge badge-success"><i
                                                class="icofont-star"></i> 3.1 (300+)</span>
                                          </div>
                                          <div class="favourite-heart text-danger position-absolute">
                                             <a href="#"><i class="icofont-heart"></i></a>
                                          </div>
                                          <div class="member-plan position-absolute">
                                             <span class="badge badge-dark">Promoted</span>
                                          </div>
                                          <a href="#"> <img src="img/list/9.png"
                                             class="img-fluid item-img">
                                          </a>
                                       </div>
                                       <div class="p-3 position-relative">
                                          <div class="list-card-body">
                                             <h6 class="mb-1">
                                                <a href="#" class="text-black">Bite Me Sandwiches</a>
                                             </h6>
                                             <p class="text-gray mb-2">North Indian • Indian</p>
                                             <p class="text-gray time mb-0">
                                                <a class="btn btn-link btn-sm pl-0 text-black pr-0"
                                                   href="#">$250 </a> <span class="badge badge-info">NEW</span>
                                                <span class="float-right"> <a
                                                   class="btn btn-outline-secondary btn-sm" href="#">ADD</a>
                                                </span>
                                             </p>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div class="row">
                                 <h5 class="mb-4 mt-3 col-md-12">
                                    Quick Bites <small class="h6 text-black-50">3 ITEMS</small>
                                 </h5>
                                 <div class="col-md-12">
                                    <div class="bg-white rounded border shadow-sm mb-4">
                                       <div class="gold-members p-3 border-bottom">
                                          <a class="btn btn-outline-secondary btn-sm  float-right"
                                             href="#">ADD</a>
                                          <div class="media">
                                             <div class="mr-3">
                                                <i class="icofont-ui-press text-danger food-item"></i>
                                             </div>
                                             <div class="media-body">
                                                <h6 class="mb-1">Chicken Tikka Sub</h6>
                                                <p class="text-gray mb-0">$314 - 12" (30 cm)</p>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="gold-members p-3 border-bottom">
                                          <span class="count-number float-right">
                                             <button
                                                class="btn btn-outline-secondary  btn-sm left dec">
                                                <i class="icofont-minus"></i>
                                             </button> <input class="count-number-input" type="text" value="1"
                                             readonly="">
                                             <button
                                                class="btn btn-outline-secondary btn-sm right inc">
                                                <i class="icofont-plus"></i>
                                             </button>
                                          </span>
                                          <div class="media">
                                             <div class="mr-3">
                                                <i class="icofont-ui-press text-danger food-item"></i>
                                             </div>
                                             <div class="media-body">
                                                <h6 class="mb-1">
                                                   Cheese corn Roll <span class="badge badge-danger">BESTSELLER</span>
                                                </h6>
                                                <p class="text-gray mb-0">$600</p>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="gold-members p-3">
                                          <span class="count-number float-right">
                                             <button
                                                class="btn btn-outline-secondary  btn-sm left dec">
                                                <i class="icofont-minus"></i>
                                             </button> <input class="count-number-input" type="text" value="1"
                                             readonly="">
                                             <button
                                                class="btn btn-outline-secondary btn-sm right inc">
                                                <i class="icofont-plus"></i>
                                             </button>
                                          </span>
                                          <div class="media">
                                             <div class="mr-3">
                                                <i class="icofont-ui-press text-success food-item"></i>
                                             </div>
                                             <div class="media-body">
                                                <h6 class="mb-1">
                                                   Cheese Spinach corn Roll <span
                                                      class="badge badge-success">Pure Veg</span>
                                                </h6>
                                                <p class="text-gray mb-0">$600</p>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div class="row">
                                 <h5 class="mb-4 mt-3 col-md-12">
                                    Starters <small class="h6 text-black-50">3 ITEMS</small>
                                 </h5>
                                 <div class="col-md-12">
                                    <div class="bg-white rounded border shadow-sm mb-4">
                                       <div class="menu-list p-3 border-bottom">
                                          <span class="count-number float-right">
                                             <button
                                                class="btn btn-outline-secondary  btn-sm left dec">
                                                <i class="icofont-minus"></i>
                                             </button> <input class="count-number-input" type="text" value="1"
                                             readonly="">
                                             <button
                                                class="btn btn-outline-secondary btn-sm right inc">
                                                <i class="icofont-plus"></i>
                                             </button>
                                          </span>
                                          <div class="media">
                                             <img class="mr-3 rounded-pill" src="img/5.jpg"
                                                alt="Generic placeholder image">
                                             <div class="media-body">
                                                <h6 class="mb-1">Veg Spring Roll</h6>
                                                <p class="text-gray mb-0">$314 - 12" (30 cm)</p>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="menu-list p-3 border-bottom">
                                          <span class="count-number float-right">
                                             <button
                                                class="btn btn-outline-secondary  btn-sm left dec">
                                                <i class="icofont-minus"></i>
                                             </button> <input class="count-number-input" type="text" value="1"
                                             readonly="">
                                             <button
                                                class="btn btn-outline-secondary btn-sm right inc">
                                                <i class="icofont-plus"></i>
                                             </button>
                                          </span>
                                          <div class="media">
                                             <img class="mr-3 rounded-pill" src="img/2.jpg"
                                                alt="Generic placeholder image">
                                             <div class="media-body">
                                                <h6 class="mb-1">
                                                   Stuffed Mushroom <span class="badge badge-danger">BESTSELLER</span>
                                                </h6>
                                                <p class="text-gray mb-0">$600</p>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="menu-list p-3">
                                          <span class="count-number float-right">
                                             <button
                                                class="btn btn-outline-secondary  btn-sm left dec">
                                                <i class="icofont-minus"></i>
                                             </button> <input class="count-number-input" type="text" value="1"
                                             readonly="">
                                             <button
                                                class="btn btn-outline-secondary btn-sm right inc">
                                                <i class="icofont-plus"></i>
                                             </button>
                                          </span>
                                          <div class="media">
                                             <img class="mr-3 rounded-pill" src="img/3.jpg"
                                                alt="Generic placeholder image">
                                             <div class="media-body">
                                                <h6 class="mb-1">
                                                   Honey Chilli Potato <span class="badge badge-success">Pure
                                                      Veg</span>
                                                </h6>
                                                <p class="text-gray mb-0">$600</p>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div class="row">
                                 <h5 class="mb-4 mt-3 col-md-12">
                                    Soups <small class="h6 text-black-50">8 ITEMS</small>
                                 </h5>
                                 <div class="col-md-12">
                                    <div class="bg-white rounded border shadow-sm">
                                       <div class="gold-members p-3 border-bottom">
                                          <a class="btn btn-outline-secondary btn-sm  float-right"
                                             href="#">ADD</a>
                                          <div class="media">
                                             <div class="mr-3">
                                                <i class="icofont-ui-press text-danger food-item"></i>
                                             </div>
                                             <div class="media-body">
                                                <h6 class="mb-1">Tomato Dhania Shorba</h6>
                                                <p class="text-gray mb-0">$314 - 12" (30 cm)</p>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="gold-members p-3 border-bottom">
                                          <a class="btn btn-outline-secondary btn-sm  float-right"
                                             href="#">ADD</a>
                                          <div class="media">
                                             <div class="mr-3">
                                                <i class="icofont-ui-press text-danger food-item"></i>
                                             </div>
                                             <div class="media-body">
                                                <h6 class="mb-1">Veg Manchow Soup</h6>
                                                <p class="text-gray mb-0">$600</p>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="gold-members p-3 border-bottom">
                                          <span class="count-number float-right">
                                             <button
                                                class="btn btn-outline-secondary  btn-sm left dec">
                                                <i class="icofont-minus"></i>
                                             </button> <input class="count-number-input" type="text" value="1"
                                             readonly="">
                                             <button
                                                class="btn btn-outline-secondary btn-sm right inc">
                                                <i class="icofont-plus"></i>
                                             </button>
                                          </span>
                                          <div class="media">
                                             <div class="mr-3">
                                                <i class="icofont-ui-press text-success food-item"></i>
                                             </div>
                                             <div class="media-body">
                                                <h6 class="mb-1">Lemon Coriander Soup</h6>
                                                <p class="text-gray mb-0">$600</p>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="gold-members p-3 border-bottom">
                                          <a class="btn btn-outline-secondary btn-sm  float-right"
                                             href="#">ADD</a>
                                          <div class="media">
                                             <div class="mr-3">
                                                <i class="icofont-ui-press text-danger food-item"></i>
                                             </div>
                                             <div class="media-body">
                                                <h6 class="mb-1">Tomato Dhania Shorba</h6>
                                                <p class="text-gray mb-0">$314 - 12" (30 cm)</p>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="gold-members p-3 border-bottom">
                                          <a class="btn btn-outline-secondary btn-sm  float-right"
                                             href="#">ADD</a>
                                          <div class="media">
                                             <div class="mr-3">
                                                <i class="icofont-ui-press text-danger food-item"></i>
                                             </div>
                                             <div class="media-body">
                                                <h6 class="mb-1">Veg Manchow Soup</h6>
                                                <p class="text-gray mb-0">$600</p>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="gold-members p-3">
                                          <a class="btn btn-outline-secondary btn-sm  float-right"
                                             href="#">ADD</a>
                                          <div class="media">
                                             <div class="mr-3">
                                                <i class="icofont-ui-press text-success food-item"></i>
                                             </div>
                                             <div class="media-body">
                                                <h6 class="mb-1">Lemon Coriander Soup</h6>
                                                <p class="text-gray mb-0">$600</p>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <div class="tab-pane fade" id="pills-gallery" role="tabpanel"
                              aria-labelledby="pills-gallery-tab">
                              <div id="gallery" class="bg-white rounded shadow-sm p-4 mb-4">
                                 <div
                                    class="restaurant-slider-main position-relative homepage-great-deals-carousel">
                                    <div
                                       class="owl-carousel owl-theme homepage-ad owl-loaded owl-drag owl-hidden">

                                       <div class="owl-stage-outer">
                                          <div class="owl-stage"
                                             style="transform: translate3d(-1364px, 0px, 0px); transition: all 0s ease 0s; width: 8184px;">
                                             <div class="owl-item cloned" style="width: 682px;">
                                                <div class="item">
                                                   <img class="img-fluid" src="img/gallery/1.png">
                                                </div>
                                             </div>
                                             <div class="owl-item cloned" style="width: 682px;">
                                                <div class="item">
                                                   <img class="img-fluid" src="img/gallery/2.png">
                                                </div>
                                             </div>
                                             <div class="owl-item cloned" style="width: 682px;">
                                                <div class="item">
                                                   <img class="img-fluid" src="img/gallery/3.png">
                                                </div>
                                             </div>
                                             <div class="owl-item active" style="width: 682px;">
                                                <div class="item">
                                                   <img class="img-fluid" src="img/gallery/1.png">
                                                </div>
                                             </div>
                                             <div class="owl-item" style="width: 682px;">
                                                <div class="item">
                                                   <img class="img-fluid" src="img/gallery/2.png">
                                                </div>
                                             </div>
                                             <div class="owl-item" style="width: 682px;">
                                                <div class="item">
                                                   <img class="img-fluid" src="img/gallery/3.png">
                                                </div>
                                             </div>
                                             <div class="owl-item" style="width: 682px;">
                                                <div class="item">
                                                   <img class="img-fluid" src="img/gallery/1.png">
                                                </div>
                                             </div>
                                             <div class="owl-item" style="width: 682px;">
                                                <div class="item">
                                                   <img class="img-fluid" src="img/gallery/2.png">
                                                </div>
                                             </div>
                                             <div class="owl-item" style="width: 682px;">
                                                <div class="item">
                                                   <img class="img-fluid" src="img/gallery/3.png">
                                                </div>
                                             </div>
                                             <div class="owl-item cloned" style="width: 682px;">
                                                <div class="item">
                                                   <img class="img-fluid" src="img/gallery/1.png">
                                                </div>
                                             </div>
                                             <div class="owl-item cloned" style="width: 682px;">
                                                <div class="item">
                                                   <img class="img-fluid" src="img/gallery/2.png">
                                                </div>
                                             </div>
                                             <div class="owl-item cloned" style="width: 682px;">
                                                <div class="item">
                                                   <img class="img-fluid" src="img/gallery/3.png">
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="owl-nav">
                                          <button type="button" role="presentation" class="owl-prev">
                                             <i class="fa fa-chevron-left"></i>
                                          </button>
                                          <button type="button" role="presentation" class="owl-next">
                                             <i class="fa fa-chevron-right"></i>
                                          </button>
                                       </div>
                                       <div class="owl-dots disabled"></div>
                                    </div>
                                    <div
                                       class="position-absolute restaurant-slider-pics bg-dark text-white">2
                                       of 14 Photos</div>
                                    <div class="position-absolute restaurant-slider-view-all">
                                       <button type="button" class="btn btn-light bg-white">See
                                          all Photos</button>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <div class="tab-pane fade" id="pills-restaurant-info"
                              role="tabpanel" aria-labelledby="pills-restaurant-info-tab">
                              <div id="restaurant-info"
                                 class="bg-white rounded shadow-sm p-4 mb-4">
                                 <div class="address-map float-right ml-5">
                                    <div class="mapouter">
                                       <div class="gmap_canvas">
                                          <iframe width="300" height="170" id="gmap_canvas"
                                             src="https://maps.google.com/maps?q=university%20of%20san%20francisco&amp;t=&amp;z=9&amp;ie=UTF8&amp;iwloc=&amp;output=embed"
                                             frameborder="0" scrolling="no" marginheight="0"
                                             marginwidth="0"></iframe>
                                       </div>
                                    </div>
                                 </div>
                                 <h5 class="mb-4">Restaurant Info</h5>
                                 <p class="mb-3">
                                    Jagjit Nagar, Near Railway Crossing, <br> Near Model
                                    Town, Ludhiana, PUNJAB
                                 </p>
                                 <p class="mb-2 text-black">
                                    <i class="icofont-phone-circle text-primary mr-2"></i> +91
                                    01234-56789, +91 01234-56789
                                 </p>
                                 <p class="mb-2 text-black">
                                    <i class="icofont-email text-primary mr-2"></i>
                                    iamosahan@gmail.com, osahaneat@gmail.com
                                 </p>
                                 <p class="mb-2 text-black">
                                    <i class="icofont-clock-time text-primary mr-2"></i> Today
                                    11am – 5pm, 6pm – 11pm <span class="badge badge-success">
                                       OPEN NOW </span>
                                 </p>
                                 <hr class="clearfix">
                                 <p class="text-black mb-0">
                                    You can also check the 3D view by using our menue map
                                    clicking here &nbsp;&nbsp;&nbsp; <a
                                       class="text-info font-weight-bold" href="#">Venue Map</a>
                                 </p>
                                 <hr class="clearfix">
                                 <h5 class="mt-4 mb-4">More Info</h5>
                                 <p class="mb-3">Dal Makhani, Panneer Butter Masala,
                                    Kadhai Paneer, Raita, Veg Thali, Laccha Paratha, Butter Naan</p>
                                 <div class="border-btn-main mb-4">
                                    <a class="border-btn text-success mr-2" href="#"><i
                                       class="icofont-check-circled"></i> Breakfast</a> <a
                                       class="border-btn text-danger mr-2" href="#"><i
                                       class="icofont-close-circled"></i> No Alcohol Available</a> <a
                                       class="border-btn text-success mr-2" href="#"><i
                                       class="icofont-check-circled"></i> Vegetarian Only</a> <a
                                       class="border-btn text-success mr-2" href="#"><i
                                       class="icofont-check-circled"></i> Indoor Seating</a> <a
                                       class="border-btn text-success mr-2" href="#"><i
                                       class="icofont-check-circled"></i> Breakfast</a> <a
                                       class="border-btn text-danger mr-2" href="#"><i
                                       class="icofont-close-circled"></i> No Alcohol Available</a> <a
                                       class="border-btn text-success mr-2" href="#"><i
                                       class="icofont-check-circled"></i> Vegetarian Only</a>
                                 </div>
                              </div>
                           </div>
                           <div class="tab-pane fade" id="pills-book" role="tabpanel"
                              aria-labelledby="pills-book-tab">
                              <div id="book-a-table"
                                 class="bg-white rounded shadow-sm p-4 mb-5 rating-review-select-page">
                                 <h5 class="mb-4">Book A Table</h5>
                                 <form>
                                    <div class="row">
                                       <div class="col-sm-6">
                                          <div class="form-group">
                                             <label>Full Name</label> <input class="form-control"
                                                type="text" placeholder="Enter Full Name">
                                          </div>
                                       </div>
                                       <div class="col-sm-6">
                                          <div class="form-group">
                                             <label>Email Address</label> <input class="form-control"
                                                type="text" placeholder="Enter Email address">
                                          </div>
                                       </div>
                                    </div>
                                    <div class="row">
                                       <div class="col-sm-6">
                                          <div class="form-group">
                                             <label>Mobile number</label> <input class="form-control"
                                                type="text" placeholder="Enter Mobile number">
                                          </div>
                                       </div>
                                       <div class="col-sm-6">
                                          <div class="form-group">
                                             <label>Date And Time</label> <input class="form-control"
                                                type="text" placeholder="Enter Date And Time">
                                          </div>
                                       </div>
                                    </div>
                                    <div class="form-group text-right">
                                       <button class="btn btn-primary" type="button">
                                          Submit</button>
                                    </div>
                                 </form>
                              </div>
                           </div>
                           <div class="tab-pane fade active show" id="pills-reviews"
                              role="tabpanel" aria-labelledby="pills-reviews-tab">
                              <div id="ratings-and-reviews"
                                 class="bg-white rounded shadow-sm p-4 mb-4 clearfix restaurant-detailed-star-rating">
                                 <span class="star-rating float-right"> <a href="#"><i
                                       class="icofont-ui-rating icofont-2x active"></i></a> <a
                                    href="#"><i class="icofont-ui-rating icofont-2x active"></i></a>
                                    <a href="#"><i
                                       class="icofont-ui-rating icofont-2x active"></i></a> <a
                                    href="#"><i class="icofont-ui-rating icofont-2x active"></i></a>
                                    <a href="#"><i class="icofont-ui-rating icofont-2x"></i></a>
                                 </span>
                                 <h5 class="mb-0 pt-1">Rate this Place</h5>
                              </div>
                              <div
                                 class="bg-white rounded shadow-sm p-4 mb-4 clearfix graph-star-rating">
                                 <h5 class="mb-0 mb-4">Ratings and Reviews</h5>
                                 <div class="graph-star-rating-header">
                                    <div class="star-rating">
                                       <a href="#"><i class="icofont-ui-rating active"></i></a> <a
                                          href="#"><i class="icofont-ui-rating active"></i></a> <a
                                          href="#"><i class="icofont-ui-rating active"></i></a> <a
                                          href="#"><i class="icofont-ui-rating active"></i></a> <a
                                          href="#"><i class="icofont-ui-rating"></i></a> <b
                                          class="text-black ml-2">334</b>
                                    </div>
                                    <p class="text-black mb-4 mt-2">Rated 3.5 out of 5</p>
                                 </div>
                                 <div class="graph-star-rating-body">
                                    <div class="rating-list">
                                       <div class="rating-list-left text-black">5 Star</div>
                                       <div class="rating-list-center">
                                          <div class="progress">
                                             <div style="width: 56%" aria-valuemax="5"
                                                aria-valuemin="0" aria-valuenow="5" role="progressbar"
                                                class="progress-bar bg-primary">
                                                <span class="sr-only">80% Complete (danger)</span>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="rating-list-right text-black">56%</div>
                                    </div>
                                    <div class="rating-list">
                                       <div class="rating-list-left text-black">4 Star</div>
                                       <div class="rating-list-center">
                                          <div class="progress">
                                             <div style="width: 23%" aria-valuemax="5"
                                                aria-valuemin="0" aria-valuenow="5" role="progressbar"
                                                class="progress-bar bg-primary">
                                                <span class="sr-only">80% Complete (danger)</span>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="rating-list-right text-black">23%</div>
                                    </div>
                                    <div class="rating-list">
                                       <div class="rating-list-left text-black">3 Star</div>
                                       <div class="rating-list-center">
                                          <div class="progress">
                                             <div style="width: 11%" aria-valuemax="5"
                                                aria-valuemin="0" aria-valuenow="5" role="progressbar"
                                                class="progress-bar bg-primary">
                                                <span class="sr-only">80% Complete (danger)</span>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="rating-list-right text-black">11%</div>
                                    </div>
                                    <div class="rating-list">
                                       <div class="rating-list-left text-black">2 Star</div>
                                       <div class="rating-list-center">
                                          <div class="progress">
                                             <div style="width: 2%" aria-valuemax="5"
                                                aria-valuemin="0" aria-valuenow="5" role="progressbar"
                                                class="progress-bar bg-primary">
                                                <span class="sr-only">80% Complete (danger)</span>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="rating-list-right text-black">02%</div>
                                    </div>
                                 </div>
                                 <div class="graph-star-rating-footer text-center mt-3 mb-3">
                                    <button type="button" class="btn btn-outline-primary btn-sm">Rate
                                       and Review</button>
                                 </div>
                              </div>
                              <div
                                 class="bg-white rounded shadow-sm p-4 mb-4 restaurant-detailed-ratings-and-reviews">
                                 <a href="#"
                                    class="btn btn-outline-primary btn-sm float-right">Top
                                    Rated</a>
                                 <h5 class="mb-1">All Ratings and Reviews</h5>
                             
                                 <c:forEach items="${reslist}" var="reviewlist">
                                 <hr>
                                 <div class="reviews-members pt-4 pb-4">
                                    <div class="media">
                                       <a href="#"><img alt="Generic placeholder image"
                                          src="http://bootdey.com/img/Content/avatar/avatar6.png"
                                          class="mr-3 rounded-pill"></a>
                                       <div class="media-body">
                                          <div class="reviews-members-header">
                                             <span class="star-rating float-right"> <a href="#"><i
                                                   class="icofont-ui-rating active"></i></a> <a href="#"><i
                                                   class="icofont-ui-rating active"></i></a> <a href="#"><i
                                                   class="icofont-ui-rating active"></i></a> <a href="#"><i
                                                   class="icofont-ui-rating active"></i></a> <a href="#"><i
                                                   class="icofont-ui-rating"></i></a>
                                             </span>
                                             <h6 class="mb-1">
                                                <a class="text-black" href="#">${reviewlist.mname}</a>
                                             </h6>
                                             <div class="text-gray">별점 : ${reviewlist.point}</div>
                                          </div>
                                          <div class="reviews-members-body">
                                             <p>${reviewlist.review}</p>
                                          </div>
                                          <div class="reviews-members-footer">
                                             <a class="total-like" href="#"><i
                                                class="icofont-thumbs-up"></i> 88K</a> <a class="total-like"
                                                href="#"><i class="icofont-thumbs-down"></i> 1K</a> <span
                                                class="total-like-user-main ml-2" dir="rtl"> <a
                                                data-toggle="tooltip" data-placement="top" title=""
                                                href="#" data-original-title="Gurdeep Osahan"><img
                                                   alt="Generic placeholder image"
                                                   src="http://bootdey.com/img/Content/avatar/avatar5.png"
                                                   class="total-like-user rounded-pill"></a> <a
                                                data-toggle="tooltip" data-placement="top" title=""
                                                href="#" data-original-title="Gurdeep Singh"><img
                                                   alt="Generic placeholder image"
                                                   src="http://bootdey.com/img/Content/avatar/avatar2.png"
                                                   class="total-like-user rounded-pill"></a> <a
                                                data-toggle="tooltip" data-placement="top" title=""
                                                href="#" data-original-title="Askbootstrap"><img
                                                   alt="Generic placeholder image"
                                                   src="http://bootdey.com/img/Content/avatar/avatar3.png"
                                                   class="total-like-user rounded-pill"></a> <a
                                                data-toggle="tooltip" data-placement="top" title=""
                                                href="#" data-original-title="Osahan"><img
                                                   alt="Generic placeholder image"
                                                   src="http://bootdey.com/img/Content/avatar/avatar4.png"
                                                   class="total-like-user rounded-pill"></a>
                                             </span>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 </c:forEach>
                                 <hr>
                                 <a class="text-center w-100 d-block mt-4 font-weight-bold"
                                    href="#">See All Reviews</a>
                              </div>

                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </article>

         </div>
         <!-- 오른쪽 달력바 -->
         <div class="col-md-4">
            <div class="position-sticky" style="top: 2rem;">

               <main class="page payment-page">
                  <section class="payment-form dark">
                     <div class="container">
                        <form action="/res/reservdetail" method="post">
                           <!--달력 -->
                           <input onchange="daysPriceCalc()" type="text" id="from"
                              name="rstart" value="${resVO.rstart}"> <input
                              onchange="daysPriceCalc()" type="text" id="to" name="rend"
                              value="${resVO.rend}">
                           <!-- 히든 value -->
                           <input type="hidden" value="${resVO.aid}" name="aid">
                           <div class="products">
                              <h3 class="title">금액</h3>
                              <div class="item">
                                 <span class="price">${resVO.aprice}원</span> <input
                                    id="rprice" type="hidden" value="${resVO.aprice}">
                                 <p class="item-name">1일숙박비</p>
                              </div>
                              <div class="item" id="days">
                                 <span class="price">${resVO.days}박</span>
                                 <input id="dayshidden" type="hidden" name="days" value="${resVO.days}">
                                 <p class="item-name">숙박일수</p>
                              </div>
                              <div class="total" id="resultprice">
                                 Total<span class="price" >${resVO.resultprice}원</span>
                                 <input id="resultpricehidden" type="hidden" name="resultprice" value="${resVO.resultprice}">
                              </div>
                           </div>
                           <div class="form-group col-sm-12">
                              <button type="submit" class="btn btn-primary"
                                 data-bs-toggle="modal" data-bs-target="#staticBackdropLive">
                                 예약하기</button>
                           </div>
                        </form>
                     </div>
                  </section>
               </main>
            </div>
         </div>
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
            <li class="nav-item"><a href="#"
               class="nav-link px-2 text-muted">FAQs</a></li>
            <li class="nav-item"><a href="#"
               class="nav-link px-2 text-muted">About</a></li>
         </ul>
         <p class="text-center text-muted">© 2021 Company, Inc</p>
      </footer>
   </div>
</body>
</html>