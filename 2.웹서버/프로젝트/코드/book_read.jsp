<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*, java.util.ArrayList, java.util.List" %>

<html>
<head>
<meta charset="EUC-KR">
<title>book read </title>
<link href="main.css" type="text/css" rel="stylesheet">
</head>
<body>
<%@ include file="dbconn.jsp" %>
<jsp:include page="header.jsp"></jsp:include>

<div id="container">
<table id="book_info" border="1">
<%
	request.setCharacterEncoding("utf-8");
	
	String book_code = request.getParameter("book_code");
	String book_num = request.getParameter("book_num");
	
	//세션 이용해 사용자가 입력한 정보를 등록해놓고 다른곳에서 사용한다. 
	session.setAttribute("book_code", book_code);
	session.setAttribute("book_num", book_num);
	
	int num = Integer.parseInt(book_num);
	
	
	PreparedStatement pstmt = null;
	/* PreparedStatement : 동적쿼리에 사용, 하나의 객체로 여러번의 쿼리를 실행할 때 사용  */
	/* 선언시 PreparedStatement, 생성시 preparseStatement */
	
	try{

		String[] type = new String[num];
		String[] title = new String[num];
		String[] author = new String[num]; 
				
		String rsql = "select * from book_main";
		pstmt = conn.prepareStatement(rsql);
		ResultSet result = pstmt.executeQuery(rsql);
		int i = 0;
		
		//out.println("<tr><th>start : " + book_code + " 책을 총 " + num + "권 추천합니다." + "</th></tr>");
		
		while(result.next()){
			if(result.getString(2).equals(book_code)){
				type[i] = result.getString(2);
				title[i] = result.getString(3);
				author[i] = result.getString(4);
				i++;
			}
 			if(i >= num){
				break;
			}
		}
		out.print("<tr id='머리'><th> 책 타입 </th><th> 책 제목 </th><th> 저자 </th><tr>" );
	 	for(i=0; i < num; i++){
	 		out.print("<tr><td>" + type[i] + "</td><td>"
	 	+ title[i] + "</td><td>" + author[i] + "</td><tr>");
	 		
	 	}
		
	}catch(SQLException e){
		out.println("Member 테이블 삽입이 실패했습니다. <br>");
		out.println("SQLEXception : " + e.getMessage());
	}finally{
		if(pstmt != null){
			pstmt.close();
		}
		if(conn != null){
			conn.close();
		}
	}
	

%>
</table>

</div>
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>