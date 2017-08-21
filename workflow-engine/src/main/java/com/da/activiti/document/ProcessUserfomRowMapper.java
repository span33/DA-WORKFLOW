package com.da.activiti.document;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.lang3.StringUtils;
import org.springframework.jdbc.core.RowMapper;

public class ProcessUserfomRowMapper implements RowMapper<ProcessUserfomInfo>{

	@Override
	public ProcessUserfomInfo mapRow(ResultSet rs, int arg1) throws SQLException {
		// TODO Auto-generated method stub
		ProcessUserfomInfo processUserfomInfo = new ProcessUserfomInfo();
		int id = rs.getInt("id");
        String docType = StringUtils.trim(rs.getString("doctype"));
        int processId = rs.getInt("process_id");
        String jsonData  = rs.getString("json_data");        
        processUserfomInfo.setDocType(docType);
        processUserfomInfo.setProcessId(processId);
        processUserfomInfo.setId(id);
        processUserfomInfo.setJsonData(jsonData);
        return processUserfomInfo; 
	}

}
