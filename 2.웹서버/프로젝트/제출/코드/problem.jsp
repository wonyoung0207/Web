<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
<link href="main.css" type="text/css" rel="stylesheet">
<meta charset="EUC-KR">
<title> problem </title>
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>

<div id="container">
<div id="problem_div" style="text-align:center">
<h1>온라인 피해 사례</h1>
<br>

<table>
	<tr>
	<td><img id="이미지" src="C:\Users\82102\eclipse-workspace\JSP_Web\src\main\webapp\project\코로나수면장애.png"></td>
	<td><img id="이미지" src="C:\Users\82102\eclipse-workspace\JSP_Web\src\main\webapp\project\고령사기.jpg"></td>
	<td><img id="이미지" src="C:\Users\82102\eclipse-workspace\JSP_Web\src\main\webapp\project\쇼핑몰사기.png"></td>
	</tr>
	<tr>
	<td><a href="https://www.fnnews.com/news/202103190928462872" target="_blank"> 수면장애 </a></td>
	<td><a href="https://www.news1.kr/articles/?4318480" target="_blank"> 고령층 대상 가짜 뉴스 </a></td>
	<td><a href="https://www.donga.com/news/article/all/20210118/104982288/1" target="_blank"> 오픈마켓 사기 </a></td>
	</tr>
</table>
<br>
<a href="problem_sub.jsp"> >>> 결론 보러가기 <<< </a>

</div>
</div>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>