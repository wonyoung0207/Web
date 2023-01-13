<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%><!--sql을 사용하기 위해 라이브러리 가져옴 -->
<%
	Connection conn = null;
	
	String url = "jdbc:mysql://localhost:3306/JSPBookDB";
	/* 사용할 jdbc의 diver를 가져올 주소와 프로토콜,사용할DB */
	String user = "root";
	String password = "0000";/* mysql 접속 패스워드 */
	
	Class.forName("com.mysql.jdbc.Driver");
	/* JDBC 드라이버 로드. 이때 DriverManager 사용할 수 있게 됨 */
	conn = DriverManager.getConnection(url,user,password);
	/* 데이터베이스 연결 */
	
%>
