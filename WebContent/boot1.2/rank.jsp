<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin - Tables</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">

<!-- Page level plugin CSS-->
<link href="vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin.css" rel="stylesheet">

</head>
<jsp:include page="header.jsp" flush="false" />
<body id="page-top">







	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="sidebar navbar-nav">
			<li class="nav-item active"><a class="nav-link"
				href="rank.jsp"> <i class="fas fa-fw fa-table"></i> <span>TOP 1</span></a>
			</li>
			<li class="nav-item active"><a class="nav-link"
				href="rank.jsp"> <i class="fas fa-fw fa-table"></i> <span>봉우화로</span></a>
			</li>
			<li class="nav-item active"><a class="nav-link"
				href="rank.jsp"> <i class="fas fa-fw fa-table"></i> <span>피쉬스토리</span></a>
			</li>
			<li class="nav-item active"><a class="nav-link"
				href="rank.jsp"> <i class="fas fa-fw fa-table"></i> <span>한식</span></a>
			</li>
			
		</ul>

		<div id="content-wrapper">

			<div class="container-fluid">

				<!-- DataTables Example -->
				<div class="card mb-3">
					<div class="card-header">
						<h3 align="center">맛집랭킹</h3>
					</div>
					<div class="card-body">
					<h1 class="card-title">
                  <a href=>1.갓덴스시<img src="img/kit.jpg" width="260" height="145"></a>
                </h1>
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>가게이름</th>
										<th>위치</th>
										<th>연락처</th>
										<th>홈페이지</th>
										<th>평점</th>
									</tr>
								</thead>

								<tbody>

									<tr>
										<td>갓덴스시(강남)</td>
										<td>서울특별시 강남구 역삼동 822-4 강남제일빌딩</td>
										<td>02-2051-1477</td>
										<td><a href="http://gattengn.modoo.at/">갓덴스시</a></td>
										<td>5.0</td>
									</tr>
									<tr>
										<td>봉우화로</td>
										<td>서울특별시 강남구 봉은사로18길 76 스타 팰리스</td>
										<td>02-558-8452</td>
										<td><a href="https://bongwoowharo.modoo.at/">봉우화로</a></td>
										<td>4.3</td>
									</tr>
									<tr>
										<td>피쉬스토리</td>
										<td>서울특별시 강남구 신사동 661-18 정동상가 1층 16호</td>
										<td>02-3447-2067</td>
										<td><a href="https://store.naver.com/restaurants/detail?id=33430831">피쉬스토리</a></td>
										<td>3.8</td>
									</tr>


								</tbody>
							</table>
						</div>
					</div>
					<div class="card-footer small text-muted">현재시각 만들기</div>
				</div>



			</div>
			<!-- /.container-fluid -->



		</div>
		<!-- /.content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.jsp">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Page level plugin JavaScript-->
	<script src="vendor/datatables/jquery.dataTables.js"></script>
	<script src="vendor/datatables/dataTables.bootstrap4.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin.min.js"></script>

	<!-- Demo scripts for this page-->
	<script src="js/demo/datatables-demo.js"></script>
	<jsp:include page="footer.jsp" flush="false" />
</body>

</html>
