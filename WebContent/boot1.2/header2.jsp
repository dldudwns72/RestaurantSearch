<%@page import="study.model1.mybatis.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page trimDirectiveWhitespaces="true" %>
     <%
     User loginInfo = (User) session.getAttribute("login_info"); 
     %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
</head>
<body>
<!-- Navigation -->
	<nav class="navbar navbar-light bg-light static-top">
		<div class="container">
			<a class="navbar-brand" href="index.jsp">강남구 맛집</a> 
				<div class="shop-menu clearfix pull-right">
							<ul class="nav navbar-nav" style="float:right">
								<li>안녕하세요 <%=loginInfo.getName() %>님</li> 
								<li><a href="mypage.jsp"><i class="fa fa-star"></i>My page</a></li>
								<li><a href="login.jsp"><i class="fa fa-lock"></i>로그아웃</a></li>
							</ul>
			
		</div>
	</nav>
	<div class="header-middle"><!--header-middle-->
			<div class="container">
					<div class="col-md-8 clearfix">
					
						</div>
					</div>
				</div>
			
		</div><!--/header-middle-->
</body>
</html>