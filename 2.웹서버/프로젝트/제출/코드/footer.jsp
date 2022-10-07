<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<style>
#bottom_bar{
	border: 1px solid black;
	width:100%;
	height:auto;
	overflow:hidden;
	position:fixed;
	margin-top:100px;
	background-color:lightgray;
	left:0;right:0;bottom:0;
 }

</style>

<jsp:useBean id="book_data" class="javabean.BookData" scope="page"></jsp:useBean>
<div id="bottom_bar"><!-- //고정바 -->


<br>
<div id="bottom_bar_right">
현재 시간은 <jsp:getProperty property="now_date" name="book_data"/> 입니다. <br>
<br>
이용 사이트<br>
1) 뉴스<br>
&nbsp&nbsp	https://bae9086.tistory.com/192<br>
&nbsp&nbsp	https://dololak.tistory.com/252<br>
&nbsp&nbsp	https://huddling.tistory.com/26<br>
<br>
2) e북 데이터<br>
&nbsp&nbsp	밀리의서제 : www.millie.co.kr/<br>
&nbsp&nbsp	교보문고 : https://m.kyobobook.co.kr/<br>
<br>
3) 공공API<br>
&nbsp&nbsp	국립중앙도서관 : https://www.nl.go.kr/<br>



</div>


