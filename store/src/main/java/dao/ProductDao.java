	package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import utils.ConnectionUtils;
import vo.Benefit;
import vo.Category;
import vo.Company;
import vo.Product;
import vo.ProductBenefit;
import vo.Status;

public class ProductDao {

	/**
	 * 새 상품등록에 필요한 상품일련번호를 조회한다
	 * @return 새 상품일련번호
	 * @throws SQLException
	 */
	public int getSequence() throws SQLException{
		String sql = """
				select STORE_PRODUCT_SEQ.NEXTVAL
				from dual
				""";
	
	int productNo = 0;
	
	Connection con = ConnectionUtils.getConnection();
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	while(rs.next()) {
		productNo = rs.getInt(1);
	}
	rs.close();
	pstmt.close();
	con.close();
	
	return productNo;
	}
	
	public void insertProduct(Product product) throws SQLException{
		String sql = """
				insert into store_products
				(product_no, product_name, product_price, product_discount_price, product_stock, product_description, product_category_no, product_company_no, product_status_no)
				values
				(?,?,?,?,?,?,?,?,?)
				""";
		
		Connection con = ConnectionUtils.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, product.getNo());
		pstmt.setString(2, product.getName());
		pstmt.setInt(3,product.getPrice() );
		pstmt.setInt(4,product.getDiscountPrice() );
		pstmt.setInt(5,product.getStock() );
		pstmt.setString(6,product.getDescription());
		pstmt.setInt(7,product.getCompany().getNo() );
		pstmt.setInt(8, product.getCategory().getNo());
		pstmt.setInt(9, product.getStatus().getNo());
		pstmt.executeQuery();
		
		pstmt.close();
		con.close();
	}
	
	public void insertProductBenefit(ProductBenefit productBenefit) throws SQLException{
		String sql = """
				insert into store_product_benefits
				(product_no, benefit_no)
				values
				(?,?)
				""";
		
		Connection con = ConnectionUtils.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, productBenefit.getProductNo());
		pstmt.setInt(2, productBenefit.getBenefitNo());
		pstmt.executeQuery();
		
		pstmt.close();
		con.close();
		
		
	}
	
	public int getTotalRows() throws SQLException{
		String sql = """
				select count(*)
				from store_products
				""";
		int totalRows = 0;
		
		Connection con = ConnectionUtils.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		totalRows = rs.getInt(1);
		
		rs.close();
		pstmt.close();
		con.close();
		
		return totalRows;
	}
	
	
	public List<Product> getProducts(int begin, int end) throws SQLException{
		String sql ="""
				select * 
				from(
					select row_number() over(order by product_no desc) rownumber
					,p.product_no
					, p.product_name
					, p.product_price
					, p.product_discount_price
					, s.product_status_no
					, s.product_status_name
				from store_products p , store_product_status s
				where p.product_status_no = s.product_status_no
				)
				where rownumber between ? and ?
				""";
		
		List<Product> products = new ArrayList<Product>();
		
		Connection con = ConnectionUtils.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, begin);
		pstmt.setInt(2, end);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Product product = new Product();
			product.setNo(rs.getInt("product_no"));
			product.setName(rs.getString("product_name"));
			product.setPrice(rs.getInt("product_price"));
			product.setDiscountPrice(rs.getInt("product_discount_price"));
			
			Status status = new Status();
			status.setNo(rs.getInt("product_status_no"));
			status.setName(rs.getString("product_status_name"));
			
			product.setStatus(status);
			
			products.add(product);
			
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return products;
	}
	
	public Product getProductByNo(int productNo) throws SQLException{
		String sql="""
				select p.product_no
			    , p.product_name
			    , p.product_price
			    , p.product_discount_price
			    , p.product_stock
			    , p.product_description
			    , p.product_created_date
			    , p.product_updated_date
			    , ca.product_category_no
			    , ca.product_category_name
			    , co.product_company_no
			    , co.product_company_name
			    , st.product_status_no
			    , st.product_status_name
			from store_products p
			    , store_product_categories ca
			    , store_product_companies co
			    , store_product_status st
			where p.product_no = ?
			    and p.product_category_no = ca.product_category_no
			    and p.product_company_no = co.product_company_no
			    and p.product_status_no = st.product_status_no
				""";
		
		Product product = null;
		
		Connection con = ConnectionUtils.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, productNo);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			product = new Product();
			product.setNo(rs.getInt("product_no"));
			product.setName(rs.getString("product_name"));
			product.setPrice(rs.getInt("product_price"));
			product.setDiscountPrice(rs.getInt("product_discount_price"));
			product.setStock(rs.getInt("product_stock"));
			product.setDescription(rs.getString("product_description"));
			product.setCreatedDate(rs.getDate("product_created_date"));
			product.setUpdatedDate(rs.getDate("product_updated_date"));
			
			
			Category category = new Category();
			category.setNo(rs.getInt("product_category_no"));
			category.setName(rs.getString("product_category_name"));
			
			Company company = new Company();
			company.setNo(rs.getInt("product_company_no"));
			company.setName(rs.getString("product_company_name"));
			
			Status status = new Status();
			status.setNo(rs.getInt("product_status_no"));
			status.setName(rs.getString("product_status_name"));
			
			product.setCategory(category);
			product.setCompany(company);
			product.setStatus(status);
			
			
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return product;
	}
	
	public List<Benefit> getBenefitsByProductNo(int productNo) throws SQLException{
		String sql = """
				select benefit_no
				, benefit_name
				from store_benefits
				where benefit_no in (select benefit_no
									 from store_product_benefits
									 where product_no = ?)
				""";
		
			List<Benefit> benefits = new ArrayList<Benefit>();
			
			Connection con = ConnectionUtils.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Benefit benefit = new Benefit();
				
				benefit.setNo(rs.getInt("benefit_no"));
				benefit.setName(rs.getString("benefit_name"));
				
				benefits.add(benefit);
			}
			
			rs.close();
			pstmt.close();
			con.close();
			
			return benefits;
	}
}