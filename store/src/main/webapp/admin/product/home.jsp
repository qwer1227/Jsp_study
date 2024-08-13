<%@page import="utils.Pagination"%>
<%@page import="utils.Utils"%>
<%@page import="vo.Product"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDao"%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>애플리케이션</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<div class="container-fluid">
		<ul class="navbar-nav">
			<li class="nav-item">
				<a class="nav-link" href="/store/index.jsp">홈</a>
			</li>
			<li class="nav-item">
				<a class="nav-link active" href="/store/admin/product/home.jsp?page=1">상품관리</a>
			</li>
		</ul>
	</div>
</nav>
<div class="container mt-4">

<%
	String error = request.getParameter("error");
	if(error != null){
%>

	<div class="alert alert-warning">
		<p>유효한 요청이 아닙니다</p>
	</div>

<%
	}
%>
	<h1>상품 목록</h1>

<%--
	요청 URL	
		http://localhost/store/admin/product/home.jsp?error
		http://localhost/store/admin/product/home.jsp
		http://localhost/store/admin/product/home.jsp?page=xx
	요청 URI
		/store/admin/product/home.jsp
	쿼리스트링
		없음
		error
		page=xx
		
	요청파라미터 정보
		name     value
		-------------------------------
		"page"   "xx"
		-------------------------------
		error
 --%>
 
 <%
 	ProductDao productDao = new ProductDao();

 	// 1. 요청한 페이지번호를 조회한다.
 	int pageNo = Utils.toInt(request.getParameter("page"), 1);
 	// 2. 총 데이터갯수를 조회한다.
 	int totalRows = productDao.getTotalRows();
 	
 	// 3. Pagination객체를 생성한다.
 	Pagination pagination = new Pagination(pageNo, totalRows);
 	
 	// 4. 요청한 페이지에 맞는 데이터를 조회한다.
 	List<Product> products = productDao.getProducts(pagination.getBegin(), pagination.getEnd());
 %>
	
	<table class="table">
		<thead>
			<tr>
				<th>번호</th>
				<th>상품명</th>
				<th>가격</th>
				<th>할인가격</th>
				<th>상태</th>
				<th></th>
			</tr>
		</thead>	
		<tbody>
<%
	for (Product product : products) {
%>
			<tr>
				<td><%=product.getNo() %></td>
				<td><%=product.getName() %></td>
				<td><%=Utils.toCurrency(product.getPrice()) %> 원</td>
				<td><%=Utils.toCurrency(product.getDiscountPrice()) %> 원</td>
				<td><%=product.getStatus().getName() %></td>
				<td><a href="detail.jsp?no=<%=product.getNo() %>" class="btn btn-outline-info btn-sm">상세보기</a></td>
			</tr>
<%
	}
%>
		</tbody>
	</table>

<%
	if(pagination.getTotalRows() > 0 ){
	
%>

	<div>
		<ul class="pagination justify-content-center">
			<li class="page-item <%=pagination.isFirst() ? "disabled" : "" %>">
				<a class="page-link" href="home.jsp?page=<%=pagination.getPrev() %>">이전</a>
			</li>
<%
	for (int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++) {
%>
			<li class="page-item <%=pageNo == num ? "active" : "" %>">
				<a class="page-link" href="home.jsp?page=<%=num %>"><%=num %></a>
			</li>
<%	
	}
%>
			<li class="page-item <%=pagination.isLast() ? "disabled" : "" %>">
				<a class="page-link" href="home.jsp?page=<%=pagination.getNext() %>">다음</a>
			</li>
		</ul>
	</div>
<%
	}
%>
	<div class="text-end">
		<a href="form.jsp" class="btn btn-primary">새 상품 등록</a>
	</div>
</div>
</body>
</html>



