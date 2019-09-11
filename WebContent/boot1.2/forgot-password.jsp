<%@page import="study.model1.mybatis.service.Impl.UserServiceImpl"%>
<%@page import="study.model1.mybatis.service.UserService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="study.model1.helper.WebHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page="header.jsp" flush="false" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Forgot Password</title>

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

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-6 d-none d-lg-block bg-password-image"></div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-2">비밀번호를 재설정</h1>
										<p class="mb-4">
											아이디와 이메일 입력시 <br>비밀번호 재설정이 가능합니다.
										</p>
									</div>
									<form name="userinput" method="post" class="user" onSubmit="return checkValue()">
										<div class="form-group">
											<input type="text" class="form-control form-control-user"
												id="userId" aria-describedby="emailHelp"
												placeholder="아이디 입력">
										</div>

										<div class="form-group">
											<input type="text" class="form-control form-control-user"
												id="name" aria-describedby="emailHelp" placeholder="이름 입력">
										</div>
										<div class="form-group">
											<input type="tel" class="form-control form-control-user"
												id="tel" aria-describedby="emailHelp" placeholder="연락처 입력">
										</div>
										<div class="form-group">
											<input type="email" class="form-control form-control-user"
												id="email" aria-describedby="emailHelp" placeholder="이메일 입력">
										</div>
										<input type="button" class="btn btn-primary btn-user btn-block" value="비밀번호 재설정 " onclick="openUpdatePw()">

										<script type='text/Javascript'>
											function checkValue() {
												//id 찾기 화면의 입력 값 들을 검사
												var form = document.userinput
												
												if (!form.userId.value) {
													alert("아이디를 입력하세요.")
													return false;
												}
												if (!form.name.value) {
													alert("이름을 입력하세요.");
													return false;
												}

												if (!form.tel.value) {
													alert("전화번호를 입력하세요.")
													return false;
												}

												if (!form.email.value) {
													alert("이메일을 입력하세요.")
													return false;
												}

											}

											//비밀번호 수정 팝업창
											function openUpdatePw() {
												window.name = "parentForm";
												window
														.open(

																"forgot_password_ok.jsp?userId="
																		+ document.userinput.userId.value
																		+ "&name="
																		+ document.userinput.name.value
																		+ "&tel="
																		+ document.userinput.tel.value
																		+ "&email="
																		+ document.userinput.email.value,
																"chkForm",
																"width=500,height=300,resizeable=no,scrollbars = no");
											}
										</script>
									</form>
									<hr>
									<div class="text-center">
										<a class="small" href="register.jsp">회원가입</a>
									</div>
									<div class="text-center">
										<a class="small" href="login.jsp">로그인</a>
									</div>
									<div class="text-center">
										<a class="small" href="forgot-id.jsp">아이디 찾기</a>
									</div>


								</div>
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
