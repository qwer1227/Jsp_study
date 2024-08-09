<%@page import="hr.dao.DeptDao"%>
<%@page import="hr.vo.Dept"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	/*
		요청 URL: http://localhost/hr/dept/register.jsp
		
		요청 URI: /hr/dept/register.jsp
		
		폼 데이터: name = xxx&managerid = xxx&locationId=xxx
		
		요청파라미터 정보
		name		value
		name		xxx
		managerid	xxx
		locationid	xxx
	*/
	
	// 요청파라미터값 조회하기	
	String name = request.getParameter("name");
	int managerId = Integer.parseInt(request.getParameter("managerId"));
	int locationId = Integer.parseInt(request.getParameter("locationId"));
	
	//Dept객체를 생성해서 요청파라미터의 값을 담는다
	Dept dept = new Dept();
	dept.setName(name);
	dept.setManagerId(managerId);
	dept.setLocationId(locationId);
	
	//deartments에 대한 crud기능이 구현된 deptdao객체를 생성한다
	DeptDao deptDao = new DeptDao();
	
	//DeptDao객체의 insertDept()메소드에 새 부서정보가 있는 Dept객체를 전달해서 실행시킨다
	deptDao.insertDept(dept);
	
	//부서목록을 제공해주는 list.jsp를 재요청하게 하는 응답을 보낸다.
	response.sendRedirect("list.jsp");

%>