<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>스크립틀릿 연습</h1>
<%
	ArrayList<String> names = new ArrayList<>();
	names.add("홍길동");
	names.add("김유신");
	names.add("강감찬");
	names.add("이순신");
%>

	<h3>야유회 참석자 명단</h3>
	<ul>
<%
	for(String name : names){
%>
		<li><%=name %></li>
<%
	}
%>

	</ul>
</body>
</html>