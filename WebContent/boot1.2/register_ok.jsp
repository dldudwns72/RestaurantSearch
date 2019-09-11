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

	String userId = webHelper.getString("userId");
	String userPw = webHelper.getString("userPw");
	String userPwCheck = webHelper.getString("userPwCheck");
	String name = webHelper.getString("name");
	String birthdate = webHelper.getString("birthdate");
	String tel = webHelper.getString("tel");
	String gender = webHelper.getString("gender");
	String address = webHelper.getString("address");
	String email = webHelper.getString("email");
	
	User input = new User();

	if (userId == null) {
		webHelper.redirect(null, "아이디를 입력하세요.");
		return;
	}



	if (userPw == null) {
		webHelper.redirect(null, "비밀번호를 입력하세요.");
		return;
	}

	if (!userPw.equals(userPwCheck)) {
		webHelper.redirect(null, "비밀번호가 맞지 않습니다.");
		return;
	}

	if (name == null) {
		webHelper.redirect(null, "이름을 입력하세요.");
		return;
	}

	if (birthdate == null) {
		webHelper.redirect(null, "생년월일을 입력하세요.");
		return;
	}

	if (gender == null) {
		webHelper.redirect(null, "성별을 선택하세요.");
		return;
	}

	if (address == null) {
		webHelper.redirect(null, "주소를 입력하세요.");
		return;
	}

	if (email == null) {
		webHelper.redirect(null, "이메일주소를 입력하세요.");
		return;
	}

	for (int i = 0; i < 100; i++) {
		input.setUserId(userId);
		input.setName(name);
		input.setUserPw(userPw);
		input.setBirthDate(birthdate);
		input.setGender(gender);
		input.setTel(tel);
		input.setAddress(address);
		input.setEmail(email);
		try {
			userService.addUser(input);

		} catch (Exception e) {
			sqlSession.close();
			webHelper.redirect(null, e.getLocalizedMessage());
			return;

		}
		sqlSession.close();
		webHelper.redirect("login.jsp", "회원가입이 완료되었습니다.");
	}
%>
