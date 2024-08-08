<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>요청파라미터 정보 조회하기</h1>
<p>쿼리스트링으로 전달된 요청파라미터 정보 조회하기</p>

<%
	//요청파라미터 정보 조회하기
	String value1 = request.getParameter("opt");
	String value2 = request.getParameter("keyword");
%>
<p>검색옵션 : <%=value1 %></p>
<p>검색키워드 : <%=value2 %></p>

<!-- 
	요청URL : http://localhost/app/req2.jsp?opt=xxx&keyword=xxxx
	
	요청URI : /app/req2.jsp
	
	쿼리스트링 : opt=xxx&keyword=xxx
	
	요청파라미터 정보
	* 톰캣이 쿼리스트링을 분석해서 요청객체에 저장한 정보
	name		value
	opt			xxx
	keyword		xxx
 -->
</body>
</html>