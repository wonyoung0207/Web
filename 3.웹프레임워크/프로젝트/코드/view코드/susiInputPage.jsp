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
	<title>청탁이 몇퍼인지 계산하기 위해 입력하는 화면 </title>
<style>
  table, tr, td{
    border:1px solid black;
/*    border-collapse:collapse;
    padding:5px; */
    text-align:center;
  }
</style>
</head>
<body>

<h1> 수시 입학자의 정보를 입력하세요.  </h1>

<%-- <form:form methode="POST" action="/ahn/week13/stdcinput.do" commandName="msg"> --%>
<form:form methode="POST" action="/ahn/project/susi_resultPage.do" commandName="susi_Student">
<!-- stdinput.do라는 가상 파일로 msg라는 객체형태로 입력 데이터를 전송  -->
<table>

	<tr><td> 수험번호 </td><td><form:input path="id"/></td></tr>
	<tr><td> 랜덤 배정 캐릭터 </td><td><form:input path="animal"/></td></tr>
	
	<tr><td>생활기록부 </td>
	<td>
	나쁨<input type="radio" name="std_record" value= "나쁨" checked="checked"/>
	양호<input type="radio" name="std_record" value= "양호"/>
	좋음<input type="radio" name="std_record" value= "좋음"/>
	</td>
	</tr>
	
	<tr><td>내신점수 </td>
	<td>
	2.5미만<input type="radio" name="school_score" value= "2" checked="checked"/>
	3.5미만<input type="radio" name="school_score" value= "3"/>
	4.5미만<input type="radio" name="school_score" value= "4"/>
	</td>
	</tr>
	
	<tr><td> 면접 그룹 이름 </td><td><form:input path="interview_section"/></td></tr>
	<tr><td> 신청 학과 고유번호 </td><td><form:input path="major"/></td></tr>
	<tr><td> 면접 점수 </td><td><form:input path="interview_score"/></td></tr>
	
	<tr><td>부모님 직업 </td>
	<td>
	it<input type="radio" name="parent_job" value= "it" checked="checked"/>
	professor<input type="radio" name="parent_job" value= "professor"/>
	기타<input type="radio" name="parent_job" value= "기타"/>
	</td>
	</tr>
	
	
	<tr><td></td><td><input type="submit" value="전송" /></td></tr>

</table>
</form:form>

<jsp:include page="majorInclude.jsp"></jsp:include>



</body>
</html>
