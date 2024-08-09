package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import utils.ConnectionUtils;
import vo.Company;

public class CompanyDao {
	
	/**
	 * 모든 제조회사를 조회해서 반환한다
	 * @return 모든 제조회사 목록
	 * @throws SQLException
	 */
	public List<Company> getAllCompanies() throws SQLException{
		String sql = """
				select *
				from store_product_companies
				order by product_company_no
				""";
		
		List<Company> companies = new ArrayList<Company>();
		
		Connection con = ConnectionUtils.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Company company = new Company();
			company.setNo(rs.getInt("product_company_no"));
			company.setName(rs.getString("product_company_name"));
			company.setTel(rs.getString("product_company_tel"));
			
			companies.add(company);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return companies;
	}
}
