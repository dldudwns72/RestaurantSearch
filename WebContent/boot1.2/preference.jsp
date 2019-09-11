<%@ page language="java" contentType="text/html; charset=UTF-8"

   pageEncoding="UTF-8"%>

<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
 <script language="javascript" type="text/javascript">
 function checkAll(checkList, boolCheck) {
  varchkSize = 0;
  checkedCount = checkList.length;

  if (typeof (checkedCount) != "undefined") {
   for ( var i = 0; i < chkSize; i++) {
    checkList[i].checked = boolCheck;
   }
  }
 }

 function checkDel() {
  var chkFirList = document.getElementsByName('check');
  var arrFir = new Array();
  var cnt = 0;
  for ( var idx = chkFirList.length - 1; 0 <= idx; idx--) {
   if (chkFirList[idx].checked) {
    arrFir[cnt] = chkFirList[idx].value;
    cnt++;
   }
  }
  if (arrFir.length != 0) {
   document.form1.submit();
  } else {
   alert('삭제할 목록을 선택하세요.');
   return;
  }
 }
 <title>게시판</title>
 </script>

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

       

       

       <div class="col-lg-9">

   <h1 align="center">찜한 목록</h1>
 
      <table width="100%" cellpadding="1" cellspacing="1" border="2">
  
      <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
    
   <td width="73">No.</td>
   <td width="379">Value</td>
   <td width="73">Name</td>     
 </tr>
 
 
<tr>

	<td><input type="checkbox" name="" value="">1</td>
	<td>Value</td>
	<td>Name</td>
	
	</tr>





  <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>

 <tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>
 </table>
 
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr><td colspan="4" height="5"></td></tr>
  <tr align="center">
   <td>
   <form name="myform" action="delete.jsp" id="checkList">
   <input type="button" value="삭제" onclick="checkDel();"></td></tr></form>
</table>
            

              

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