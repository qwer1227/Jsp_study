<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>표현식 연습</h1>

<%
	String text = "그래도 그때는 서폿의존도가 낮았어!! 랏폿난이나 해결해봐!!!!!!";

	Date now = new Date();
%>
	<p>내용: <%=text %></p>
	<p>글자수 : <%=text.length() %></p>
	<p>현재 날짜와 시간 : <%=now %></p>
</body>
</html>