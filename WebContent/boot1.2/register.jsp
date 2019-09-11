<%@page import="study.model1.mybatis.service.Impl.UserServiceImpl"%>
<%@page import="study.model1.mybatis.service.UserService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="study.model1.mybatis.MyBatisConnectionFactory"%>
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
%>


<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>회원 가입 페이지</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">


	<div class="container">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
							</div>
							<!-- onSubmit = ""  ""가 true일때 실행 -->
							<form name="userinput" method="post"
								onSubmit="return checkValue()" action="register_ok.jsp">
								<!-- /아이디 -->
								<div class="form-group">
									<label for="userId">아이디</label> <input type="text"
										class="form-control form-control-user" name="userId"
										id="userId" placeholder="아이디" onkeydown="inputIdChck()">
									<input type="button" value="중복확인" id="btnId"
										onclick="openCheckId()"> <input type="hidden"
										id="idDuplication" value="idUncheck">
								</div>
								<!-- 비밀번호  -->
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="password" class="form-control form-control-user"
											name="userPw" id="userPw" placeholder="비밀번호">
									</div>
									<div class="col-sm-6">
										<input type="password" class="form-control form-control-user"
											name="userPwCheck" id="userPwCheck" placeholder="비밀번호 확인">
									</div>

								</div>

								<!-- 이름 -->
								<div class="form-group">
									<input type="text" class="form-control form-control-user"
										name="name" id="name" placeholder="이름">
								</div>

								<!-- 주소 -->
								<div class="form-group">
									<input type="text" class="form-control form-control-user"
										name="address" id="address" placeholder="주소">
								</div>

								<!-- 생년월일 -->
								<div class="form-group">
									<input type="text" class="form-control form-control-user"
										name="birthdate" id="birthdate" placeholder="생년월일(6자리)">
								</div>

								<!-- 이메일 -->
								<div class="form-group">
									<input type="email" class="form-control form-control-user"
										name="email" id="email" placeholder="email"> <input
										type="button" value="중복확인" id="btnId1"
										onclick="openCheckEmail()"> <input type="hidden"
										id="emailDuplication" value="emailUnCheck">
								</div>

								<!-- 연락처 -->
								<div class="form-group">
									<input type="tel" class="form-control form-control-user"
										name="tel" id="tel" placeholder="연락처"> <input
										type="button" value="중복확인" id="btnId2"
										onclick="openCheckTel()"> <input type="hidden"
										id="telDuplication" value="telUncheck">
								</div>

								<!--  성별 -->
								<div class="col-sm-6">
									<input type="radio" name="gender" value="M">남자 <input
										type="radio" name="gender" value="F">여자
								</div>

								<div class="form-group row"></div>
								<button type="submit" class="btn btn-primary btn-user btn-block">
									회원가입</button>
								<button class="btn btn-primary btn-user btn-block" type="reset">
									재작성</button>


								<script type='text/javaScript'>
									//회원가입 화면의 입력값들을 검사.
									function checkValue() {
										var form = document.userinput;

										if (!form.userId.value) {
											alert("아이디를 입력하세요.");
											return false;
										}

										if (form.idDuplication.value != "idCheck") {
											alert("아이디 중복체크를 해주세요.");
											return false;
										}

										if (!form.password.value) {
											alert("비밀번호를 입력하세요.")
											return false;
										}

										if (!form.name.value) {
											alert("사용자 이름을 입력하세요")
											return false;
										}

										if (!form.name.value) {
											alert("이름을 입력하세요.")
											return false;
										}
										if (!form.address.value) {
											alert("주소를 입력하세요.")
											return false;
										}
										if (!form.birthdate.value) {
											alert("생년월일을 입력하세요.")
											return false;
										}
										if (!form.email.value) {
											alert("이메일을 입력하세요.")
											return false;
										}
										if (form.emailDuplication.value != "emailCheck") {
											alert("이메일 중복체크를 해주세요.");
											return false;
										}
										if (!form.tel.value) {
											alert("연락처 입력하세요.")
											return false;
										}
										if (form.telDuplication.value != "telCheck") {
											alert("연락처 중복체크를 해주세요.");
											return false;
										}

									}

									//아이디 중복 체크 팝업창
									function openCheckId() {
										window.name = "parentForm";
										window
												.open(
														"checkId.jsp?userId="
																+ document.userinput.userId.value,
														"chkForm",
														"width=500, height=300, resizable =no, scrollbars = no");
									}

									function openCheckTel() {
										window.name = "parentForm1";
										window
												.open(
														"checkTel.jsp?tel="
																+ document.userinput.tel.value,
														"chkForm1",
														"width=500, height=300, resizable =no, scrollbars = no");

									}

									function openCheckEmail() {
										window.name = "parentForm2";
										window
												.open(
														"checkEmail.jsp?email="
																+ document.userinput.email.value,
														"chkForm2",
														"width=500, height=300, resizable =no, scrollbars = no");

									}

									//

									function inputIdChk() {
										document.userinput.idDuplication.value = "idUncheck";
									}

									function inputTelChk() {
										document.userinput.telDuplication.value = "telUncheck";

									}
									function inputEmailChk() {
										document.userinput.emailDuplication.value = "emailUncheck";

									}
								</script>



							</form>
							<hr>
							<div class="text-center">
								<a class="small" href="forgot-id.jsp">아이디 분실</a>
							</div>
							<div class="text-center">
								<a class="small" href="forgot-password.jsp">비밀번호 분실</a>
							</div>
							<div class="text-center">
								<a class="small" href="login.jsp">로그인으로 이동</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>
</body>

</html>
