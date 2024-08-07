package hr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import hr.utils.ConnectionUtils;
import hr.vo.DeptList;

public class DeptDao {

	/**
	 * 모든 부서정보를 반환한다
	 * @return 부서목록
	 * @throws SQLException
	 */
	public List<DeptList> findAllDepts() throws SQLException{
		String sql = """
				SELECT DEPARTMENT_ID, DEPARTMENT_NAME, FIRST_NAME, CITY, CNT
				FROM DEPT_DETAIL_VIEW
				WHERE MANAGER_ID IS NOT NULL
				ORDER BY DEPARTMENT_ID ASC
				""";
		
		List<DeptList> depts = new ArrayList<DeptList>();
		Connection con = ConnectionUtils.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			DeptList vo = new DeptList();
			vo.setId(rs.getInt("department_id"));
			vo.setName(rs.getString("department_name"));
			vo.setManagerName(rs.getString("first_name"));
			vo.setCity(rs.getString("city"));
			vo.setCnt(rs.getInt("cnt"));
			
			depts.add(vo);
		}
		rs.close();
		pstmt.close();
		con.close();
		return depts;
	}
}
