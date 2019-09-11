<%@page import="study.model1.mybatis.model.User"%>
<%@page
	import="study.model1.mybatis.service.Impl.ReserveCheckServiceImpl"%>
<%@page import="study.model1.mybatis.service.ReserveCheckService"%>
<%@page import="study.model1.mybatis.model.ReserveCheck"%>
<%@page import="study.model1.helper.PageData"%>
<%@page import="java.util.List"%>
<%@page import="study.model1.mybatis.model.Restaurants"%>
<%@page
	import="study.model1.mybatis.service.Impl.Mybatis_RestaurantServiceImpl"%>
<%@page import="study.model1.mybatis.service.Mybatis_RestaurantService"%>
<%@page import="study.model1.mybatis.MyBatisConnectionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="study.model1.helper.WebHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%	 
	User loginInfo = (User) session.getAttribute("login_info");

	WebHelper webHelper = WebHelper.getInstance(request, response);
	SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();
	ReserveCheckService Reservecheckservice = new ReserveCheckServiceImpl(sqlSession);

	int checkNo = webHelper.getInt("checkNo");
	String title = webHelper.getString("getTitle");
	String checkdate = webHelper.getString("getchecktime");

	List<ReserveCheck> output = null;
	PageData pageData = null;

	// 페이지 번호(기본값 1)
	int nowPage = webHelper.getInt("page", 1);
	// 전체 게시글 수
	int totalCount = 0;
	// 한 페이지당 표시할 목록 수
	int listCount = 10;
	// 한 그룹당 표시할 페이지 번호 수 
	int pageCount = 5;

	ReserveCheck input = new ReserveCheck();

	input.setCheckNo(checkNo);
	input.setTitle(title);
	input.setCheckdate(checkdate);


	try {
		totalCount = Reservecheckservice.getReserveCheckCount(input);
		pageData = new PageData(nowPage, totalCount, listCount, pageCount);
		
		if(title != null){
			Reservecheckservice.AddReserveCheck(input);
		}

		ReserveCheck.setOffset(pageData.getOffset());
		ReserveCheck.setListCount(pageData.getListCount());
		
		output = Reservecheckservice.getReserveCheckList(input);

	} catch (Exception e) {
		sqlSession.close();
		out.println(e.getLocalizedMessage());
		return;
	}



	sqlSession.close();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<script language="javascript" type="text/javascript">
	function checkAll(checkList, boolCheck) {
		varchkSize = 0;
		checkedCount = checkList.length;

		if (typeof (checkedCount) != "undefined") {
			for (var i = 0; i < chkSize; i++) {
				checkList[i].checked = boolCheck;
			}
		}
	}

	function checkDel() {
		var chkFirList = document.getElementsByName('checkNo');
		var arrFir = new Array();
		var cnt = 0;
		for (var idx = chkFirList.length - 1; 0 <= idx; idx--) {
			if (chkFirList[idx].checked) {
				arrFir[cnt] = chkFirList[idx].value;
				cnt++;
			}
		}
		if (arrFir.length != 0) {
			document.form1.submit();
		} else {
			alert('삭제할 목록을 선택하세요.');
			return;
		}
	}
	<title>게시판</title>
</script>

<meta charset="UTF-8">

<title>Insert title here</title>

<!-- Bootstrap core CSS -->

<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">



<!-- Custom styles for this template -->

<link href="css/shop-homepage.css" rel="stylesheet">
<body>
	<%if(loginInfo == null) {
		/* webHelper.redirect(null, "로그인 후 이용 가능합니다."); */
		out.println("로그인후 이용 가능");
	} else{
	%>
	<jsp:include page="header.jsp" flush="false" />

	<!-- Page Content -->

	<div class="container">

		<div class="row">

			<div class="col-lg-3">

				<div class="list-group">

					<a href="mypage.jsp" class="list-group-item">내 정보 수정</a> <a
						href="preference.jsp" class="list-group-item">찜한 목록</a> <a
						href="res_list.jsp" class="list-group-item">예약 목록</a>

				</div>

			</div>

			<!-- /.col-lg-4 -->


			<div class="col-lg-9">

				<h1 align="center">예약 목록</h1>
				<form name="form2" method="post" action="delete.jsp">
					<table width="100%" cellpadding="1" cellspacing="1" border="2">

						<tr
							style="background: url('img/table_mid.gif') repeat-x; text-align: center;">


							<td width="73">No</td>
							<td width="370">Value</td>
							<td width="170">Time</td>
							<td width="73">Name</td>


						</tr>

						<%
							for (int i = 0; i < output.size(); i++) {
								ReserveCheck item = output.get(i);
						%>

						<tr>
							<!-- 예약목록이라는 테이블 생성 -->

							<!-- CheckNo -->

							<td><input type="checkbox" id="checkNo" name="checkNo"
								value="<%=item.getCheckNo()%>">No.<%=item.getCheckNo()%>

							</td>

							<!-- Title -->
							<td><%=item.getTitle()%></td>
							<!-- Date -->

							<td><%=item.getCheckdate()%></td>

							<%-- <td><%=loginInfo.getName() %></td> --%>
							<!-- UserId -->


						</tr>

						<%
							}
						%>
						<tr height="1" bgcolor="#D2D2D2">
							<td colspan="6"></td>
						</tr>

						<tr height="1" bgcolor="#82B5DF">
							<td colspan="6" width="752"></td>
						</tr>
					</table>

					<input type="submit" value="삭제">
				</form>


				<%
					// http://localhost:8080/02-Model1/09_webpage/dept_list.jsp?page=6&keyword=검색어
					// 검색결과가 2페이지 이상 존재한다면, 페이지 번호를 클릭했을 때
					// 검색어에 대한 상태유지가 GET방식으로 처리되어야 한다.
					// 검색어가 한글일 경우 GET파라미터에 포함시키기 위해서는 URLEncoding 처리가 필요하다.

					if (pageData.getPrevPage() > 0) {
						String link1 = String.format("<a href='res_list.jsp?page=%d'>[이전]</a>", pageData.getPrevPage());
						out.println(link1);
					} else {
						out.println("[이전]");
					}

					for (int i = pageData.getStartPage(); i <= pageData.getEndPage(); i++) {
						if (i == nowPage) {
							out.println("<strong>[" + i + "]</strong>");
						} else {
							String link1 = String.format("<a href='res_list.jsp?page=%d'>[%d]</a>", i, i);
							out.println(link1);
						}
					}

					if (pageData.getNextPage() > 0) {
						String link1 = String.format("<a href='res_list.jsp?page=%d'>[다음]</a>", pageData.getNextPage());
						out.println(link1);
					} else {
						out.println("[다음]");
					}
				%>

			</div>

			<div class="col-lg-4"></div>
			<!-- /.col-lg-4 -->


		</div>
		<!-- /.row -->
	</div>
	<!-- /.col-lg-9 -->


	<jsp:include page="footer.jsp" flush="false" />
 } %> 
 
</body>

<script src="vendor/jquery/jquery.min.js"></script>

<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</html>