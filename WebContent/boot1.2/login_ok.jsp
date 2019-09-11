<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@page import="study.model1.mybatis.service.Impl.UserServiceImpl"%>
<%@page import="study.model1.mybatis.MyBatisConnectionFactory"%>
<%@page import="study.model1.helper.WebHelper"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="study.model1.mybatis.service.UserService"%>
<%@page import="study.model1.mybatis.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("UTF-8");

	WebHelper webHelper = WebHelper.getInstance(request, response);
	SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();
	UserService userService = new UserServiceImpl(sqlSession);

	String userId = request.getParameter("userId");
	String userPw = request.getParameter("userPw");

	User input = new User();
	input.setUserId(userId);
	input.setUserPw(userPw);

	User output = null;

	if (userId == null || userId.equals("")) {
		out.print("<script>alert('아이디를 입력하세요');history.back();</script>");
		return;

	}

	if (userPw == null || userPw.equals("")) {
		out.print("<script>alert('비밀번호를 입력하세요');history.back();</script>");
		return;
	}

	if (!userId.equals(input.getUserId()) || !userPw.equals(input.getUserPw())) {
		out.print("<script>alert('아이디나 비밀번호가 잘못되었습니다.');history.back();</script>");
		return;

	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		try {
			output = userService.login(input);
			if (output != null) {

				session.setAttribute("login_info", output);
				response.sendRedirect("login.jsp");
				webHelper.redirect("index.jsp", null);

			} else {
				out.println("입력하신 로그인 정보를 찾을 수 없습니다.");

				webHelper.redirect("login.jsp", null);

			}
		}

		catch (Exception e) {
			sqlSession.close();
			webHelper.redirect(null, e.getLocalizedMessage());
			return;

		}
	%>



</body>
</html>