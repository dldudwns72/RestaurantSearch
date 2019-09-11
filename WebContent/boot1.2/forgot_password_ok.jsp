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

	WebHelper webHelper = WebHelper.getInstance(request, response);
	SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();
	UserService userService = new UserServiceImpl(sqlSession);

	String userId = request.getParameter("userId");
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	String name = webHelper.getString("name");
	String newUserPw = request.getParameter("newUserPw");
	String newUserPwCheck = request.getParameter("newUserPwCheck");
	
	
	if (userId == null) {
		webHelper.redirect(null, "아이디를 입력하세요.");
		return;
	}
	if (email == null) {
		webHelper.redirect(null, "이메일을 입력하세요.");
		return;
	}
	if (tel == null) {
		webHelper.redirect(null, "전화번호를 입력하세요.");
		return;
	}
	if (name == null) {
		webHelper.redirect(null, "이름을 입력하세요.");
		return;
	}

	
	int result = 0;

	//유저 정보를 검색하기 위한 객체 생성
	User input = new User();

	input.setUserId(userId);
	input.setName(name);
	input.setEmail(email);
	input.setTel(tel);

	//유저 비밀번호를 변경하기 위한 객체 생성 String newUserPw
%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>비밀번호 재설정</title>
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
		<br> <b> <font size="4" color="gray">비밀번호 재설정</font></b>
		<hr size="1" width="460">

		<%
			try {
				result = userService.getUserCountforUpdatePw(input);
				if (result == 0) {
					out.println("입력하신 정보는 존재하지 않습니다");
		%>
		<br> <br>
		<div id="chk">
			<input id="cancelBtn" type="button" value="다시 입력하기"
				onclick="window.close()">
		</div>


		<%
			} else {
		%>


		<H3>변경할 비밀번호를 입력해 주세요.</H3>
		<div id="msg">
			<form id="userinput" method='post' action=updatePw.jsp onsubmit="return checkValue()">
				<input type='hidden' name='userId' value='<%=userId%>' /> 
				<input type='hidden' name='name' value='<%=name%>' /> 
				<input type='hidden' name='tel' value='<%=tel%>' /> 
				<input type='hidden' name='email' value='<%=email%>' /> 	
				<input type="password" id="newUserPw" name="newUserPw" placeholder="비밀번호 입력">
				<br /> 
				<input type="password" id="newUserPwCheck" name="newUserPwCheck" placeholder="비밀번호 재입력"> <br />

				<button type="submit">비밀번호 변경</button>
				<input id="cancelBtn" type="button" value="취소" onclick="window.close()">
			</form>
		</div>
		<%
			}
			} catch (Exception e) {
				sqlSession.close();
				webHelper.redirect(null, e.getLocalizedMessage());
				return;
			}
		%>



	</div>
	<script type='text/javascript'>
		function checkMatchPw() {
			var form = document.userinput;

			if (form.newUserPw.value != form.newUserPwCheck) {
				alert("변경하실 비밀번호가 일치하지 않습니다.")
				return false;
			}
		}

		function checkValue() {
			var form = document.userinput
			if (!form.newUserPw.value) {
				alert('비밀번호를 입력하세요');
				return;
			}
			if (!form.newUserPwCheck.value) {
				alert('비밀번호를 한번 더 입력하세요');
				return;
			}

		}
	</script>

</body>
</html>