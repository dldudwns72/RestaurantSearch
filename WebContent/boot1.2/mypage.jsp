<%@ page language="java" contentType="text/html; charset=UTF-8"

   pageEncoding="UTF-8"%>

<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Insert title here</title>

<!-- Bootstrap core CSS -->

<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

 

<!-- Custom styles for this template -->

<link href="css/shop-homepage.css" rel="stylesheet">

<body>

   <jsp:include page="header2.jsp" flush="false" />

  <!-- Page Content -->

  <div class="container">

 

    <div class="row">

 

      <div class="col-lg-3">

 

        <div class="list-group">

          <a href="mypage.jsp" class="list-group-item">내 정보 수정</a>

          <a href="preference.jsp" class="list-group-item">찜한 목록</a>

          <a href="res_list.jsp" class="list-group-item">예약 목록</a>

          
       

        </div>

 

      </div>

      

      <!-- /.col-lg-4 -->

      

    


      <!-- /.col-lg-4 -->

       

       

       <div class="col-lg-4">
       <h1>내 정보 수정</h1>

            <form class="user">
               <div class="form-group">
                  <input type="text" class="form-control form-control-user" id="exampleInputEmail" placeholder="아이디"><button type="button">중복확인</button>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="password" class="form-control form-control-user" id="exampleInputPassword" placeholder="비밀번호">
                  </div>
                  <div class="col-sm-6">
                    <input type="password" class="form-control form-control-user" id="exampleRepeatPassword" placeholder="비밀번호 확인">
                  </div>
                  
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-user" id="Email" placeholder="이름">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-user" id="address" placeholder="주소">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-user" id="birthday" placeholder="생년월일(6자리)">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-user" id="Email" placeholder="Email"><button type="button">중복확인</button>
                </div>
                 <div class="form-group">
                  <input type="tel" class="form-control form-control-user" id="tel" placeholder="연락처"><button type="button">중복확인</button>
                </div>
                
                <div class="col-sm-6">
					<input type="radio" name="gender" value="male">남자
					<input type="radio" name="gender" value="female">여자
                  </div>
                <div class="form-group row">
                  
                </div>
                <a href="login.jsp" class="btn btn-primary btn-user btn-block">
                 수정
                </a>
       
              </form>
              </div>

              

         </div>
         
         
      <div class="col-lg-4">

         

         </div>

      <!-- /.col-lg-4 -->

 

    

        </div>

        <!-- /.row -->

 

      </div>

      <!-- /.col-lg-9 -->

 

    </div>

    <!-- /.row -->

 

  </div>

  <!-- /.container -->

 

   <jsp:include page="footer.jsp" flush="false" />

</body>

<script src="vendor/jquery/jquery.min.js"></script>

<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</html>
