<%@page import="study.model1.mybatis.model.Ideal"%>
<%@page import="study.model1.mybatis.service.Impl.IdealServiceImpl"%>
<%@page import="study.model1.mybatis.service.IdealService"%>
<%@page import="study.model1.mybatis.MyBatisConnectionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="study.model1.helper.WebHelper"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
     <%@ page trimDirectiveWhitespaces="true" %>
<%
	WebHelper webHelper = WebHelper.getInstance(request, response);
	SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();
	IdealService idealService = new IdealServiceImpl(sqlSession);
	
	// �� ó���� gamecount �� �� null�� ���°�
	int gamecount = webHelper.getInt("gamecount");

	//Ideal.Items input = new Ideal.Items();
	
	Ideal input = new Ideal();
	input.setGamecount(gamecount);
	// ���� try�� ���ϴ°ǰ� 
	try {
		
		/* idealService.listIdeal(input);
		out.println(idealService.listIdeal(input)); */
		//idealService.getIdealList(input);
		//ResultSet rs = stmt.executeQuery("select num, name, win, lose from person order by num asc");	
	
	}catch(Exception e){
		sqlSession.close();
		webHelper.redirect(null,e.getLocalizedMessage());
		return;
	}

sqlSession.close();


//webHelper.redirect("ideal_main.jsp?restNo=" + input.items.getRestNo(),"����Ǿ����ϴ�.");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ʸ�Ʈ �޴� ��õ</title>
</head>
<body>
<h1>��ʸ�Ʈ �޴� ��õ</h1>
<a href=ideal_worldcup.jsp>����</a>

<!-- 
<tr>
<td><img src=images/<%=webHelper.getInt("num")%>.jpg /></a></td>
<td><%=webHelper.getString("name") %></a></td>
<td><%=webHelper.getInt("win") %>��<%=webHelper.getInt("lose") %>��(%)</td>
</tr>
 -->
 
</body>
</html>