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
		// ���� ��? try�� �� �ִ°�?
		String s1 = "g"+String.valueOf((webHelper.getInt("gamecount")-7)*2-1);
		String s2 = "g"+String.valueOf((webHelper.getInt("gamecount")-7)*2);
%>


 �� 16��� �� ��<%=webHelper.getInt("gamecount")+1%>���
 <% out.print(webHelper.getInt("gamecount")+22); %>
 
<%
	// gamecount = 0 �϶� ���� ����?
	if(webHelper.getInt("gamecount") == 0) {
		//���ӽ���
%>

<script type="text/javascript">	

// ���� �� ���� �Ѿ�� ������ �ڡڡڡ�
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
		<!-- onClick��� ���� �������� �Ѿ��? -->
		<td colspan="2"><center><input type="submit" value="��ǥ�ϱ�"></center></td>
		<!-- <td colspan="2"><center><button type="submit" value="<%=gamecount%>"></button></center></td>   -->
	</tr>
	 
	</table>
</form>
 
<%
	// gamecount�� 8���� ������
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
			<td colspan="2"><center><input type="submit" value="��ǥ�ϱ�"></center></td>
		</tr>
	</table>
</form>
 
<%
}else if(webHelper.getInt("gamecount")<15){
	//������
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
			<!-- action ���� onClick()�� �Ѱܾ� �ҵ� -->
			<td colspan="2"><center><input type="submit" value="��ǥ�ϱ�"></center></td>
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