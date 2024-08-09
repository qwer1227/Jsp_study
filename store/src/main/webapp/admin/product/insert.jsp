<%@page import="vo.ProductBenefit"%>
<%@page import="dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.Benefit"%>
<%@page import="vo.Status"%>
<%@page import="vo.Company"%>
<%@page import="vo.Category"%>
<%@page import="vo.Product"%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%--
	요청 URL
		http://localhost/store/admin/product/insert.jsp
	요청 URI
		/store/product/insert.jsp
	폼 데이터
		catNo=1001&
		name=LG+Gram+%EB%85%B8%ED%8A%B8%EB%B6%81+14%EC%9D%B8%EC%B9%98&
		price=2000000&
		discountPrice=1800000&
		stock=5&
		companyNo=1001&
		statusNo=10&
		description=LG+Gram&
		benefitNo=13
		
	요청파라미터 정보
	-----------------------
	no             value
	catNo	      1001&
	name	      LG+Gram+%EB%85%B8%ED%8A%B8%EB%B6%81+14%EC%9D%B8%EC%B9%98&
	price         2000000&
	
 1800000&
	stock         5&
	companyNo     1001&
	statusNo      10&
	description   LG+Gram&
	benefitNo     13
 --%>

<%
	// 1. 요청 파라미터 정보를 조회한다
	int catNo = Integer.parseInt(request.getParameter("catNo"));
	String name = request.getParameter("name");
	int price = Integer.parseInt(request.getParameter("price"));
	int discountPrice = Integer.parseInt(request.getParameter("discountPrice"));
	int stock = Integer.parseInt(request.getParameter("stock"));
	int companyNo = Integer.parseInt(request.getParameter("companyNo"));
	int statusNo = Integer.parseInt(request.getParameter("statusNo"));
	String description = request.getParameter("description");
	String[] benefitNoArr = request.getParameterValues("benefitNo");
	
	// 2. Product객체를 생성해서 요청파라미터
	Product product = new Product();
	product.setCategory(new Category(catNo));
	product.setName(name);
	product.setPrice(price);
	product.setDiscountPrice(discountPrice);
	product.setStock(stock);
	product.setCompany(new Company(companyNo));
	product.setStatus(new Status(statusNo));
	product.setDescription(description);
	
	
	// 3. ProductDao객체를 생성하기
	ProductDao productDao =  new ProductDao();
	// 4. 상품 입력번호를 조회한다
	int productNo = productDao.getSequence();
	// 5. Product객체에 상품일련번호를 담는다
	product.setNo(productNo);
	
	// 6. 새 상품정보를 저장하기
	productDao.insertProduct(product);
	
	// 7. 체크된 추가 혜택정보를 Benefit객체에 저장하기
	List<Benefit> benefits = new ArrayList<>();
	for(String value : benefitNoArr){
		int benefitNo = Integer.parseInt(value);
		
		ProductBenefit productBenefit = new ProductBenefit();
		productBenefit.setProductNo(productNo);
		productBenefit.setBenefitNo(benefitNo);
		
		productDao.insertProductBenefit(productBenefit);
		
	}
	
	// 8. home.jsp를 재요청하는 URL을 응답으로 보낸다
	response.sendRedirect("home.jsp");
	
	
%>