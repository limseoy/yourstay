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
//제외 할 날짜 배열
var disabledDays = [];
 <c:forEach items="${datelist}" var="dlist">
   console.log("${dlist.rdate}");
   disabledDays.push("${dlist.rdate}");
</c:forEach>  
console.log(disabledDays);

// 날짜를 나타내기 전에(beforeShowDay) 실행할 함수
function disableSomeDay(date) {
   console.log("disableSomeDay 실행");
   console.log(disabledDays);
   var month = date.getMonth()+1;
   var dates = date.getDate();
   var year = date.getFullYear();
   var format = year+"-"+(("00"+month.toString()).slice(-2))+"-"+(("00"+dates.toString()).slice(-2));
   console.log('Checking (raw): ' + year + '-' + month + '-' + dates);
   console.log('format: ' + format);
   
   // 배열에 해당하는 날짜는 0번째 index에 false를 담아 리턴해준다.
   for (i = 0; i < disabledDays.length; i++) {
      if($.inArray(format,disabledDays) != -1) {// disabledDays 배열내에서 해당 날짜가 있을시
         console.log("False");
         return [ false ];
      }
   }
   console.log("True");
   return [ true ];
}

$(function() {
   $("#from").datepicker({
      dateFormat: 'yy-mm-dd',
       prevText: '이전 달',
       nextText: '다음 달',
       monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
       monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
       dayNames: ['일','월','화','수','목','금','토'],
       dayNamesShort: ['일','월','화','수','목','금','토'],
       dayNamesMin: ['일','월','화','수','목','금','토'],
       showMonthAfterYear: true,
       changeMonth: true,
       changeYear: true,
       yearSuffix: '년',
       beforeShowDay: disableSomeDay
   });
   $("#to").datepicker({
      dateFormat: 'yy-mm-dd',
       prevText: '이전 달',
       nextText: '다음 달',
       monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
       monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
       dayNames: ['일','월','화','수','목','금','토'],
       dayNamesShort: ['일','월','화','수','목','금','토'],
       dayNamesMin: ['일','월','화','수','목','금','토'],
       showMonthAfterYear: true,
       changeMonth: true,
       changeYear: true,
       yearSuffix: '년',
       beforeShowDay: disableSomeDay
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
      $(function(){//
	      $(".wish").on("click", function(){
	         $.ajax({ 
	            url: "/mypage/wishlist/addwish",
	            type: "POST",
	            /* cache: "false", */
	            data: {aid : $("#aid").val(), mseq : $("#mseq").val()},
	            success: function(data){
	            	if(data.trim()=='deleteWishList'){
	            		alert("찜 취소 되었습니다.");
	            		$('.wish').css({"color": "black"});
	            	}else{
	            		$('.wish').css({"color": "pink"});
	            		alert("찜 등록 되었습니다.");
	            	}
	            },
	            error : function (data) {
	                alert('죄송!');
	                return false;
	            }  
	         });
	      });
	   });
</script>


<style>
body, h1, h2, h3,h4,h5 {
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
            <a class="blog-header-logo text-dark" href="/">YourStay</a>
         </div>
         <div class="col-4 d-flex justify-content-end align-items-center">

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
                  <h5></h5>
                  <p></p>
               </div>
            </div>
            <div class="carousel-item"
               style="background:url('../../../resources/images/roomImg/${resVO.aid}/${resVO.ipath2}') no-repeat;background-position: center;
  background-size: cover;">
               <div class="carousel-caption">
                  <h5></h5>
                  <p></p>
               </div>
            </div>
            <div class="carousel-item"
               style="background:url('../../../resources/images/roomImg/${resVO.aid}/${resVO.ipath3}') no-repeat;background-position: center;
  background-size: cover;">
               <div class="carousel-caption">
                  <h5></h5>
                  <p></p>
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
                  운영하는 숙소입니다 <i class='fas fa-hand-holding-heart wish'></i>
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
                          '                <img src="../../resources/images/logo.png" width="73" height="70">' +
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
                                          class="text-black ml-2">총 방문자 수 : ${reservation}</b>
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
                                 <h5 class="mb-1">All Ratings and Reviews</h5>
                             	 
                                 <c:forEach items="${reslist}" var="reviewlist">
                                 <hr>
                                 <div class="reviews-members pt-4 pb-4">
                                    <div class="media">
                                       <a href=""><img alt="Generic placeholder image"
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
                                             <c:if test="${reviewlist==null }">
			                             	 <h4>아직 후기가 없어요 ㅜ.ㅜ</h4>
			                             	 </c:if>
                                             <h6 class="mb-1">
                                                <a class="text-black" href="#">${reviewlist.mname}</a>
                                             </h6>
                                             <div class="text-gray">별점 : ${reviewlist.point}</div>
                                          </div>
                                          <div class="reviews-members-body">
                                             <p>${reviewlist.review}</p>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 </c:forEach>
                                 <hr>
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
                           <input type="hidden" value="${resVO.aid}" name="aid" id="aid">
                           <input type="hidden" value="${loginOkUser.mseq}" name="mseq" id="mseq">
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
</body>
</html>