package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import utils.ConnectionUtils;
import vo.Status;

public class StatusDao {

	public List<Status> getAllStatus() throws SQLException{
		String sql = """
				select *
				from store_product_status
				order by product_status_no asc
				""";
		
		List<Status> list = new ArrayList<Status>();
		
		Connection con = ConnectionUtils.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Status status = new Status();
			status.setNo(rs.getInt("product_status_no"));
			status.setName(rs.getString("product_status_name"));
			
			list.add(status);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return list;
	}
}
