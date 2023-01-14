<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %> --%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Arrays"%>
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
</head>
<body>

<% 
	String[] section = {"Farm A","Farm B","Farm C","Farm D","Farm E"};
	String[] animal = {"rabbit","sheep","cow","horse","pig","dog"};
	String[] interviewer_id = {"1", "2" ,"3" ,"4"};
	String[] interview_question = {"질문내용1", "질문내용2" ,"질문내용3" ,"질문내용4"};
//TreeMap<Integer,String> tm = new TreeMap<Integer,String>();//treemap은 key를 기준으로

	int a = (int)(Math.random() * 5);//Section 선택
	int b = (int)(Math.random() * 5);//캐릭터 이름 선택 
	int c = (int)(Math.random() * 4);//면접자 선택
	int d = (int)(Math.random() * 4);//질문 선택
	
	int avg = 0;//면접자로부터 받은 점수의 평균 
	int interviewer_max = 0;// 가장 높은 점수를 준 면접관 알기위한 변수 
	int max = 0;
	
	int[] random_score = new int[4];//4명의 면접관이 점수를 랜덤으로 줌  
%>
<h1> 랜덤으로 캐릭터와 section을 배정받고 면접이 진행됩니다...   </h1>
<fieldset style="width:400px; padding:20">
<legend> <%= section[a] %> 면접 진행 결과 </legend>


<!-- 
<img id="이미지" src="C:\Users\82102\eclipse-workspace\JSP_Web\src\main\webapp\webServer기말고사\project\1.jpg">
 -->

<%
	out.println("[" + animal[b] + "]에 대한 결과입니다. <br>");
	out.print("<br>해당 학생에 대한 면접관들의 점수 : ");
	for(int j=0; j< random_score.length; j++){//랜덤 점수 받는 곳 
		//tm.put((int)(Math.random() * 100),interviewer_id[j]);
		random_score[j] = (int)(Math.random() * 100);//100까지 랜덤수 출력 	
		
		if(max <= random_score[j]){//이전 점수보다 현재 점수가 더 크면 실행 -> 가장 많은 점수를 준 면접자를 고르기 위해 
			max = random_score[j];
			interviewer_max = j+1;
		}
	
		out.print(random_score[j] + ", ");
	}
	Arrays.sort(random_score);
	
	avg = (random_score[1] + random_score[2])/ 2;//가장큰수와 가장작은수를 뺀 두 random 숫자의 평균을 구함 

	
%>


<%

out.println("<br>");
out.println("해당 학생의 면접 평균점수 : " + avg);
out.println("<br>");
out.println("가장 많은 점수를 준 면접관 : " + "면접관" + interviewer_max);
out.println("<br>");
out.println("해당 section 질문 : " + interview_question[d] + "<br>");
%>
<br>

</fieldset>


<hr>
<form method="POST" action="/ahn/project/susi_stdinput.do">
<table borad=1>
	<tr><td>배정 캐릭터 </td><td><input type="text" value="<%= animal[b] %>" name="animal"/></td></tr>
	<tr><td>배정 섹션 </td><td><input type="text" value="<%=section[a] %>" name="section"/></td></tr>
	<tr><td>해당 학생에 대한 면접관들의 평균점수 </td><td><input type="text" value="<%=avg %>" name="avg"/></td></tr>
	<tr><td>가장 많은 점수를 준 면접관 </td><td><input type="text" value="<%= interviewer_max %>" name="interviewer_max"/></td></tr>
	<tr><td>질문내용 </td><td><input type="text" value="<%= interview_question[d] %>" name="question"/></td></tr>
	
	<tr>
	<td>학과 선택</td>
	<td>
	빅데이터<input type="radio" name="major" value= "1" checked="checked"/>
	스마트 IoT<input type="radio" name="major" value= "2"/>
	콘텐츠 IT<input type="radio" name="major" value= "3"/>
	</td></tr>
	
	<tr><td></td><td><input type="submit" value="전송" /></td></tr>
</table>

</form>

</body>
</html>
