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
		String query = webHelper.getString("query");
		
		RestaurantService restaurantService = 
				RestaurantService.retrofit.create(RestaurantService.class);
		Call<Restaurants> call = restaurantService.getRestaurantsList(query,10);
		Restaurants Restaurants = call.execute().body();
		
		List<Items> list = null;
		
		if(Restaurants != null){
		list = Restaurants.items;
		
	%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/shop-homepage.css" rel="stylesheet">
<body>
	<jsp:include page="header.jsp" flush="false" />
	

		<div class="container">
			<div class="row">
				<div class="col-xl-9 mx-auto">
				</div>
				<div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
					<form action="search.jsp">
						<div class="form-row">
							<div class="col-12 col-md-9 mb-2 mb-md-0">
								<input type="text" class="form-control form-control-lg"
									placeholder="음식점이나 메뉴를 검색해보세요.">
							</div>
							<div class="col-12 col-md-3">
								<button type="submit" class="btn btn-block btn-lg btn-primary">검색
								</button>
										
							</div>
						</div>
						<hr/>
						<h6 align="center">검색결과__건</h6>
						<hr/>
					</form>
				</div>
			</div>
		</div>
	
  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <div class="col-lg-3">

        <div class="list-group">
          <a href="cate-korean.jsp" class="list-group-item">한식</a> 
		  <a href="cate-China.jsp" class="list-group-item">중식</a>
		  <a href="cate-Japan.jsp" class="list-group-item">일식</a> 
		  <a href="cate-Wtf.jsp" class="list-group-item">양식</a>
	      <a href="cate-Cafe.jsp" class="list-group-item">카페</a>
		  <a href="cate-Etc"	class="list-group-item">기타</a>
       
        </div>

      </div>
      <!-- /.col-lg-3 -->

      <div class="col-lg-9">
      
        <div class="row">
        
        <% if(list != null && list.size() > 0) { %> 
					<% // list는 루프를 돌릴 객체 list에서 한개씩 순차적으로 item에 대입되어 for문 수행	     
		for(Restaurants.Items item :list) { %>
				<% if(item.address.substring(0,2).equals("서울")) { %>
			
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
             <a href="place_info.jsp"><img src="img/kit.jpg" width="260" height="145"></a>
              <div class="card-body">
                <h4 class="card-title">
                <!-- title -->
                  <a href="#"><%=item.title %></a>
                </h4>
                <!-- telephone -->
                <h5><%=item.telephone %></h5>
                <!-- address -->
                <p class="card-text"><%=item.address %></p>
              </div>
              
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
             
          </div>
          <%}} }%>
        </div>
        <%} %>
        <!-- /.row -->
		
      </div>
      
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

	<jsp:include page="footer.jsp" flush="false" />
</body>
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</html>

