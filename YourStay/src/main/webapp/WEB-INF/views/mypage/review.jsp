<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="en">
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="utf-8">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.84.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>Review Write Page</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.0/examples/album/">

<!-- 구글웹폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap"
   rel="stylesheet">

<!-- Bootstrap core CSS -->
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="/css/blog.css" rel="stylesheet">
<link href="/css/footers.css" rel="stylesheet">
<link href="/css/features.css" rel="stylesheet">
<link href="/css/star.css" rel="stylesheet">

<!-- <link rel="stylesheet" href="style.css"> -->
<link href="/css/file.css" rel="stylesheet">


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

.star-rating {
	display: flex;
	flex-direction: row-reverse;
	font-size: 2.25rem;
	line-height: 2.5rem;
	justify-content: space-around;
	padding: 0 0.2em;
	text-align: center;
	width: 5em;
}

.star-rating input {
	display: none;
}

.star-rating label {
	-webkit-text-fill-color: transparent;
	/* Will override color (regardless of order) */
	-webkit-text-stroke-width: 2.3px;
	-webkit-text-stroke-color: #2b2a29;
	cursor: pointer;
}

.star-rating :checked ~ label {
	-webkit-text-fill-color: gold;
}

.star-rating label:hover, .star-rating label:hover ~ label {
	-webkit-text-fill-color: #fff58c;
}

/* 모형 만들기  */
.div-shape {
	width: 50px;
	height: 110px;
	background-color: #2AC1BC;
	border-radius: 10%;
}
body, div, header,a{
      font-family: 'Poor Story', cursive;
   }
</style>

<!-- jquery webjars add -->
<script src="/webjars/jquery/3.6.0/jquery.min.js"></script>

<script type="text/javascript">
	/*
	   //체크박스 하나만 체크되도록 하는 기능! 
	    function oneCheckbox(a){
	       var obj = document.getElementsByName("checkbox1");
	       for(var i=0; i<obj.length; i++){
	           if(obj[i] != a){
	               obj[i].checked = false;
	           }
	       }
	   } */

	$(document).ready(function() {
		$(".star_rating a").click(function() {
			$(this).parent().children("a").removeClass("on");
			$(this).addClass("on").prevAll("a").addClass("on");
			return false;
		});
	});
</script>
<%
	String memail = (String) session.getAttribute("memail");
%>
</head>

<body>
	<header class="blog-header py-3" style="margin-bottom: 5%;">
		<div
			class="row flex-nowrap justify-content-between align-items-center">
			<div class="col-4 pt-1"></div>
			<div class="col-4 text-center">
				<a class="blog-header-logo text-dark" href="/"
					style="text-decoration: none">YourStay</a>
			</div>
			<div class="col-4 d-flex justify-content-end align-items-center">
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
							반갑습니다!
						</a>
						<a href="../login/logout.do" class="btn btn-secondary"
							style="background-color: #2AC1BC !important; border-color: #2AC1BC !important;">로그아웃</a>
						<%
							}
						%>
					</c:when>
					<c:otherwise>
						<a href="/mypage/home" style="margin-top: 3%; margin-right: 3%;"><%=memail%>님
							반갑습니다!
						</a>
						<a href="../login/logout.do" class="btn btn-secondary"
							style="background-color: #2AC1BC !important; border-color: #2AC1BC !important;">로그아웃</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</header>

	<!-- 본 내용  -->
	<main class="container">
		<h1>
			<b>평가 및 후기 </b>
		</h1>

		<!-- 이미지 등록부분  -->
		<form method="post" enctype="multipart/form-data"
			action="/review/registerReview">

			<input type="hidden" name="aid" value="${member.aid}"> 
			<input type="hidden" name="mseq" value="${member.mseq}">

			<div class="container px-4 py-5" id="custom-cards">
				<h2 class="pb-2 border-bottom">Review 이미지 등록</h2>

				<div
					class="row row-cols-1 row-cols-lg-3 align-items-stretch g-4 py-5">

					<div class="col">
						<div
							class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-5 shadow-lg imageUp"
							id="image-show"
							style="background-image: url('unsplash-photo-1.jpg');">
							<div
								class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1"
								id="divImg1"
								style="z-index: 1; align-items: center; padding-left: 0px; padding-top: 3rem; padding-bottom: 300px;">
								<div class="container">
									<div style="margin-top: 50px;" class="image-upload"
										id="image-upload">

										<div class="button">
											<label for="chooseFile"> 사진등록 <span> </span> <img
												src="/images/camera2.png" id="img1" alt="Bootstrap"
												width="32" height="32"
												class="rounded-circle border border-white">
											</label>
										</div>
										<input type="file" id="chooseFile" name="file"
											accept="image/*" onchange="loadFile(this)">

										<div class="fileContainer">
											<div class="fileInput" style="border: none;">
												<p id="fileName"></p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Review 글 작성 부분 -->
			<div class="my-3 p-3 bg-body rounded shadow-sm">
				<h6 class="border-bottom pb-2 mb-0">리뷰 내용 작성</h6>
				<div class="d-flex text-muted pt-3">
					<div class="div-shape"></div>

					<p class="pb-3 mb-0 small lh-sm border-bottom"
						style="margin-left: 10px">
						<strong class="d-block text-gray-dark">${member.mname}</strong><br />
						<textarea rows="4" cols="150" width="100%" height="auto"
							name="review"></textarea>

					</p>
				</div>

				<br />

				<!-- 별점부분 구현 -->
				<div>
					<span class="border-bottom" style="margin-left: 20px"> 평점 </span>
					<div class="star-rating space-x-4 mx-auto">

						<input type="radio" id="5-stars" name="point" value=5
							v-model="ratings" /> <label for="5-stars" class="star pr-4">★</label>
						<input type="radio" id="4-stars" name="point" value=4
							v-model="ratings" /> <label for="4-stars" class="star">★</label>
						<input type="radio" id="3-stars" name="point" value=3
							v-model="ratings" /> <label for="3-stars" class="star">★</label>
						<input type="radio" id="2-stars" name="point" value=2
							v-model="ratings" /> <label for="2-stars" class="star">★</label>
						<input type="radio" id="1-star" name="point" value=1
							v-model="ratings" /> <label for="1-star" class="star">★</label>
					</div>
				</div>
				<small class="d-block text-end mt-3"> <a href="#"
					style="text-decoration: none">상단으로 올라가기</a>
				</small>
			</div>

			<button class="btn btn-sm btn-outline-secondary" type="submit">등록하기</button>
		</form>
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
	<script src="/js/index.js"></script>
</body>
</html>