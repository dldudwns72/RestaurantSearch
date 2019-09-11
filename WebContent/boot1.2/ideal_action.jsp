<%@page import="study.model1.mybatis.model.Ideal"%>
<%@page import="study.model1.mybatis.service.Impl.IdealServiceImpl"%>
<%@page import="study.model1.mybatis.service.IdealService"%>
<%@page import="study.model1.mybatis.MyBatisConnectionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="study.model1.helper.WebHelper"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR" import="java.sql.*"%>
<%

   WebHelper webHelper = WebHelper.getInstance(request, response);
   SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();
   IdealService idealService = new IdealServiceImpl(sqlSession);

	int gamecount = webHelper.getInt("gamecount");
	String result = webHelper.getString("result");
	String who1 = webHelper.getString("who1");
	String who2 = webHelper.getString("who2");
	int num = webHelper.getInt("num");
	int win = webHelper.getInt("win");
	int lose = webHelper.getInt("lose");
	int temp;
	
	Ideal input = new Ideal();
   
   try {
	   
	   input.setGamecount(gamecount++);
	   idealService.countIdeal(input);
	   
      //String query1 = "update member set gamecount=gamecount+1 where id='"+session.getAttribute("id")+"'";
      //id='"+session.getAttribute("id")+"'"; <-�� �κ� = userNo?    		  
      
      //user DB�� gamecount ���� �߰�
	  //String query2, query3, query4;
    
   if(result.equals(who1)) {
	   
	   //ù��°�� ��ġ�� ������ �̰��� ���
	   
   //query2= "update person set win=win+1 where num="+who1;
   //�̱������� win ������ +1�� ���� who1�� value�� 1
   
   idealService.winIdeal(input);
   input.setWin(win+1);
   input.setNum(num+Integer.parseInt(who1));
   
   //query3= "update person set lose=lose+1 where num="+who2;
   //�������� lose ������ +1�� ���� who2�� value�� 2
   idealService.loseIdeal(input);
   input.setLose(lose+1);
   input.setNum(num+Integer.parseInt(who2));
   
   temp=Integer.parseInt(who1);
   
   
   }else {
	   
	   //�ι�°�� ��ġ�� ������ �̰��� ���
	   
   //query2= "update person set win=win+1 where num="+who2;
   //�̱������� win ������ +1�� ���� who2�� value�� 2
   idealService.winIdeal(input);
   input.setLose(win+1);
   input.setNum(num+Integer.parseInt(who2));
   
   //query3= "update person set lose=lose+1 where num="+who1;
   //�������� lose ������ +1�� ����, who1�� value�� 1
   idealService.loseIdeal(input);
   input.setLose(lose+1);
   input.setNum(num+Integer.parseInt(who1));
   
   temp=Integer.parseInt(who2);
   
   }
   
   //pstmt = conn.prepareStatement(query2);
   //pstmt.executeUpdate();
   idealService.winIdeal(input);

   //pstmt = conn.prepareStatement(query3);
   //pstmt.executeUpdate();      
   idealService.loseIdeal(input);
   
   
   idealService.tempIdeal(input);
	//query4 = 
	//"update member set g"
	//+String.valueOf(Integer.parseInt(gamecount)+1)+
	//"="
	//+String.valueOf(temp)+
	//" where id= '"+session.getAttribute("id")+"'	";
   

   
   //pstmt = conn.prepareStatement(query4);
   //pstmt.executeUpdate();
    
   response.sendRedirect("ideal_worldcup.jsp");
   }catch(Exception e) {
   e.printStackTrace();
   }
%>