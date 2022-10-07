<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>book </title>
<link href="main.css" type="text/css" rel="stylesheet">
<style>
legend {
	text-align :center;
}
fieldset{
	hight:200px;
	width:500px
}
table{
	width:500px;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div id ="container">
<h3> 원하는 책의 종류를 선택하세요 </h3>
<br>

<form action="book_read.jsp" method="post">
	<fieldset>
    <legend> 선택 창 </legend>
	<table>
		<tr><td>분류 타입 </td><td><select name="book_code"><!-- 분류번호(11:문학, 6:인문과학, 5:사회과학, 4:자연과학) -->
							<option value="문학"> 문학 </option>
							<option value="인문과학"> 인문과학 </option>
							<option value="사회과학"> 사회과학 </option>
							<option value="자연과학"> 자연과학 </option>
						</select></td></tr>
		<tr><td>추천받을 책 수 </td><td><select name="book_num">
							<option value="1"> 1 </option>
							<option value="5"> 5 </option>
							<option value="10"> 10 </option>
						</select></td></tr>
		
		<tr><td><p> <input type="submit" value="전송" style="width:60px; height:40px"></td></tr>
	</table>
  	</fieldset>
</form>


</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>