<%@page import="study.model1.mybatis.model.ReserveCheck"%>
<%@page import="study.model1.mybatis.service.Impl.ReserveCheckServiceImpl"%>
<%@page import="study.model1.mybatis.service.ReserveCheckService"%>
<%@page import="study.model1.mybatis.MyBatisConnectionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="study.model1.helper.WebHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
 /*  String[] checks = request.getParameterValues("check");
 
  int checklen = checks.length;
  
  try {
   for(int i=0; i<checklen; i++) {
    out.println(checks[i]+";");
   }
  }
  catch(Exception ex) {
   out.println("exception occured");
  } */
  
    WebHelper webHelper = WebHelper.getInstance(request, response);
	SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();
	ReserveCheckService reservecheckService = new ReserveCheckServiceImpl(sqlSession);
	
	int checkNo = webHelper.getInt("checkNo");
	
	if(checkNo == 0){
		webHelper.redirect("res_list.jsp","삭제할 내용이 없습니다.");
	} 
	
	ReserveCheck input = new ReserveCheck();
	input.setCheckNo(checkNo);
	
	try{
		reservecheckService.DeleteReserveCheck(input);
	}catch(Exception e){
		sqlSession.close();
		webHelper.redirect(null,e.getLocalizedMessage());
		return;
	}
	
	sqlSession.close();
	
	webHelper.redirect("res_list.jsp","삭제되었습니다.");
	
 %>



</body>
</html>