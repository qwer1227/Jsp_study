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

<div class="container mt-4">
<h1>상품 목록</h1>

<table class="table"">
	<thead>
		<tr>
			<th>번호</th>
			<th>상품명</th>
			<th>가격</th>
			<th>할인가격</th>
			<th>상태</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>1</td>
			<td>LG 그램 노트북</td>
			<td>2,000,000원</td>
			<td>1,800,000원</td>
			<td>판매 중</td>
			<td> <a href="detail.jsp" class="btn btn-outline-info btn-sm">상세보기</a></td>
		</tr>
		<tr>
			<td>1</td>
			<td>LG 그램 노트북</td>
			<td>2,000,000원</td>
			<td>1,800,000원</td>
			<td>판매 중</td>
			<td> <a href="detail.jsp" class="btn btn-outline-info btn-sm">상세보기</a></td>
		</tr>
		<tr>
			<td>1</td>
			<td>LG 그램 노트북</td>
			<td>2,000,000원</td>
			<td>1,800,000원</td>
			<td>판매 중</td>
			<td a href="detail.jsp">상세보기</td>
		</tr>
	</tbody>
</table>

<div class="text-end"'>
	<a href="form.jsp" class="btn btn-primary">새 상품 등록</a>
</div>
</div>
</body>
</html>