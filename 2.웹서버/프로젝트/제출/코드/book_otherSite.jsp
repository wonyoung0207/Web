<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*, java.util.ArrayList, java.util.List" %>

<html>
<head>
<meta charset="EUC-KR">
<title>book read </title>
<link href="main.css" type="text/css" rel="stylesheet">
<style>
table{
border : 1;
}
</style>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<jsp:include page="header.jsp"></jsp:include>
<jsp:useBean id="book_data" class="javabean.BookData" scope="page"></jsp:useBean>
<div id="container">

<%
	request.setCharacterEncoding("utf-8");
	//세션 이용해 사용자가 입력했던 정보 가져온다 
	
	String book_code = (String) session.getAttribute("book_code");
	String book_num = (String) session.getAttribute("book_num");

	int num = Integer.parseInt(book_num);
	
	if(num >= 5){
		num = 5;
	}

	//out.println(book_code + ", " + book_num);

	PreparedStatement pstmt = null;
	/* PreparedStatement : 동적쿼리에 사용, 하나의 객체로 여러번의 쿼리를 실행할 때 사용  */
	/* 선언시 PreparedStatement, 생성시 preparseStatement */
	
	try{
		int cnt = 0;
		String table_name;
		String query;
		
		while(cnt <= 1){//총 2번 반복
			
			if(cnt == 0){
				query = "select * from book_kyobo" ;
				table_name = "book_kyobo";
			}
			else{
				query = "select * from book_mily" ;
				table_name = "book_mily";
			}

			String[] type = new String[num];
			String[] title = new String[num];
			String[] author = new String[num];
			int i = 0;
			
			String rsql = query ;
			pstmt = conn.prepareStatement(rsql);
			ResultSet result = pstmt.executeQuery(rsql);
			
			//out.println("<tr><th>start : " + book_code + " 책을 총 " + num + "권 추천합니다." + "</th></tr>");
			
			while(result.next()){
				if(result.getString(1).equals(book_code)){
					type[i] = result.getString(1);
					title[i] = result.getString(2);
					author[i] = result.getString(3);
					i++;
				}
	 			if(i >= num){
					break;
				}
			}
			if(table_name.equals("book_kyobo")){
				out.println("<div style='font-size:80px;'>" + "교보문고 추천"  + "</div>");	
			}
			else{
				out.println("<div style='font-size:80px;'>" + "밀리의 서제 추천 "  + "</div>");
			}
			
			out.print("<table ><tr id='머리'><th> 책 타입 </th><th> 책 제목 </th><th> 저자 </th><tr>" );
		 	for(i=0; i < num; i++){
		 		out.print("<tr><td>" + type[i] + "</td><td>"
		 	+ title[i] + "</td><td>" + author[i] + "</td><tr>");
		 		
		 	}
		 	out.print("</table> <br>");

		 	cnt++;//테이블 이름 변경해 주기 위해서 
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


</div>
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>