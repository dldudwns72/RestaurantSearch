<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="study.model1.mybatis.model.Restaurants"%>
<%@page import="study.model1.mybatis.service.Impl.Mybatis_RestaurantServiceImpl"%>
<%@page import="study.model1.mybatis.service.Mybatis_RestaurantService"%>
<%@page import="study.model1.mybatis.MyBatisConnectionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="study.model1.helper.WebHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	WebHelper webHelper = WebHelper.getInstance(request,response);
	SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();
	Mybatis_RestaurantService RestaurantService = new Mybatis_RestaurantServiceImpl(sqlSession);
	
	 	String title = webHelper.getString("title");
		String address = webHelper.getString("address");
		String telephone = webHelper.getString("telephone");
		String link = webHelper.getString("link");
		String category = webHelper.getString("category");
		
		String keyword = webHelper.getString("keyword","");
		ArrayList<String> randomMenus = new ArrayList<String>();
		
		Restaurants.Items input = new Restaurants.Items();
		input.setTitle(keyword);
		
		// 빈즈를 담을 객체 생성
		List<Restaurants.Items> output = null;
		
		try{
			
			output = RestaurantService.getRestaurantList(input); 
			
		}catch(Exception e){
			sqlSession.close();
			webHelper.redirect(null,e.getLocalizedMessage());
			return;
		}
		
/* 
		  //db에서 찾을 키워드 리스트 String 값으로 입력.
		  
		   String[] randomMenu = { "불고기", "된장찌개", "순두부", "뼈해장국" ,"김치볶음밥"};

		   for (int i = 0; i < randomMenu.length; i++) {

		      randomMenus.add(randomMenu[i]); 
		      
		   }

		   double randomValue = Math.random();

		   int ran = (int) (randomValue * randomMenus.size()) - 1;

		   //category 찾을때 쓰는 키워드 값
		   String get_Menu = randomMenus.get(ran);

		   randomMenus.remove(ran);
		   
		   String keyword2 = get_Menu; */

		// 디비 접속 해제
		sqlSession.close();
		
		%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Business Frontpage - Start Bootstrap Template</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/business-frontpage.css" rel="stylesheet">

</head>

<body>

	<!-- Page Content -->
	<div class="container">

		<jsp:include page="header.jsp" flush="false" />

		<div class="row">
		<div class="col-md-4 mb-5">
				<div class="card h-100">
					<a href="ideal_main.jsp"><img class="card-img-top" src="img/cup.jpg" alt="" height=400>
					<div class="card-body">
						<h4 class="card-title" align="center">이상형 월드컵!</h4>
						
					</div>
					
				</div>
			</div>
			
			<%-- <div class="col-md-4 mb-5">
				<div class="card h-100">
					<a href="random_menu.jsp?keyword2=<%=keyword2%>"><img class="card-img-top" src="img/cup.jpg" alt="" height=400></a>
					<div class="card-body">
						<input type ="hidden" name = "keyword2" value="<%=keyword2 %>">
						<h4 class="card-title" align="center">랜덤 메뉴 추천!</h4>
					</div>
					
					
				</div>
			</div> --%>
			
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<a href="random_menu_list.jsp"><img class="card-img-top" src="img/cup.jpg" alt="" height=400></a>
					<div class="card-body">
						<%-- <input type ="hidden" name = "keyword2" value="<%=keyword2 %>"> --%>
						<h4 class="card-title" align="center">랜덤 메뉴 추천!</h4>
					</div>
					
					
				</div>
			</div>
			
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<a href="data.jsp"><img class="card-img-top" src="img/cup.jpg" alt="" height=400>
					<div class="card-body">
						<h4 class="card-title" align="center">데이터 기반 추천,,</h4>
					</div>
					
				</div>
			</div>
			
		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->



	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<jsp:include page="footer.jsp" flush="false" />
</body>

</html>


