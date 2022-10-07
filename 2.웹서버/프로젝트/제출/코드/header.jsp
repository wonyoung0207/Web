<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div id="left_bar"><!-- //고정바 -->
<%
	String user_id = (String) session.getAttribute("userID");/* 서버의 session에 저장되어있는 userID 변수의 값을 가져온다. */
	String user_pw = (String) session.getAttribute("userPW");
	
	if(user_id != ""){
		
%>
<div id="user" style="border : 1px;"><p> 회원  <%= user_id %> </div> 
<%
	}
	else{
		
%>
<div id="user" style="border : 1px;"><p> 비회원 </div> 
<%}%>


<br>
<div id="left_bar_home">
<a href="main.jsp">
<img id="home" src="C:\Users\82102\eclipse-workspace\JSP_Web\src\main\webapp\project\home.png"> 
</a>
</div>

<div id="left_bar_home">
<a href="problem.jsp"> Problem </a>
</div>



<div id="left_bar_home">
<a href="book.jsp"> 책 추전 </a>
</div>



<div id="left_bar_home">
<a href="book_otherSite.jsp"> e북 추천 </a>
</div>


</div>


