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
	WebHelper webHelper = WebHelper.getInstance(request, response);
	SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();
	UserService userService = new UserServiceImpl(sqlSession);

	String userId = request.getParameter("userId");
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	String name = webHelper.getString("name");
	String newUserPw = webHelper.getString("newUserPw");
	String newUserPwCheck = webHelper.getString("newUserPwCheck");
	
	if (newUserPw == null || newUserPw.equals("")) {
		out.print("<script>alert('비밀번호를 입력하세요');history.back();</script>");
		return;

	}
	if (newUserPwCheck == null || newUserPwCheck.equals("")) {
		out.print("<script>alert('비밀번호 확인을 입력하세요');history.back();</script>");
		return;

	}
	
	if (!newUserPw.equals(newUserPwCheck)){
		out.print("<script>alert('비밀번호를 일치시켜주세요');history.back();</script>");
		return;
	}

	User input1 = new User();

	try {
		input1.setUserId(userId);
		input1.setName(name);
		input1.setEmail(email);
		input1.setTel(tel);
		input1.setUserPw(newUserPw);
		userService.editUserPw(input1);
	} catch (Exception e) {
		sqlSession.close();
		webHelper.redirect(null, e.getLocalizedMessage());
		return;
	}

	sqlSession.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경 확인</title>

<style type="text/css">
#wrap {
	width: 490px;
	text-align: center;
	margin: 0 auto 0 auto;
}

#chk {
	text-align: center;
}

#cancelBtn {
	visibility: visible;
}

#useBtn {
	visibility: visible;
}
</style>


</head>
<body>

	<div id="wrap">
		<br> <b> <font size="4" color="gray">비밀번호 변경</font></b>
		<hr size="1" width="460">
		<br> 비밀번호가 변경되었습니다.


		<div id="msg1">
			<br> <input id="cancelBtn" type="button" value="확인"
				onclick="window.close()"> <br>
		</div>
	</div>
</body>
</html>