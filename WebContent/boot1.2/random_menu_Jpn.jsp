<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@page import="study.model1.helper.WebHelper"%>
<%@page import="study.model1.helper.PageData"%>
<%@page import="study.model1.mybatis.model.Restaurants"%>
<%@page import="java.util.List"%>
<%@page import="study.model1.mybatis.service.Impl.Mybatis_RestaurantServiceImpl"%>
<%@page import="study.model1.mybatis.service.Mybatis_RestaurantService"%>
<%@page import="study.model1.mybatis.MyBatisConnectionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>

<%
	WebHelper webHelper = WebHelper.getInstance(request,response);
	SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();
	Mybatis_RestaurantService RestaurantService = 
			new Mybatis_RestaurantServiceImpl(sqlSession);
	
	 	String title = webHelper.getString("title");
		String address = webHelper.getString("address");
		String telephone = webHelper.getString("telephone");
		String link = webHelper.getString("link");
		String category = webHelper.getString("category");
		
		String keyword = webHelper.getString("keyword","");
		String keyword2 = webHelper.getString("keyword2","");
		
		ArrayList<String> randomMenus = new ArrayList<String>();
		
		Restaurants.Items input = new Restaurants.Items();
		input.setTitle(keyword2);
		
		// 빈즈를 담을 객체 생성
		List<Restaurants.Items> output = null;
		PageData pageData = null;
	
		
	// 페이지 번호(기본값 1)
		int nowPage = webHelper.getInt("page",1);
		// 전체 게시글 수
		int totalCount = 0;
		// 한 페이지당 표시할 목록 수
		int listCount = 9;
		// 한 그룹당 표시할 페이지 번호 수 
		int pageCount = 5;
	
	try{
		totalCount = RestaurantService.getRestaurantsCount(input);
		pageData = new PageData(nowPage,totalCount,listCount,pageCount);
		
		Restaurants.Items.setOffset(pageData.getOffset());
		Restaurants.Items.setListCount(pageData.getListCount());
		
		output = RestaurantService.getRestaurantList_Jpn(input); 
		
	}catch(Exception e){
		sqlSession.close();
		webHelper.redirect(null,e.getLocalizedMessage());
		return;
	}
	
	
	  //db에서 찾을 키워드 리스트 String 값으로 입력.
	  
	   String[] randomMenu = {"불고기", "김치찌개", "순두부", "뼈해장국" ,"김치볶음밥"};

	   for (int i = 0; i < randomMenu.length; i++) {

	      randomMenus.add(randomMenu[i]); 
	      
	   }

	   double randomValue = Math.random();

	   int ran = (int) (randomValue * randomMenus.size()) - 1;

	   //category 찾을때 쓰는 키워드 값
	   String get_Menu = randomMenus.get(ran);

	   randomMenus.remove(ran);
	   
	// 디비 접속 해제
	sqlSession.close();
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
      table {
        width: 100%;
      }
      table, th, td {
        border: 1px solid #bcbcbc;
      }
    </style>
    
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/shop-homepage.css" rel="stylesheet">
<body>
	<jsp:include page="header.jsp" flush="false" />
	<!-- Page Content -->
	<div class="container">

		<div class="row">
		<div class="col-xl-9 mx-auto">
				</div>
				<div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
					<%-- <form method = "get" action="cate-Search.jsp">
				 	<%
						if(title != null || title != ""){
							input.setTitle(keyword);
							input.setCategory(keyword);
					}
					%> --%>
						<%-- <div class="form-row">
							<div class="col-12 col-md-9 mb-2 mb-md-0">
								<input type="text" id = "keyword" name = "keyword"
								value = "<%=keyword %>" class="form-control form-control-lg"
									placeholder="음식점이나 메뉴를 검색해보세요.">
							</div>
							<div class="col-12 col-md-3">
								<button type="submit" class="btn btn-block btn-lg btn-primary">검색
								</button>	
							</div>
							
						</div>
						</form>
						<hr/>
						<h6 align="center">검색결과 총 <%=totalCount%>건</h6>
						<hr/> --%>
					
				</div>
			</div>
		</div>
		
		<div class="container">

<!-- 	<div class="row">
		
		 	<div class="col-md-4">

				<div class="list-group">
					<a href="cate-Korean.jsp" class="list-group-item">한식</a> 
					<a href="cate-China.jsp" class="list-group-item">중식</a>
				    <a href="cate-Japan.jsp" class="list-group-item">일식</a> 
				    <a href="cate-Wtf.jsp" class="list-group-item">양식</a>
				    <a href="cate-Cafe.jsp" class="list-group-item">카페</a>
					<a href="cate-Etc.jsp"	class="list-group-item">기타</a>

				</div>

			</div>   -->
			<!-- /.col-lg-3 -->

			<div class="col-lg-15">
			
				<h1 align="center">추천 한식 메뉴는 <%=keyword2%> 입니다.</h1>
				
				<div class="row">
				
				<hr/>

					<%
				if(output.size() == 0) {
					
			%>
			<h1>검색 결과가 없습니다.</h1>
					<%
					
				}else{
					
				
					 for(int i =0;i<output.size();i++){
						 Restaurants.Items item = output.get(i);
						 int restNo = item.getRestNo();
						/*
						하나씩 출하려면 for문 안에서 출력후 또 데이터를 가져온다 
						*/
						/*  if(!keyword.equals("")){
							title = title.replace(keyword,"<mark>" + keyword + "</mark>");
							category = category.replace(keyword,"<mark>" + keyword + "</mark>");
						}  */
			
			%> 
				
					<div class="col-lg-4 col-md-10 mb-4">  
					<!-- <form method = "get" action = "cate-Search.jsp"> -->
						<div class="card h-100">
							<a href="place_info.jsp?restNo=<%=restNo%>"> <img src="img/kit.jpg" width="350"
								height="148"></a>
							<div class="card-body">
								<h4 class="card-title">
								
									<!-- %title -->
									<a href="place_info.jsp?restNo=<%=restNo%>"><%=item.getTitle() %></a>
								</h4>
								<!-- %telephone -->
								<h5><%=item.getTelephone() %></h5>
								<!-- %address -->
								<p class="card-text"><%=item.getAddress()%></p>
								
							</div>
							
							<div class="card-footer">
								<small class="text-muted">&#9733; &#9733; &#9733;
									&#9733; &#9734;</small>
							</div>
							
						</div>
							<!-- </form> -->
					</div>
			
					<%
					} // end for
				} // end if
			%>
				
				
				</div>
				<!-- /.row -->

				<%
        // http://localhost:8080/02-Model1/09_webpage/dept_list.jsp?page=6&keyword=검색어
        // 검색결과가 2페이지 이상 존재한다면, 페이지 번호를 클릭했을 때
        // 검색어에 대한 상태유지가 GET방식으로 처리되어야 한다.
        // 검색어가 한글일 경우 GET파라미터에 포함시키기 위해서는 URLEncoding 처리가 필요하다.
       
        if (pageData.getPrevPage() > 0) {
            String link1 = String.format("<a href='random_menu_Jpn.jsp?page=%d&keyword2=%s'>[이전]</a>", 
                    pageData.getPrevPage(),keyword2);
            out.println(link1);
        } else {
            out.println("[이전]");
        }

        for (int i = pageData.getStartPage(); i <= pageData.getEndPage(); i++) {
            if (i == nowPage) {
                out.println("<strong>[" + i + "]</strong>");
            } else {
                String link1 = String.format("<a href='random_menu.jsp_Jpn?page=%d&keyword2=%s'>[%d]</a>", i,keyword2,i);
                out.println(link1);
            }
        }

        if (pageData.getNextPage() > 0) {
            String link1 = String.format("<a href='random_menu_Jpn.jsp?page=%d&keyword2=%s'>[다음]</a>",
            		pageData.getNextPage(),keyword2);
            out.println(link1);
        } else {
            out.println("[다음]");
        }
    %>
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
