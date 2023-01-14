<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>
	<title>리스트 화면 </title>
</head>
<body>


<h1> 청탁 계산에 등록된 학생 목록</h1>
<h2> 입력한 학생의 수험번호를 클릭하면 청탁 확률이 계산됩니다. </h2>
<table border=1>
	<tr>
	<th>수험번호</th>
	<th>랜덤 배정 캐릭터 </th>
	<th>입학 타입</th>
	<th>생활기록부</th>
	<th>내신점수</th>
	<th>면접 그룹</th>
	<th>학과 번호</th>
	<th>면접 점수</th>
	<th>부모님 직업</th>
	
	</tr>
	
	<!-- 리스트 형태로 받아오기 때문에 반복문 수행 -->
	<c:forEach var="std_info" items="${susistdList}"><!-- std_cmd라는 객체에 모든 list 정보가 담겨있다. -->
	<!-- 하나의 레코드를 std_n이 가지게 된다.  -->
	<tr>
	<%-- <td><a href="std_list.do?seq=${std_info.id}"> ${std_info.id}</a></td> --%>
	
	<!-- 링크를 누르면 가상 화면으로 해당 seq에 해당하는 계정 정보를 보여줌  -->
	<td><a href="calc.do?id=${std_info.id}">${std_info.id}</a> </td>
	<td>${std_info.animal} </td>
	<td>${std_info.inner_type} </td>
	<td>${std_info.std_record} </td>
	<td>${std_info.school_score} </td>
	<td>${std_info.interview_section} </td>
	<td>${std_info.major} </td>
	<td>${std_info.interview_score} </td>
	<td>${std_info.parent_job} </td>
	</tr>
	</c:forEach>
	
</table><br>
<a href="susiRandomPoint.do">수시전형 새로 입력하러 가기 </a>
<br>
<hr>

<jsp:include page="majorInclude.jsp"></jsp:include>

</body>
</html>
