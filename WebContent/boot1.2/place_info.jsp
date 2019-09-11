<%@page import="study.model1.helper.PageData"%>
<%@page import="study.model1.mybatis.model.Restaurants"%>
<%@page import="java.util.List"%>
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
	
	
	int restNo = webHelper.getInt("restNo");
	String title = webHelper.getString("title");
	// 빈즈를 담을 객체 생성
	// List<Restaurants.Items> output = null;

	Restaurants.Items output = null;
 

	 Restaurants.Items input = new Restaurants.Items();
	 input.setRestNo(restNo);
	

		
	try{
		output = RestaurantService.getRestaurantOne(input);
	}catch(Exception e){
		sqlSession.close();
		out.println(e.getLocalizedMessage());
		return;
	} 
	
	String getTitle = output.getTitle();
	// 디비 접속 해제
	sqlSession.close();
	%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script type="text/javascript">	

/* function showPopup() { window.open("res.jsp", "a", "width=400, height=300, left=100, top=50"); } */
function showPopup2() { window.open("cupon.jsp", "a", "width=400, height=300, left=100, top=50"); }

// 예약
function reserve(){
	window.name = "parentForm";
	window.open("res.jsp?restNo="+document.reservation.restNo.value,"chkForm","width=400, height=300, left=100, top=50");
	
}
</script>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/shop-homepage.css" rel="stylesheet">
<body>
   <jsp:include page="header.jsp" flush="false" />
  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <div class="col-lg-3">

        <div class="list-group">
          <a href="cate-Korean.jsp" class="list-group-item">한식</a>
          <a href="cate-China.jsp" class="list-group-item">중식</a>
          <a href="cate-Japan.jsp" class="list-group-item">일식</a>
          <a href="cate-Wtf.jsp" class="list-group-item">양식</a>
          <a href="cate-Cafe.jsp" class="list-group-item">카페 및 디저트</a>
          <a href="cate-Etc.jsp" class="list-group-item">기타 음식점</a>
        </div>

      </div>
      <!-- /.col-lg-3 -->
  		
      <div class="col-lg-4">
         <img src="img/kit.jpg" width="350" height="300">
      </div>
      <!-- /.col-lg-4 -->
      <div class="col-lg-4">
      <div class="card-body">
      <h3 align="center" class="card-title"><%=output.getTitle()%></h3>
		<hr/>
		<ul> 
 		<li><h6 class="card-text">주소 : <%=output.getAddress()%></h6></li>
		<hr/> 
		<li><h6 class="card-text">도로명주소 :<%=output.getRoadAddress()%></h6></li>
		<hr/> 
		<%
		String getTel = output.getTelephone().replace(" ","");
		if (getTel.equals(null) || getTel.equals("") ) {  %>
			<li><h5> 해당 음식점의 전화번호가 없습니다 . </h5></li>
		<% } else { %>
      	<li><h5><%=output.getTelephone()%></h5></li>
        <% 
        }
		%>
      <hr/>
      
      <li><h5>카테고리 : <%=output.getCategory() %></h5></li>
      <hr/>
      
       <%
       String getLink = output.getLink().replace(" ","");
       if(getLink.equals(null) || getLink.equals("")){ %>
       		<li><h5>해당 음식점의 링크가 없습니다</h5></li>
       	<%}else{ %>
       <li>링크 : <a href="<%=output.getLink()%>"><%=output.getLink() %></a></li>
       <%} %>
       <hr/>
      
          
 	<div style='display:inline'>
 	
 	<div style='display:inline;float:left;'>
   	<form action=cupon.jsp>
 	<input type="button" value="쿠폰 발급" onclick="showPopup2();" /></form></div>
 	<div style='display:inline;float:left;'>
 	
 	<form name = "reservation" id= "reservation" method='post'>
 	<%-- <input type="button" id ="restNo" value="<%=restNo %>" onclick="reserve()"> --%>
 	<%-- <input type="button" id ="restNo" value="예약" onclick="reserve()">
 	<input type="hidden" id ="num" value ="<%=restNo%>"/> --%>
 	<button type ="submit" id ="restNo" value="<%=restNo%>" onclick="reserve()">예약</button>
	<!-- <input type="button" id="reserve" value="예약" onclick="reserve()" /> -->
	</form>
	</div>
	

 	
 
 	</div>

		</ul>
     </div>

         </div>
  </div>
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
