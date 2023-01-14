<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
  table, tr, td{
/*     border:1px solid black;
    border-collapse:collapse;
    padding:5px; */
    text-align:center;
  }
</style>
</head>
<body>
<h1> 청탁 가능성을 계산합니다. </h1>

<%-- <h2> 학생 아이디 : ${susistd.id}</h2>
<h2> 학과 정보 : ${major.name}</h2>
<h2> 면접관 정보 : ${interviewer.name}</h2>
 --%>
<!-- 생활기록부로 청탁판단 -->
<c:if test="${susistd.std_record eq '나쁨'}">
	<c:set var="record_score" value="20"/>	
</c:if>
<c:if test="${susistd.std_record eq '양호'}">
	<c:set var="record_score" value="10"/>	
</c:if>
<c:if test="${susistd.std_record eq '좋음'}">
	<c:set var="record_score" value="5"/>	
</c:if>


<!-- 내신정보로 청탁판단 -->
<c:if test="${major.susi_pass_score > susistd.school_score}">
	<c:set var="inner_score" value="30"/>	
</c:if>
<c:if test="${major.susi_pass_score eq susistd.school_score}">
	<c:set var="inner_score" value="15"/>	
</c:if>
<c:if test="${major.susi_pass_score < susistd.school_score}">
	<c:set var="inner_score" value="5"/>	
</c:if>


<!-- 면접관정보 중 부모님 직업으로 청탁판단 -->
<c:if test="${interviewer.job eq susistd.parent_job}">
	<c:set var="interviewer_parent_score" value="10"/>	
</c:if>
<c:if test="${interviewer.job ne susistd.parent_job}">
	<c:set var="interviewer_parent_score" value="5"/>	
</c:if>

<!-- 면접관정보 중 자녀나이로 청탁판단 -->
<c:set var="interviewer_child_score" value="5"/>
<c:if test="${interviewer.child_age > 18 and interviewer.child_age < 23}">
	<c:set var="interviewer_child_score" value="10"/>	
</c:if>

<!-- section의 면접질문으로 청탁판단 -->
<c:set var="question_score" value="5"/>
<c:if test="${section.interview_question eq '질문내용1' or section.interview_question eq '질문내용2' 
or section.interview_question eq '질문내용3' or section.interview_question eq '질문내용3'}">
	<c:set var="question_score" value="10"/>	
</c:if>

<!-- 해당학과 전체면접 평균 점수로 청탁판단 -->
<c:set var="major_interview_score" value="5"/>
<c:if test="${major.all_student_avg_score > susistd.interview_score}">
	<c:set var="major_interview_score" value="30"/>	
</c:if>
<c:if test="${major.all_student_avg_score < susistd.interview_score}">
	<c:set var="major_interview_score" value="5"/>	
</c:if>

<!-- 90점이상이면 청탁으로 봄 -->
<c:set var="percent" value="${record_score + inner_score + interviewer_parent_score + interviewer_child_score + question_score + major_interview_score }"/>
<c:set var="result" value="청탁이 아닙니다. "/>
<c:set var="result_color" value="blue"/>
<c:if test="${percent >= 90}">
	<c:set var="result" value="청탁일 가능성이 매우 높습니다. "/>	
	<c:set var="result_color" value="red"/>
</c:if>
<c:if test="${percent >= 80 and percent < 90}">
	<c:set var="result" value="청탁일 가능성이 높습니다. "/>
	<c:set var="result_color" value="red"/>	
</c:if>
<c:if test="${percent >= 70 and percent < 80}">
	<c:set var="result" value="청탁일 가능성이 있습니다. "/>
	<c:set var="result_color" value="red"/>	
</c:if>
<c:if test="${percent >= 60 and percent < 70}">
	<c:set var="result" value="청탁일 가능성이 낮습니다. "/>	
</c:if>
<c:if test="${percent >= 50 and percent < 60}">
	<c:set var="result" value="청탁일 가능성이 매우 낮습니다. "/>	
</c:if>
<c:if test="${percent >= 30 and percent < 50}">
	<c:set var="result" value="청탁이 아닙니다. "/>	
</c:if>


<hr>

<fieldset style="width:400px; padding:30">
	<legend> 청탁 계산기</legend>
	<table >
		<tr><th>수험번호</th><th>          </th><th>청탁 가능성</th></tr>
		
		<tr>
		<td> ${susistd.id}</td> 
		<td>  =============>  </td>
		<td>${record_score + inner_score + interviewer_parent_score + interviewer_child_score + question_score + major_interview_score} %</td>
		</tr>
		
		<tr><td> </td></tr>
		
		<tr>
		<td></td>
		<th style="color:${result_color};"> ${result} <th>
		</tr>
	</table>	
</fieldset>

<hr>
<fieldset style="width:400px; padding:30">
<legend> 청탁 가능성에 사용된 점수</legend>
<h4>생활기록부 청탁계산 =  ${record_score}%</h4>
<h4>내신점수 청탁계산 =  ${inner_score}%</h4>
<h4>면접관정보 중 부모님직업으로 청탁계산 =  ${interviewer_parent_score}%</h4>
<h4>면접관정보 중 자녀나이로 청탁계산 =  ${interviewer_child_score}%</h4>
<h4>section질문내용 청탁계산 =  ${question_score}%</h4>
<h4>학과의 모든학생 면접점수 평균 청탁계산 =  ${major_interview_score}%</h4>
</fieldset>

</body>
</html>