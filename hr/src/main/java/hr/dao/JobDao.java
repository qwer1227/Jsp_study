package hr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import hr.utils.ConnectionUtils;
import hr.vo.DeptList;
import hr.vo.JobList;

public class JobDao {
	public List<JobList> getAllJobs() throws SQLException{
		String sql = """
				SELECT *
				FROM JOBS
				ORDER BY JOB_id
				""";
		Connection con = ConnectionUtils.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		List<JobList> joblistall = new ArrayList<JobList>();
		
		while(rs.next()) {
			JobList joblist = new JobList();
			joblist.setId(rs.getString("job_id"));
			joblist.setTitle(rs.getString("job_title"));
			joblist.setMaxSalary(rs.getInt("min_salary"));
			joblist.setMinSalary(rs.getInt("max_salary"));
			
			joblistall.add(joblist);
		}
		
		return joblistall;
	}
}
