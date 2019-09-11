<%@page import="study.model1.mybatis.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="study.model1.retrofit.model.Restaurants.Items"%>
<%@page import="java.util.List"%>
<%@page import="study.model1.retrofit.model.Restaurants"%>
<%@page import="retrofit2.Call"%>
<%@page import="study.model1.retrofit.service.RestaurantService"%>
<%@page import="study.model1.helper.WebHelper"%>
<%
	WebHelper webHelper = WebHelper.getInstance(request,response);
	String keyword = webHelper.getString("keyword");
	
	User loginInfo = (User) session.getAttribute("login_info");
	
	/* RestaurantService restaurantService = RestaurantService.retrofit.create(RestaurantService.class);
	Call<Restaurants> call = restaurantService.getRestaurantsList(query,10);
	Restaurants Restaurants = call.execute().body();
	
	List<Items> list = null;
	
	if(Restaurants != null){
		list = Restaurants.items;
	}  */

%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Landing Page - Start Bootstrap Theme</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
<link href="vendor/simple-line-icons/css/simple-line-icons.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- Custom styles for this template -->
<link href="css/landing-page.min.css" rel="stylesheet">




<!-- 아래의 스크립트를 <HEAD></HEAD> 사이에 넣으세요. -->

<!-- <script language=javascript>
	function popup5() { //팝업창을 여러개 띄우는 함수를 지정합니다. 
		window
				.open(
						'notice.jsp',
						'newwin1',
						'toolbar=no, location=no, directories=no, status=no,menubar=no, scrollbars=no, resizable=no, copyhistory=yes, height=280, width=220, left=40, top=70') //첫번째 팝업창을 띄웁니다.
		window
				.open(
						'event.jsp',
						'newwin2',
						'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=yes, height=280, width=220, left=90, top=100') //두번째 팝업창을 띄웁니다. 
	
	} -->
</script>

<!--<HEAD></HEAD> 부분에 여기까지 넣습니다.-->

</head>

<!--<BODY> 태그내에 onload="" 혹은 onunload="" 부분을 넣으세요-->

<body onLoad="popup5()">
	<!--브라우저가 열릴 때 popup5()함수를 실행합니다.-->
<body>
<%
	if(loginInfo == null){
%>
	<jsp:include page="header.jsp" flush="false" />

	<header class="masthead text-white text-center">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-xl-9 mx-auto">
					<h1 class="mb-5">원하시는 메뉴 혹은 가게이름을 적어주세요 .</h1>
				</div>
				<div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
					<form method = "get" action ="cate-Search.jsp">
						<div class="form-row">
							<div class="col-12 col-md-9 mb-2 mb-md-0">
								<input type="text" id = "keyword" name = "keyword" class="form-control form-control-lg" placeholder="검색창"> 
									<%-- <input type = "search" id = "query" name = "query" value =<%=query %>/> --%>
							</div>
							<div class="col-12 col-md-3">
								<button type="submit" class="btn btn-block btn-lg btn-primary">검색
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</header>
	
	<%}else{ %>
	<jsp:include page="header2.jsp" flush="false" />
	
	<header class="masthead text-white text-center">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-xl-9 mx-auto">
					<h1 class="mb-5">원하시는 메뉴 혹은 가게이름을 적어주세요 .</h1>
				</div>
				<div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
					<form method = "get" action ="cate-Search.jsp">
						<div class="form-row">
							<div class="col-12 col-md-9 mb-2 mb-md-0">
								<input type="text" id = "keyword" name = "keyword" class="form-control form-control-lg" placeholder="검색창"> 
									<%-- <input type = "search" id = "query" name = "query" value =<%=query %>/> --%>
							</div>
							<div class="col-12 col-md-3">
								<button type="submit" class="btn btn-block btn-lg btn-primary">검색
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</header>
	<%} %>
	<!-- Icons Grid -->
	<section class="features-icons bg-light text-center">
		<div class="container">
			<div class="row">
				<div class="col-lg-4">
					<div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
						<div class="features-icons-icon d-flex">
							<a href="category.jsp"><img src="img/food.jpg" width="300" height="160"></a>
						</div>
						<br><br />
						<h3>카테고리별</h3>
						<p class="lead mb-0">카테고리별 원하는 메뉴 탐색</p>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
						<div class="features-icons-icon d-flex">
							<a href="random.jsp"><img src="img/random.jpg" width="300" height="160"></a>
						</div>
							<br><br />
						<h3>랜덤메뉴</h3>
						<p class="lead mb-0">고르기 힘든 음식 메뉴 편하게 랜덤으로!</p>
					</div>
				</div>
					
				
				<div class="col-lg-4">
					<div class="features-icons-item mx-auto mb-0 mb-lg-3">
						<div class="features-icons-icon d-flex">
							<a href="rank.jsp"><img src="img/ranking.jpg" width="300" height="160"></a>
						</div>
						<br><br />
						<h3>맛집랭킹 TOP 10</h3>
						<p class="lead mb-0">현재 맛집 순위를 확인하세요</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Image Showcases -->
	<!-- 	<section class="showcase"> -->
	<!-- 		<div class="container-fluid p-0"> -->
	<!-- 			<div class="row no-gutters"> -->

	<!-- 				<div class="col-lg-6 order-lg-2 text-white showcase-img" -->
	<!-- 					style="background-image: url('img/bg-showcase-1.jpg');"></div> -->
	<!-- 				<div class="col-lg-6 order-lg-1 my-auto showcase-text"> -->
	<!-- 					<h2>Fully Responsive Design</h2> -->
	<!-- 					<p class="lead mb-0">When you use a theme created by Start -->
	<!-- 						Bootstrap, you know that the theme will look great on any device, -->
	<!-- 						whether it's a phone, tablet, or desktop the page will behave -->
	<!-- 						responsively!</p> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 			<div class="row no-gutters"> -->
	<!-- 				<div class="col-lg-6 text-white showcase-img" -->
	<!-- 					style="background-image: url('img/bg-showcase-2.jpg');"></div> -->
	<!-- 				<div class="col-lg-6 my-auto showcase-text"> -->
	<!-- 					<h2>Updated For Bootstrap 4</h2> -->
	<!-- 					<p class="lead mb-0">Newly improved, and full of great utility -->
	<!-- 						classes, Bootstrap 4 is leading the way in mobile responsive web -->
	<!-- 						development! All of the themes on Start Bootstrap are now using -->
	<!-- 						Bootstrap 4!</p> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 			<div class="row no-gutters"> -->
	<!-- 				<div class="col-lg-6 order-lg-2 text-white showcase-img" -->
	<!-- 					style="background-image: url('img/bg-showcase-3.jpg');"></div> -->
	<!-- 				<div class="col-lg-6 order-lg-1 my-auto showcase-text"> -->
	<!-- 					<h2>Easy to Use &amp; Customize</h2> -->
	<!-- 					<p class="lead mb-0">Landing Page is just HTML and CSS with a -->
	<!-- 						splash of SCSS for users who demand some deeper customization -->
	<!-- 						options. Out of the box, just add your content and images, and -->
	<!-- 						your new landing page will be ready to go!</p> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 	</section> -->

	<!-- Testimonials -->
	<!-- 	<section class="testimonials text-center bg-light"> -->
	<!-- 		<div class="container"> -->
	<!-- 			<h2 class="mb-5">What people are saying...</h2> -->
	<!-- 			<div class="row"> -->
	<!-- 				<div class="col-lg-4"> -->
	<!-- 					<div class="testimonial-item mx-auto mb-5 mb-lg-0"> -->
	<!-- 						<img class="img-fluid rounded-circle mb-3" -->
	<!-- 							src="img/testimonials-1.jpg" alt=""> -->
	<!-- 						<h5>Margaret E.</h5> -->
	<!-- 						<p class="font-weight-light mb-0">"This is fantastic! Thanks -->
	<!-- 							so much guys!"</p> -->
	<!-- 					</div> -->
	<!-- 				</div> -->
	<!-- 				<div class="col-lg-4"> -->
	<!-- 					<div class="testimonial-item mx-auto mb-5 mb-lg-0"> -->
	<!-- 						<img class="img-fluid rounded-circle mb-3" -->
	<!-- 							src="img/testimonials-2.jpg" alt=""> -->
	<!-- 						<h5>Fred S.</h5> -->
	<!-- 						<p class="font-weight-light mb-0">"Bootstrap is amazing. I've -->
	<!-- 							been using it to create lots of super nice landing pages."</p> -->
	<!-- 					</div> -->
	<!-- 				</div> -->
	<!-- 				<div class="col-lg-4"> -->
	<!-- 					<div class="testimonial-item mx-auto mb-5 mb-lg-0"> -->
	<!-- 						<img class="img-fluid rounded-circle mb-3" -->
	<!-- 							src="img/testimonials-3.jpg" alt=""> -->
	<!-- 						<h5>Sarah W.</h5> -->
	<!-- 						<p class="font-weight-light mb-0">"Thanks so much for making -->
	<!-- 							these free resources available to us!"</p> -->
	<!-- 					</div> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 	</section> -->

	<!-- Call to Action -->
	<!-- 	<section class="call-to-action text-white text-center"> -->
	<!-- 		<div class="overlay"></div> -->
	<!-- 		<div class="container"> -->
	<!-- 			<div class="row"> -->
	<!-- 				<div class="col-xl-9 mx-auto"> -->

	<!-- 					<h2 class="mb-4">Ready to get started? Sign up now!</h2> -->
	<!-- 				</div> -->
	<!-- 				<div class="col-md-10 col-lg-8 col-xl-7 mx-auto"> -->
	<!-- 					<form> -->
	<!-- 						<div class="form-row"> -->
	<!-- 							<div class="col-12 col-md-9 mb-2 mb-md-0"> -->
	<!-- 								<input type="email" class="form-control form-control-lg" -->
	<!-- 									placeholder="Enter your email..."> -->
	<!-- 							</div> -->
	<!-- 							<div class="col-12 col-md-3"> -->
	<!-- 								<button type="submit" class="btn btn-block btn-lg btn-primary">Sign -->
	<!-- 									up!</button> -->
	<!-- 							</div> -->
	<!-- 						</div> -->
	<!-- 					</form> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 	</section> -->

	<jsp:include page="footer.jsp" flush="false" />
</html>
