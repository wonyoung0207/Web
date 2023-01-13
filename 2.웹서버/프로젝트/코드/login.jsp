<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
<meta charset="EUC-KR">
<title>session</title>
<style>
*{
	margin:0;
	padding:0;
}
body{
	position:relative;
}


div{
	width:500px;
	height:500px;
	position:absolute;
	left:50%; top:50%;
	margin-left:-250px;
	margin-top:-250px;
}

input{
	width:240px;
	height:40px;
}
td{
	font-size:25px;
}

</style>

</head>
<body> 
<div>
	<form action="main.jsp" method="post">
	<fieldset>
    <legend>Login</legend>
	<table>
		<tr><td><p> 아이디 : </td><td><input type="text" name="id"></td></tr>
		<tr><td><p> 비밀번호 : </td><td><input type="text" name="passwd"></td></tr>
		<tr><td><p> <input type="submit" value="전송"></td><td><input type="submit" value="비회원 로그인"></td></tr>
	</table>
  	</fieldset>
	</form>
</div>

</body>
</html>