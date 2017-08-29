package com.da.activiti.document;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class ProcessDeptRowMapper  implements RowMapper<String>{

	@Override
	public String mapRow(ResultSet rs, int rownum) throws SQLException {
		return rs.getString("department_id");
	}

}
