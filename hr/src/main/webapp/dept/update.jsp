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

<form method="post" action="update.jsp">
	<div>
		<label>부서명</label>
		<input type="text" name="name">
	</div>
	<div>
		<label>부서관리자</label><br/>
		<select name="managerId">
			<option value="100">홍</option>
			<option value="101">강</option>
			<option value="102">유</option>
		</select>
	</div>
	<div>
		<label>부서소재지</label><br/>
		<select name="locationId">
			<option value="1000">서울</option>
			<option value="1010">대구</option>
			<option value="1020">부산</option>
		</select>
	</div>
	<button type="submit">수정</button>
</form>
</body>
</html>