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
	<jsp:include page="header.jsp" flush="false" />
  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <div class="col-lg-3">

        <div class="list-group">
          <a href="cate-Korean.jsp" class="list-group-item">한식</a>
          <a href="cate-China.jsp" class="list-group-item">중식</a>
          <a href="cate-Japan.jsp" class="list-group-item">일식</a>
          <a href="cate-Wtf.jsp" class="list-group-item">양식</a>
          <a href="cate-Cafe.jsp" class="list-group-item">카페 및 디저트</a>
          <a href="cate-Etc.jsp" class="list-group-item">기타 등등</a>
       
        </div>

      </div>
      <!-- /.col-lg-3 -->

      <div class="col-lg-9">

        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
          <h1>추천맛집</h1>
            <div class="carousel-item active">
            <a href="category.jsp"><img src="img/anga.jpg" width="900" height="350"></a>

            </div>
            <div class="carousel-item">
               <a href="category.jsp"><img src="img/kimdon.jpg" width="900" height="350"></a>
            </div>
            <div class="carousel-item">
              <a href="category.jsp"><img src="img/kit.jpg" width="900" height="350"></a>
            </div>
            
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>

        <div class="row">

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
             <a href="place_info.jsp"><img src="img/kit.jpg" width="260" height="145"></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">갓덴스시</a>
                </h4>
                <h5>번호</h5>
                <p class="card-text">주소</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>


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

