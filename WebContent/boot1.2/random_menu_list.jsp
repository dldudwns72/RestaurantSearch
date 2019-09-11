<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="study.model1.mybatis.model.Restaurants"%>
<%@page
	import="study.model1.mybatis.service.Impl.Mybatis_RestaurantServiceImpl"%>
<%@page import="study.model1.mybatis.service.Mybatis_RestaurantService"%>
<%@page import="study.model1.mybatis.MyBatisConnectionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="study.model1.helper.WebHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%


	WebHelper webHelper = WebHelper.getInstance(request,response);
	SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();
	Mybatis_RestaurantService RestaurantService = new Mybatis_RestaurantServiceImpl(sqlSession);
	
	 	String title = webHelper.getString("title");
		String address = webHelper.getString("address");
		String telephone = webHelper.getString("telephone");
		String link = webHelper.getString("link");
		String category = webHelper.getString("category");
		
		String keyword = webHelper.getString("keyword","");
		
		ArrayList<String> randomMenus_kor = new ArrayList<String>();
		ArrayList<String> randomMenus_jpn = new ArrayList<String>();
		ArrayList<String> randomMenus_chn = new ArrayList<String>();
		ArrayList<String> randomMenus_wtf = new ArrayList<String>();
		ArrayList<String> randomMenus_cafe = new ArrayList<String>();
		ArrayList<String> randomMenus_etc = new ArrayList<String>();
		
		
		Restaurants.Items input = new Restaurants.Items();
		input.setTitle(keyword);
		
		 // 빈즈를 담을 객체 생성
		 
		/*List<Restaurants.Items> output = null;
		
		try{
			
			output = RestaurantService.getRestaurantList(input); 
			
		}catch(Exception e){
			sqlSession.close();
			webHelper.redirect(null,e.getLocalizedMessage());
			return;
		} */
		
		 //db에서 찾을 키워드 리스트 String 값으로 입력.
		  
		String[] randomMenu_kor = { "불고기", "된장", "순두부", "뼈해장국" ,"김치볶음밥"};
		String[] randomMenu_jpn = { "스시", "초밥", "카츠", "라멘" ,"사케"};
		String[] randomMenu_chn = { "짜장", "짬뽕", "탕수", "사천" ,"중국"};
		String[] randomMenu_wtf = { "양식", "버거", "순두부", "미즈","안녕"};
		String[] randomMenu_cafe = { "카페", "커피", "디저트", "마카롱" ,"베이커리"};
		String[] randomMenu_etc = { "베트남", "쌀국수", "키친", "타코" ,"가든"};
		   for (int i = 0; i < randomMenu_kor.length; i++) {
		      randomMenus_kor.add(randomMenu_kor[i]); 
		   }
		   
		   for (int i = 0; i < randomMenu_jpn.length; i++) {
			      randomMenus_jpn.add(randomMenu_jpn[i]); 
			   }
		   
		   for (int i = 0; i < randomMenu_chn.length; i++) {
			      randomMenus_chn.add(randomMenu_chn[i]); 
			   }
		   
		   for (int i = 0; i < randomMenu_wtf.length; i++) {
			      randomMenus_wtf.add(randomMenu_wtf[i]); 
			   }
		   
		   for (int i = 0; i < randomMenu_cafe.length; i++) {
			      randomMenus_cafe.add(randomMenu_cafe[i]); 
			   }
		   
		   for (int i = 0; i < randomMenu_etc.length; i++) {
			      randomMenus_etc.add(randomMenu_etc[i]); 
			   }

		   double randomValue = Math.random();

		   int ran_kor = (int) (randomValue * randomMenus_kor.size()) - 1;
		   int ran_jpn = (int) (randomValue * randomMenus_jpn.size()) - 1;
		   int ran_chn = (int) (randomValue * randomMenus_chn.size()) - 1;
		   int ran_wtf = (int) (randomValue * randomMenus_wtf.size()) - 1;
		   int ran_cafe = (int) (randomValue * randomMenus_cafe.size()) - 1;
		   int ran_etc = (int) (randomValue * randomMenus_etc.size()) - 1;
		    		
		   //category 찾을때 쓰는 키워드 값
		   String get_Menu_kor = randomMenus_kor.get(ran_kor);
		   String get_Menu_jpn = randomMenus_jpn.get(ran_jpn);
		   String get_Menu_chn = randomMenus_chn.get(ran_chn);
		   String get_Menu_wtf = randomMenus_wtf.get(ran_wtf);
		   String get_Menu_cafe = randomMenus_cafe.get(ran_cafe);
		   String get_Menu_etc = randomMenus_etc.get(ran_etc);

		   randomMenus_kor.remove(ran_kor);
		   randomMenus_jpn.remove(ran_jpn);
		   randomMenus_chn.remove(ran_chn);
		   randomMenus_wtf.remove(ran_wtf);
		   randomMenus_cafe.remove(ran_cafe);
		   randomMenus_etc.remove(ran_etc);
		   
		   String keyword_kor = get_Menu_kor;
		   String keyword_jpn = get_Menu_jpn;
		   String keyword_chn = get_Menu_chn;
		   String keyword_wtf = get_Menu_wtf;
		   String keyword_cafe = get_Menu_cafe;
		   String keyword_etc = get_Menu_etc;
		   

		
		// 디비 접속 해제
		// sqlSession.close();
		
		%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
table {
	width: 100%;
}

table, th, td {
	border: 1px solid #bcbcbc;
}
</style>
</head>
<body>

	<table border="1">

		<caption>
			<h1>랜덤 메뉴</h1>
		</caption>
		<thead>
			<tr>
				<th>한식</th>
				<th>일식</th>
				<th>중식</th>
				<th>양식</th>
				<th>카페</th>
				<th>기타</th>
			</tr>
		</thead>

		<tbody>



			<tr>
				<th><a href="random_menu_Kor.jsp?keyword_kor=<%=keyword_kor%>"><img
						src="img/kit.jpg" width="250" height="250"></a></th>
				<th><a href="random_menu_Jpn.jsp?keyword_jpn=<%=keyword_jpn %>"><img
						src="img/kit.jpg" width="250" height="250"></a></th>
				<th><a href="random_menu_Chn.jsp?keyword_chn=<%=keyword_chn %>"><img
						src="img/kit.jpg" width="250" height="250"></a></th>
				<th><a href="random_menu_Wtf.jsp?keyword_wtf=<%=keyword_wtf %>"><img
						src="img/kit.jpg" width="250" height="250"></a></th>
				<th><a href="random_menu_Cafe.jsp?keyword_cafe=<%=keyword_cafe %>"><img
						src="img/kit.jpg" width="250" height="250"></a></th>
				<th><a href="random_menu_Etc.jsp?keyword_etc=<%=keyword_etc %>"><img
						src="img/kit.jpg" width="250" height="250"></a></th>
			</tr>
			<% 
 
        %>

			<tr>

				<td rowspan="2"></td>
			</tr>


		</tbody>
</body>
</html>