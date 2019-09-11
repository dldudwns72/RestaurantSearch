
<%@page import="study.model1.mybatis.model.User"%>
<%@page import="study.model1.mybatis.service.Impl.UserServiceImpl"%>
<%@page import="study.model1.mybatis.service.UserService"%>
<%@page import="study.model1.mybatis.MyBatisConnectionFactory"%>
<%@page import="study.model1.helper.WebHelper"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%
	request.setCharacterEncoding("UTF-8");

	WebHelper webHelper = WebHelper.getInstance(request, response);
	SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();
	UserService userService = new UserServiceImpl(sqlSession);

	String email = request.getParameter("email");
	

	int count;

	User input = new User();
	
	input.setEmail(email);

	if (email == null || email.equals("")) {
		out.print("<script>alert('이메일을 입력하세요');history.back();</script>");
		return;

	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>이메일 중복 체크</title>

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




<script type='text/javascript'>
	var httpRequest = null;

	function getXMLHttpRequest() {
		var httpRequest = null;

		if (window.ActiveXObject) {
			try {
				httpRequest = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e2) {
					httpRequest = null;
				}
			}
		} else if (window.XMLHttpRequest) {
			httpRequest = new window.XMLHttpRequest();
		}
		return httpRequest;
	}

	function pValue() {
		email = opener.document.userinput.email.value;
	}

	function sendCheckValue() {
		//중복체크 결과인 idCheck 값을 전달.
		opener.document.getElementById("email").value = document.getElementById("email").value;
		opener.document.getElementById("emailDuplication").value = document.getElementById("emailDuplication").value;
		//회원 가입 화면의 ID 입력란에 값을 전달

		if (opener != null) {
			opener.chkForm = null;
			self.close();
		}
	}
</script>
</head>


<body onload="pValue()">



	<div id="wrap">
		<br> <b> <font size="4" color="gray">연락처 중복 체크</font></b>
		<hr size="1" width="460">
		<br>

		<%
			try {

				count = userService.checkEmail(input);

				if (count > 0) {
					out.println("입력하신 '" + email + "' 는 이미 존재하는 이메일 입니다.");
					out.println("다른 이메일을 입력해 주세요.");
		%>
		<div id="chk">
			<form id="userinput" method='post' action=checkEmail.jsp>
				<input type="email" name="email" id="email">
				<button type="submit">중복 확인</button>

			</form>
		</div>
		<div id="msg">
			<br> <input id="cancelBtn" type="button" value="취소"
				onclick="window.close()"> <br>
		</div>
	</div>
	<%
		} else {
				out.println("입력하신 '" + email + "' 는 사용 가능한 이메일 입니다.");
	%>

	<div id="msg1">
		<br>
		<form id="userinput" method='post' action=register.jsp>
			<input type="hidden" id="email" value="<%=email%>" />
			<input type ="hidden" id="emailDuplication" value ="emailCheck"/>
			<input id="useBtn" type="button" value="사용하기" onclick="sendCheckValue()"> 
			<input id="cancelBtn" type="button" value="취소" onclick="window.close()">
		</form>
		<br>
	</div>



	<%
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




































