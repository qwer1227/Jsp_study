package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import utils.ConnectionUtils;
import vo.Product;
import vo.ProductBenefit;

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
}