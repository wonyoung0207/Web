<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="header.jsp"></jsp:include>
<link href="main.css" type="text/css" rel="stylesheet">
<%
	String content = "온라인에서의 시간보다 값진 시간을 보낼 수 있는 방법인 책을 소개합니다. ";
%>

<div id="container" style="text-align:center">
	<h3><%= content %></h3><br>
	<a href="book.jsp" style="font-size:20px;">☞☞☞☞ 계속 이용하기 ☜☜☜☜</a><br><br>
	<a href="login.jsp" style="font-size:20px;" onclick="javascript:alert('로그아웃 합니다.'); ">☞☞☞☞ 그만 보기 ☜☜☜☜ </a>
</div>
<jsp:include page="footer.jsp"></jsp:include>
