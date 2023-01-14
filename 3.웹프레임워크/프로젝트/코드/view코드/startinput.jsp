<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!--
prefix와 suffix 내용  
<beans:property name="prefix" value="/WEB-INF/views/" />
<beans:property name="suffix" value=".jsp" /> 
-->


<html>
<head>
	<title>정시와 수시 나누기  </title>
</head>
<body>

<h1>청탁을 검사할 분야 (정시 / 수시) 를 선택해 주세요... </h1>

<%-- <form:form methode="POST" action="/ahn/week13/stdcinput.do" commandName="msg"> --%>
<form methode="POST" action="/ahn/project/startPage_click.do" >
<table>
	<tr><td>수시</td><td><input type="radio" name="SusiAndJungsi_info" value= "susi" checked="checked"/></td></tr>
	<tr><td>정시</td><td><input type="radio" name="SusiAndJungsi_info" value= "jungsi"/></td></tr>

	<tr><td></td><td><input type="submit" value="완료" /></td></tr>

</table>
</form>

</body>
</html>
