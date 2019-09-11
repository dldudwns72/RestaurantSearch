
<%@page import="study.model1.mybatis.model.User"%>
<%@page import="study.model1.mybatis.service.Impl.UserServiceImpl"%>
<%@page import="study.model1.mybatis.MyBatisConnectionFactory"%>
<%@page import="study.model1.mybatis.service.UserService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="study.model1.helper.WebHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%
	request.setCharacterEncoding("UTF-8");
	WebHelper web = WebHelper.getInstance(request, response);
	SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();
	UserService userService = new UserServiceImpl(sqlSession);

	String name = request.getParameter("name");
	/*
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	String name = web.getString("name");
	*/
	String email = web.getString("email");
	String tel = web.getString("tel");
	
	
	
	String result = null;

	User input = new User();

	input.setName(name);
	input.setEmail(email);
	input.setTel(tel);
	

	if (name == null || name.equals("")) {
		out.print("<script>alert('이름를 입력하세요');history.back();</script>");
		return;

	}
	if (tel == null ||  tel.equals("")) {
		out.print("<script>alert('전화번호를 입력하세요');history.back();</script>");
		return;

	}
	if (email == null || email.equals("")) {
		out.print("<script>alert('이메일을 입력하세요');history.back();</script>");
		return;

	}
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>아이디 찾기</title>

<style type="text/css">
#wrap {
	width: 490px;
	text-align: center;
	margin: 0 auto 0 auto;
}

#chk {
	text-align: center;
}

</style>
	
</head>
<body>

	<div id="wrap">
		<br> <b> <font size="4" color="gray">아이디 찾기</font></b>
		<hr size="1" width="460">
		<br>

		<%
			try {
				result = userService.findId(input);

				if (result != null) {
					out.println("회원님의 ID는 '" + result + "' 입니다.");

				} else {
					out.println("회원님의 정보를 찾을 수 없습니다.");
				}
			} catch (Exception e) {
				sqlSession.close();
				web.redirect(null, e.getLocalizedMessage());
				return;

			}
		%>

	</div>
	
	<div id = "chk">
	<form id = "confirm" method='post'>
	<input id="confirmId" type="button" value="확인" onclick="window.close()">
	</form>
	</div>
	

</body>
</html>