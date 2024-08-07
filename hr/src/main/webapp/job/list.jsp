<%@page import="hr.vo.JobList"%>
<%@page import="java.util.List"%>
<%@page import="hr.dao.JobDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>직종목록</h1>
<p>전체 직종목록을 표시합니다<p>

<%
	JobDao jobdao = new JobDao();

	List<JobList> joblist = jobdao.getAllJobs();
%>

<table border="1">
	<thead>
		<tr>
			<td>아이디</td>
			<td>제목</td>
			<td>최소급여</td>
			<td>최대급여</td>
		</tr>
	</thead>
	

	
	<tbody>
	<%
	for(JobList list : joblist){
	%>
		<tr>
			<td><%=list.getId() %></td>
			<td><%=list.getTitle() %></td>
			<td><%=list.getMinSalary() %></td>
			<td><%=list.getMinSalary() %></td>
		</tr>
	<%
	}
	%>
	</tbody>

</table>
</body>
</html>