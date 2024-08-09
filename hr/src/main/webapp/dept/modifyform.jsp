<%@page import="hr.vo.Dept"%>
<%@page import="hr.vo.Loc"%>
<%@page import="hr.dao.LocDao"%>
<%@page import="hr.vo.Emp"%>
<%@page import="java.util.List"%>
<%@page import="hr.dao.EmpDao"%>
<%@page import="hr.vo.DeptDetail"%>
<%@page import="java.util.Optional"%>
<%@page import="hr.dao.DeptDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>부서 정보 수정화면</h1>
<p>부서이름, 관리자, 소재지를 수정해보세요</p>

<!-- 
	요청URL
		http://localhodt/hr/dept/modifyform.jsp?id=20
	요청URI
		/hr/dept/modifyform.jsp
	쿼리스트링
		ID=XXX
	요청파라미터 정보
		name	value
		id		xxx
		
	수행할 작업
		1. 요청파라미터정보를 이용해서 수정할 부서의 정보를 조회하고 표시하기
		2. select박스의 option태그 생성에 필요한 직우너정보,소재지정보도 조회해야한다
 -->
 
 <%
 	// 1. 요청파라미터 정보 조회하기
 	int deptId = Integer.parseInt(request.getParameter("id"));
 	
 	// 2. 수정할 부서정보 조회하기
 	DeptDao deptdao = new DeptDao();
 	Dept dept = deptdao.getDeptById(deptId);
 	
 	// 3. 모든 직원정보 조회하기
 	EmpDao empdao = new EmpDao();
 	List<Emp> employees = empdao.getAllEmployees();
 	
 	// 4. 모든 소재지 정보 조회하기
 	LocDao locDao = new LocDao();
 	List<Loc> locations = locDao.getAllLocations();
 	
 	// 5. 
 %>
 
 

<form method="post" action="update.jsp">

	<div>
		<label>아이디</label>
		<input type="text" name="id" value="<%=dept.getId() %>" readonly="readonly">
	</div>
	<div>
		<label>부서명</label>
		<input type="text" name="name" value="<%=dept.getName() %>">
	</div>
	<div>
		<label>부서관리자</label><br/>
		<select name="managerId">
		
		<%
			for(Emp emp : employees){
		%>
		<option value="<%=emp.getId() %>"<%=emp.getId() == dept.getManagerId() ? "selected" : "" %>> <%=emp.getFirstName()%> <%=emp.getLastName() %></option>
		<%
			}
		%>
		</select>
	</div>
	<div>
		<label>부서소재지</label><br/>
		<select name="locationId">
<%
	for(Loc loc : locations){
%>
	<option value="<%=loc.getId() %>"<%=loc.getId() == dept.getLocationId() ? "selected" : "" %>><%=loc.getCity() %> (<%=loc.getCountryId() %>)</option>
<%
	}
%>
		</select>
	</div>
	<button type="submit">수정</button>
	</form>
</body>
</html>