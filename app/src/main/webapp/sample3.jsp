<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>주석연습</h1>

<%
	String text = null;
%>
<p>내용 : <%= text %></p>
<p>길이 : <%= text.length() %></p>
<!-- 
	html 주석
 -->
 
 <%-- 
 	jsp 주석
 	이 주석에 포함된 내용은 JAVA코드 생성할 때 제외
 --%>
</body>
</html>