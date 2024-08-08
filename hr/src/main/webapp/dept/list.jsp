<%@page import="hr.vo.DeptList"%>
<%@page import="java.util.List"%>
<%@page import="hr.dao.DeptDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<H1>부서목록</H1>
<p>전체 부서목록을 제공합니다</p>

<%
// departments 테이블에 대한 CRUD작업이 구현된 DeptDAO객체를 생성한다
DeptDao deptdao = new DeptDao();

// 모든 부서정보를 반환하는 findAllDepts() 메소드를 실행해서 부서목록을 획득한다
List<DeptList> depts = deptdao.findAllDepts();

%>

<table border="1">
	<thead>
		<tr>
			<th>부서아이디</th>
			<th>부서명</th>
			<th>부서관리자</th>
			<th>소재지</th>
			<th>소속직원수</th>
		</tr>
	</thead>
	<tbody>
	<%
		for(DeptList dept : depts){
	%>

	
		<tr>
			<th><%=dept.getId() %></th>
			<th><a href="detail.jsp?id=<%=dept.getId()%>"><%=dept.getName() %></a></th>
			<th><%=dept.getManagerName() %></th>
			<th><%=dept.getCity() %></th>
			<th><%=dept.getCnt() %>명</th>
		</tr>
		
		<%
		}
		%>
	</tbody>
</table>
</body>
</html>