<%@page import="java.util.Calendar"%>
<%@page import="study.model1.mybatis.model.Restaurants"%>
<%@page import="study.model1.mybatis.service.Impl.Mybatis_RestaurantServiceImpl"%>
<%@page import="study.model1.mybatis.service.Mybatis_RestaurantService"%>
<%@page import="study.model1.mybatis.MyBatisConnectionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="study.model1.helper.WebHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
   
	WebHelper webHelper = WebHelper.getInstance(request,response);
	SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();
	Mybatis_RestaurantService RestaurantService = 
			new Mybatis_RestaurantServiceImpl(sqlSession);
	
	Calendar calendar = Calendar.getInstance();
	
	String checkdate = webHelper.getString("checkdate");
	String title = webHelper.getString("title");
	
	checkdate = String.format("%04d년%02d월%02d일 %02d시 %02d분", calendar.get(Calendar.YEAR), 
			calendar.get(Calendar.MONTH)+1,
			calendar.get(Calendar.DAY_OF_MONTH),
			calendar.get(Calendar.HOUR_OF_DAY),
			calendar.get(Calendar.MINUTE));
	
	
	int restNo = webHelper.getInt("restNo");
	
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
	
	
	output.setRestNo(restNo);
	
	String restitle = output.getTitle();
	
	sqlSession.close();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 예약목록 테이블과 찜한목록 테이블을 만들어야 할듯 -->
<title>예약 목록</title>


</head>
<body>
<form name ="checktest" method ="post" action = "res_list.jsp">
<h1><input type ="hidden" id = "getTitle" name = "getTitle" value="<%=output.getTitle() %>"></h1>
<h1><%=output.getTitle() %></h1>
<hr/>
<h1><input type ="hidden" id = "getchecktime" name = "getchecktime" value="<%=checkdate %>"></h1>
<h2> 예약 시간 : <%=checkdate %></h2>
<!-- Title과 Date값을 받아 rest_list.jsp로 넘긴다 -->
<button type = "submit" name = "title" id = "title" value='<%=title %>' 
onclick = "ReserveCheck()">예약하기</button>

<!-- <button type = "submit" name = "checkdate" id = "check" onclick = "ReserveCheck()">예약확인</button>
 -->
 <input type = "submit" name = "checkdate" id = "checkdate" value="예약확인" onclick = "ReserveCheck()">
 
<input type = "button" value ="취소" onClick="window.close()">

<script type="text/javascript">
<%-- var getTitle = "<%= output.getTitle() %>";
var getcheckdate = "<%= checkdate %>"; --%>
var getTitle = document.checktest.getTitle.value;
function ReserveCheck(){
	
	/* window.name="parentFrom"; */
	/* widnow.open("res_list.jsp","chkForm","width=400, height=300, left=100, top=50") */
	window.open("res_list.jsp?title="+document.checktest.getTitle.value,"reservecheckform");
	window.close();
	
	
}

/* var ret = window.open("res_list.jsp","_blank")  */
</script>

</form>
</body>



</html>