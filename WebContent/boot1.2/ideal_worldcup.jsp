<%@page import="study.model1.mybatis.service.Impl.IdealServiceImpl"%>
<%@page import="study.model1.mybatis.model.Ideal"%>
<%@page import="study.model1.mybatis.service.IdealService"%>
<%@page import="study.model1.mybatis.model.Restaurants"%>
<%@page import="study.model1.mybatis.MyBatisConnectionFactory"%>
<%@page import="study.model1.helper.WebHelper"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%

	
	WebHelper webHelper = WebHelper.getInstance(request, response);
	SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();
	IdealService idealService = new IdealServiceImpl(sqlSession);
	
	int gamecount = webHelper.getInt("gamecount");
	
	Ideal input = new Ideal();
	
	
	try {
		// 무슨 뜻? try에 왜 넣는거?
		String s1 = "g"+String.valueOf((webHelper.getInt("gamecount")-7)*2-1);
		String s2 = "g"+String.valueOf((webHelper.getInt("gamecount")-7)*2);
%>


 총 16경기 중 제<%=webHelper.getInt("gamecount")+1%>경기
 <% out.print(webHelper.getInt("gamecount")+22); %>
 
<%
	// gamecount = 0 일때 게임 시작?
	if(webHelper.getInt("gamecount") == 0) {
		//게임시작
%>

<script type="text/javascript">	

// 선택 후 다음 넘어가는 페이지 ★★★★
function NextPage(){
	window.name = "parentForm";
	window.open("ideal_worldcup.jsp?gamecount="+document.reservation.restNo.value,"_blank","width=400, height=300, left=100, top=50");
	
}
</script>
<form action="ideal_action.jsp">
	<input type="hidden" name="gamecount" value="<%=webHelper.getInt("gamecount")%>">
	<input type="hidden" name="who1" value="1">
	<input type="hidden" name="who2" value="2">
	<table>
		<tr>
			<td><img src=img/1.jpg></td>
			<td><img src=img/2.jpg></td>
		</tr>
	<tr>
		<td align="center"><input type="radio" name="result" value="1"></td>
		<td align="center"><input type="radio" name="result" value="2"></td>
	</tr>
	<tr>
		<!-- onClick사용 다음 페이지로 넘어가나? -->
		<td colspan="2"><center><input type="submit" value="투표하기"></center></td>
		<!-- <td colspan="2"><center><button type="submit" value="<%=gamecount%>"></button></center></td>   -->
	</tr>
	 
	</table>
</form>
 
<%
	// gamecount가 8보다 작으면
	} else if(webHelper.getInt("gamecount")<8) {
%>
<form action="ideal_action.jsp">
	<input type="hidden" name="gamecount" value="<%=webHelper.getInt("gamecount")%>">
	<input type="hidden" name="who1" value="<%=webHelper.getInt("gamecount")*2+1%>">
	<input type="hidden" name="who2" value="<%=webHelper.getInt("gamecount")*2+2%>">
	<table>
		<tr>
			<td><img src=img/<%=webHelper.getInt("gamecount")*2+1%>.jpg></td>
			<td><img src=img/<%=webHelper.getInt("gamecount")*2+2%>.jpg></td>
		</tr>
		<tr>
			<td align="center"><input type="radio" name="result"
			value=<%=webHelper.getInt("gamecount")*2+1%>></td>
			<td align="center"><input type="radio" name="result"
			value=<%=webHelper.getInt("gamecount")*2+2%>></td>
		</tr>
		<tr>
			<td colspan="2"><center><input type="submit" value="투표하기"></center></td>
		</tr>
	</table>
</form>
 
<%
}else if(webHelper.getInt("gamecount")<15){
	//마무리
%>

<form action="ideal_action.jsp">
	<input type=hidden name=gamecount value=<%=webHelper.getInt("gamecount")%>>
	<input type=hidden name=who1 value=<%=webHelper.getInt(s1)%>>
	<input type=hidden name=who2 value=<%=webHelper.getInt(s2)%>>
	<table>
		<tr>
			<td><img src=img/<%=webHelper.getInt(s1)%>.jpg></td>
			<td><img src=img/<%=webHelper.getInt(s2)%>.jpg></td>
		</tr>
		<tr>
			<td align="center"><input type="radio" name="result" value=<%=webHelper.getInt(s1)%>></td>
			<td align="center"><input type="radio" name="result" value=<%=webHelper.getInt(s2)%>></td>
		</tr>
		<tr>
			<!-- action 말고 onClick()로 넘겨야 할듯 -->
			<td colspan="2"><center><input type="submit" value="투표하기"></center></td>
		</tr>
	 
	</table>
</form>
	<%
		}else {
		response.sendRedirect("ideal_main.jsp");
		}
	
		}catch(Exception e){
			sqlSession.close();
			webHelper.redirect(null,e.getLocalizedMessage());
			return;
		}
	
		
	%>
</body>
</html>