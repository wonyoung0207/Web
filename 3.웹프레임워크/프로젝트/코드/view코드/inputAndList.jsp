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

<c:set var="call" value=""/>

<c:if test="${inner_type eq 1}"><!-- 수시일 경우  -->
<%-- 	<c:set var="call" value="/ahn/project/susi_stdinput.do"/> --%>
	<c:set var="call" value="/ahn/project/susiRandomPoint.do"/>
	
</c:if>
<c:if test="${inner_type eq 0}"><!-- 정시일 경우 -->
	<c:set var="call" value="/ahn/project/jungsi_stdinput.do"/>
</c:if>

 
<html>
<head>
	<title> 기존 리스트를 볼지 새로 입력할지 결정하는 화면   </title>
</head>
<body>

<fieldset style="width:400px; padding:20">
<legend> 선택해 주세요. </legend>
<table>
	<tr>
	<td>
	<!-- <img id="이미지" src="C:\Users\82102\eclipse-workspace\JSP_Web\src\main\webapp\webServer기말고사\project\현대사회문제점.jpg"> -->
	<a href="${call}" > 학생 정보를 새로 입력받습니다. </a>
	</td>
	</tr>
	<tr>
	<td>
	<!-- <img id="이미지" src="C:\Users\82102\eclipse-workspace\JSP_Web\src\main\webapp\webServer기말고사\project\국립중앙도서관.png"> -->
	<a href="/ahn/project/susi_list.do" > 기존 청탁검증으로 입력된 학생 리스트를 봅니다. </a>
	</td>
	</tr>
</table>
</fieldset>


</body>
</html>
