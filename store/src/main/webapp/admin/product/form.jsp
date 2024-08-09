<%@page import="vo.Status"%>
<%@page import="vo.Category"%>
<%@page import="java.util.List"%>
<%@page import="dao.StatusDao"%>
<%@page import="dao.BenefitDao"%>
<%@page import="vo.Benefit"%>
<%@page import="vo.Company"%>
<%@page import="dao.CompanyDao"%>
<%@page import="dao.CategoryDao"%>
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
<h1>새 상품 입력폼</h1>
<%
	//카테고리, 제조회사, 상품상태, 추가혜택정보를 조회한다
	CategoryDao categoryDao = new CategoryDao();
	CompanyDao companyDao = new CompanyDao();
	StatusDao statusDao = new StatusDao();
	BenefitDao benefitDao = new BenefitDao();
	
	List<Category> categories = categoryDao.getAllCategories();
	List<Company> companies = companyDao.getAllCompanies();
	List<Status> statusList = statusDao.getAllStatus();
	List<Benefit> benefits = benefitDao.getAllBenefit();
%>
<form class="border bg-light p-3" method="post" action="insert.jsp">
	<div class="mb-3">
		<label class="form-label"> 상품 카테고리</label>
		<select class="form-select" name="catNo">
			<option value="" selected disabled> 카테고리를 선택하세요 </option>
			<%
				for(Category cat : categories){
			%>
			<option value="<%=cat.getNo()%>"> <%=cat.getName() %> </option>
			<%
				}
			%>
		</select>	
	</div>



<div class="mb-3">
	<label class="form-label">상품이름</label>
	<input type="text" class="form-control" name="name"/>
</div>
<div class="mb-3">
	<label class="form-label">상품 가격</label>
	<input type="text" class="form-control" name="price"/>
</div>
<div class="mb-3">
	<label class="form-label">상품 할인가격</label>
	<input type="text" class="form-control" name="discountPrice"/>
</div>
<div class="mb-3">
	<label class="form-label">입고 수량</label>
	<input type="text" class="form-control" name="stock"/>
</div>
<div class="mb-3">
	<label class="form-label">상품 제조회사</label>
	<select class="form-select" name="companyNo">
			<option value="" selected disabled> 제조회사를 선택하세요 </option>
			<%
				for(Company company : companies){
			%>
				<option value="<%=company.getNo() %>"><%=company.getName() %></option>
			<%
			}
			%>
		</select>
</div>

<div class="mb-3">
	<label class="form-label">상품상태</label>
	<div>
	<%
		for(Status status : statusList){
	%>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio" value="<%=status.getNo() %>" name="statusNo">
			<label class="form-check-label"> <%=status.getName() %></label>
		</div>
		
	<%
		}
	%>
		
	</div>
</div>

<div class="mb-3">
	<label class="form-label">상품설명</label>
	<textarea class="form-control" rows="5" name="description"></textarea>
</div>
<div class="mb-3">
	<label class="form-label">추가 혜택</label>
	<div>
	
	<%
		for(Benefit benefit : benefits){
	%>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="checkbox" value="<%=benefit.getNo() %>" name="benefitNo">
			<label class="form-check-label"> <%=benefit.getName() %></label>
		</div>
	<%
		}
	%>

	</div>
	<div class="text-end">
		<a href="list.jsp" class="btn btn-secondary">취소</a>
		<button type="submit" class="btn btn-primary">등록</button>
	</div>
</div>

</div>
</form>
</body>
</html>