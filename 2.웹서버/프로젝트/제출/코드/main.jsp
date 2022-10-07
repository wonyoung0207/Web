<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>session </title>
<link href="main.css" type="text/css" rel="stylesheet">
</head>
<body>

<%/* 사용자 아이디 세션등록하는곳  */
	String user_id = request.getParameter("id");
	String user_pw = request.getParameter("passwd");
	session.setAttribute("userID", user_id);/* 서버의 세션관리하는 곳에 userID 변수와 값 user_id 를 저장한다 */
	session.setAttribute("userPW", user_pw);
%>

<jsp:include page="header.jsp"></jsp:include>

<div id ="container">
<div style="font-size:80px;">Main Home</div>
<br>
<table>
	<tr id=""><th> Problem </th><th> 국립도서관 추천 </th><th> 다른 사이트 추천 </th></tr>
	<tr>
	<td><img id="이미지" src="C:\Users\82102\eclipse-workspace\JSP_Web\src\main\webapp\project\현대사회문제점.jpg"></td>
	<td><img id="이미지" src="C:\Users\82102\eclipse-workspace\JSP_Web\src\main\webapp\project\국립중앙도서관.png"></td>
	<td><img id="이미지" src="C:\Users\82102\eclipse-workspace\JSP_Web\src\main\webapp\project\네트워크.png"></td>
	</tr>
	<tr>
	<td><a href="problem.jsp" > 현대 사회의 문제점 </a></td>
	<td><a href="book.jsp" > 국립도서관 추천 도서 </a></td>
	<td><a href="book_otherSite.jsp" id="a_otherSite" onclick="onclick_otherSite(event)"> e북 추천 </a></td>
	</tr>
</table>
</div>

<jsp:include page="footer.jsp"></jsp:include>



<script>
function onclick_otherSite(e){
	if(!confirm('국립도서관 추천도서 카테고리를 먼저 이용해야 합니다. 이용하지 않으셨다면 취소를 눌러 주세요.')){
		//취소 눌렀을 경우 
		e.preventDefault();//해당 이벤트 취소 
	}
}


</script>

</body>
</html>