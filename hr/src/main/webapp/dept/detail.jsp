<%@page import="java.util.Optional"%>
<%@page import="hr.vo.Emp"%>
<%@page import="java.util.List"%>
<%@page import="hr.dao.EmpDao"%>
<%@page import="hr.vo.DeptDetail"%>
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
<h1>부서 상세정보</h1>
<p>부서의 상세정보와 소속직원 목록을 표시합니다</p>

<!-- 
	요청 URL
		http://localhost/hr/dept/detail.jsp?id=xxx
	요청 URI
		/hr/dept/detail.jsp
	쿼리스트링
		id=xxx
		
	요청파라미터 정보
	name	value
	id		xxx
 -->

<%
	//요청 파라미터에서 부서아이디를 조회한다
	String value = request.getParameter("id");
	//조회된 아이디를 정수로 변환한다
	int deptId = Integer.parseInt(value);
	//부서상세정보를 제공하는 기능이 구현된 DeptDao객체를 생성한다
	DeptDao deptdao = new DeptDao();
	//부서상세정보를 제공하는 getDeptDetail메소드를 이용해 dept객체에 담는다
	Optional<DeptDetail> optional = deptdao.getDeptDetail(deptId);
	
	//직원목록정보를 제공하는 기능이 구현된 EmpDao객체를 생성한다
	EmpDao empdao = new EmpDao();
	//직원목록상세정보를 제공하는 getEmployeeByDeptId메소드를 이용해 emps객체에 담는다
	List<Emp> emps = empdao.getEmployeeByDeptId(deptId);
%>

	<h3>부서 상세정보</h3>
	<%
		if(optional.isEmpty()){
		
	%>
	
	<p>부서정보를 검색할 수 없습니다</p>
	<%
		} else {
			DeptDetail dept = optional.get();	
	%>
	
	<table border="1"style="width: 90%">
		<tbody>
			<tr>
				<th>아이디</th>
				<td><%=dept.getId() %></td>
				<th>부서명</th>
				<td><%=dept.getName() %></td>
			</tr>
			<tr>
				<th>관리자아이디</th>
				<td><%=dept.getManagerId() %></td>
				<th>관리자 이름</th>
				<td><%=dept.getManagerName() %></td>
			</tr>
			<tr>
				<th>소재지 도시명</th>
				<td><%=dept.getCity() %></td>
				<th>소재지 국가명</th>
				<td><%=dept.getCountry() %></td>
			</tr>
		</tbody>
		
	</table>
	<%} %>
	
	<h3>소속 직원 목록</h3>
	<table border="1" style="width:90%">
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>입사일</th>
				<th>직종</th>
				<th>급여</th>
			</tr>
		</thead>
		<tbody>
<%
	if(emps.isEmpty()){
%>
		<tr>
			<td colspan="6">소속된 직원이 없습니다.</td>
		</tr>	
<%
	} else {
	}for(Emp emp : emps){
%>
			<tr>
				<td><%=emp.getId() %></td>
				<td><%=emp.getFirstName() %> <%=emp.getLastName() %></td>
				<td><%=emp.getPhoneNumber() %></td>
				<td><%=emp.getHireDate() %></td>
				<td><%=emp.getJobId() %></td>
				<td><%=emp.getSalary() %></td>
			</tr>
<%
		}
%>
		</tbody>
	</table>
</body>
</html>