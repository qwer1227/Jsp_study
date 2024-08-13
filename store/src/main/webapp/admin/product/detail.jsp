<%@page import="vo.Benefit"%>
<%@page import="java.util.List"%>
<%@page import="vo.Product"%>
<%@page import="dao.ProductDao"%>
<%@page import="utils.Utils"%>
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
				<a class="nav-link active" href="/store/admin/product/home.jsp">상품관리</a>
			</li>
		</ul>
	</div>
</nav>
<div class="container mt-4 mb-5">
	<h1>상품 상세정보</h1>
	
	<!-- 
		요청 URL
			http://localhost/store/admin/product/detail.jsp?no=xxx
		요청 URI
			/store/admin/product/detail.jsp
		쿼리스트링
			no = xxx
			
		요청파라미터 정보
		name		value
		"no"		"xxx"		상품번호
	 -->
	 
<%
	//1. 요청파라미터 조회
	int productNo = Utils.toInt(request.getParameter("no"));
	// 요청파라미터로 전달받은 상품번호가 유호하지 않으면
	// home.jsp를 재요청하는 URL을 응답으로 보낸다
	if(productNo == 0){
		response.sendRedirect("home.jsp?error");
		return;
	}
	
	//2. 요청파라미터로 전달받은 상품번호에 해당하는 상품상세정보를 조회한다
	ProductDao productDao = new ProductDao();
	Product product = productDao.getProductByNo(productNo);
	
	//3. 요청 파라미터로 전달받은 상품의 추가 혜택 정보를 조회한다
	List<Benefit> benefits = productDao.getBenefitsByProductNo(productNo);
%>
	
	<table class="table table-bordered">
		<colgroup>
			<col width="15%">
			<col width="35%">
			<col width="15%">
			<col width="35%">
		</colgroup>
		<thead class="table-dark">
			<tr>
				<th>항목</th>
				<th>값</th>
				<th>항목</th>
				<th>값</th>
			</tr>
		</thead>
		<%
			if (product == null){ 
		%>
		
			<tr>
				<td class="text-center" colspan="4">
					상품정보가 존재하지 않습니다
				</td>		
			</tr>
		
		<% 
			} else { 
		%>
		<tbody>
			<tr>
				<th>이름</th>
				<td><%=product.getName() %></td>
				<th>번호</th>
				<td><%=product.getNo() %></td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td><%=product.getCategory().getName() %></td>
				<th>제조회사</th>
				<td><%=product.getCompany().getName() %></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><%=Utils.toCurrency(product.getPrice()) %>원</td>
				<th>할인가격</th>
				<td><%=Utils.toCurrency(product.getDiscountPrice()) %>원</td>
			</tr>
			<tr>
				<th>재고수량</th>
				<td><%=product.getStock() %>개</td>
				<th>상태</th>
				<td><%=product.getStatus().getName() %></td>
			</tr>
			<tr>
				<th>등록일자</th>
				<td><%=product.getCreatedDate() %></td>
				<th>수정일자</th>
				<td><%=Utils.nullToBlank(product.getUpdatedDate()) %></td>
			</tr>
			<tr>
				<th>설명</th>
				<td colspan="3"><%=product.getDescription() %></td>
			</tr>
			<tr>
				<th>추가혜택</th>
				<td colspan="3">
				<%
					for(Benefit benefit : benefits){
				%>
					<span class="badge bg-success"><%=product.getHtmlDescription() %></span> 
				<%
					}
				%>
				</td>
			</tr>
			<% 
				} 
			%>
		</tbody>
	</table>
	
	<div class="text-end">
		<a href="modifyform.jsp" class="btn btn-warning">수정</a>
		<a href="delete.jsp" class="btn btn-danger">삭제</a>
		<a href="modifyform.jsp" class="btn btn-primary">목록</a>
	</div>
</div>
</body>
</html>