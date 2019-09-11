<%@page import="study.model1.helper.PageData"%>
<%@page import="study.model1.mybatis.model.Restaurants"%>
<%@page
	import="study.model1.mybatis.service.Impl.Mybatis_RestaurantServiceImpl"%>
<%@page import="study.model1.mybatis.service.Mybatis_RestaurantService"%>
<%@page import="study.model1.mybatis.MyBatisConnectionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@page import="study.model1.retrofit.model.Image_Search"%>
<%@page import="study.model1.retrofit.model.Image_Search.Items"%>
<%@page import="study.model1.retrofit.service.ImageService"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.List"%>
<%@page import="retrofit2.Call"%>
<%@page import="study.model1.helper.WebHelper"%>
<%
	WebHelper webHelper = WebHelper.getInstance(request, response);
	SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();
	Mybatis_RestaurantService RestaurantService = new Mybatis_RestaurantServiceImpl(sqlSession);

	String query = webHelper.getString("query", "");

	ImageService imageService = ImageService.retrofit.create(ImageService.class);

	Call<Image_Search> call = imageService.getImageList(query, 10);
	Image_Search image_search = call.execute().body();

	Restaurants.Items input = new Restaurants.Items();
	input.setTitle(query);

	List<Restaurants.Items> output = null;
	List<Image_Search.Items> list = null;

	if (image_search != null) {
		list = image_search.items;
	}

	PageData pageData = null;

	// 페이지 번호(기본값 1)
	int nowPage = webHelper.getInt("page", 1);
	// 전체 게시글 수
	int totalCount = 0;
	// 한 페이지당 표시할 목록 수
	int listCount = 9;
	// 한 그룹당 표시할 페이지 번호 수 
	int pageCount = 5;

	try {
		totalCount = RestaurantService.getRestaurantsCount(input);
		pageData = new PageData(nowPage, totalCount, listCount, pageCount);

		Restaurants.Items.setOffset(pageData.getOffset());
		Restaurants.Items.setListCount(pageData.getListCount());

		output = RestaurantService.getRestaurantList(input);

	} catch (Exception e) {
		sqlSession.close();
		webHelper.redirect(null, e.getLocalizedMessage());
		return;
	}

	// 디비 접속 해제
	sqlSession.close();
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
			<div class="col-xl-9 mx-auto"></div>
			<div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
				<form method="get" action="search_img.jsp">
					<div class="form-row">
						<div class="col-12 col-md-9 mb-2 mb-md-0">
							<input type="text" id="query" name="query" value="<%=query%>"
								class="form-control form-control-lg"
								placeholder="음식점이나 메뉴를 검색해보세요.">
						</div>
						<div class="col-12 col-md-3">
							<button type="submit" class="btn btn-block btn-lg btn-primary">검색
							</button>

						</div>
					</div>
					<hr />
					<h6 align="center">
						검색결과 총<%=totalCount%>건
					</h6>
					<hr />
				</form>
			</div>
		</div>
	</div>

	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<div class="col-lg-3">

				<div class="list-group">
					<a href="cate-korean.jsp" class="list-group-item">한식</a> <a
						href="cate-China.jsp" class="list-group-item">중식</a> <a
						href="cate-Japan.jsp" class="list-group-item">일식</a> <a
						href="cate-Wtf.jsp" class="list-group-item">양식</a> <a
						href="cate-Cafe.jsp" class="list-group-item">카페</a> <a
						href="cate-Etc" class="list-group-item">기타</a>

				</div>

			</div>
			<!-- /.col-lg-3 -->

			<div class="col-lg-9">
				<h1>검색 결과</h1>

				<div class="row">
					<%
								if (list != null && list.size() > 0) {

									/* for(Image_Search.Items item :list) { 
										//10개씩 끊어 */

									for (int i = 0; i < output.size(); i++) {
										Restaurants.Items item1 = output.get(i);
										int restNo = item1.getRestNo();
							%>
					<!-- <a href="place_info.jsp"><img src="img/kit.jpg" width="260"
								height="145"></a> -->
					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<%
								for (Image_Search.Items item : list) {
							%>
							<img src="<%=item.thumbnail%>" width="260" height="145">
							<%
								break;}
							%>
							<div class="card-body">
								<h4 class="card-title">
									<!-- title -->
									<a href="place_info.jsp?restNo=<%=restNo%>"><%=item1.title%></a>
								</h4>
								<!-- telephone -->

								<!-- address -->
								<p class="card-text"><%=item1.telephone%></p>
							</div>

							<div class="card-footer">
								<small class="text-muted">&#9733; &#9733; &#9733;
									&#9733; &#9734;</small>
							</div>
						</div>

					</div>
					<%
						}
						}
					%>
				</div>
				<!-- /.row -->
				<%
					// http://localhost:8080/02-Model1/09_webpage/dept_list.jsp?page=6&keyword=검색어
					// 검색결과가 2페이지 이상 존재한다면, 페이지 번호를 클릭했을 때
					// 검색어에 대한 상태유지가 GET방식으로 처리되어야 한다.
					// 검색어가 한글일 경우 GET파라미터에 포함시키기 위해서는 URLEncoding 처리가 필요하다.

					if (pageData.getPrevPage() > 0) {
						String link1 = String.format("<a href='search_img.jsp?page=%d&query=%s'>[이전]</a>",
								pageData.getPrevPage(), query);
						out.println(link1);
					} else {
						out.println("[이전]");
					}

					for (int i = pageData.getStartPage(); i <= pageData.getEndPage(); i++) {
						if (i == nowPage) {
							out.println("<strong>[" + i + "]</strong>");
						} else {
							String link1 = String.format("<a href='search_img.jsp?page=%d&query=%s'>[%d]</a>", i, query, i);
							out.println(link1);
						}
					}

					if (pageData.getNextPage() > 0) {
						String link1 = String.format("<a href='search_img.jsp?page=%d&query=%s'>[다음]</a>",
								pageData.getNextPage(), query);
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

