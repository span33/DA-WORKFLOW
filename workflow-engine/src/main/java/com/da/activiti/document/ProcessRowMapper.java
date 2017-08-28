package com.da.activiti.document;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.lang3.StringUtils;
import org.springframework.jdbc.core.RowMapper;

import com.da.activiti.model.document.ProcessInfo;

public class ProcessRowMapper  implements RowMapper<ProcessInfo>{

	@Override
	public ProcessInfo mapRow(ResultSet rs, int rownum) throws SQLException {
			ProcessInfo processInfo = new ProcessInfo();
		 	int processId = rs.getInt("process_id");
	        String processName = StringUtils.trim(rs.getString("process_name"));
	        String processDescription = StringUtils.trim(rs.getString("process_description"));
	        String processOwner = StringUtils.trim(rs.getString("process_owner"));
	        String processType = StringUtils.trim(rs.getString("process_type"));
	        String processTemplateId = StringUtils.trim(rs.getString("process_template_id"));
	        String processLevel = StringUtils.trim(rs.getString("process_level"));
	        String processParentId = StringUtils.trim(rs.getString("process_parent_id") );
	        String processHasSibling = StringUtils.trim(rs.getString("process_hasSibling"));
	        String createdBy = StringUtils.trim(rs.getString("created_by"));
	        String updatedBy = StringUtils.trim(rs.getString("updated_by"));
	        String docType = StringUtils.trim(rs.getString("doc_type"));
	        String groupId = StringUtils.trim(rs.getString("group_id"));
	        String processActName =  StringUtils.trim(rs.getString("process_act_name"));
	        
	        processInfo.setProcessActName(processActName);
	        processInfo.setProcessId(processId);
	        processInfo.setProcessName(processName);
	        processInfo.setProcessDescription(processDescription);
	        processInfo.setProcessOwner(processOwner);
	        processInfo.setProcessType(processType);
	        processInfo.setProcessTemplateId(processTemplateId);
	        processInfo.setProcessLevel(processLevel);
	        processInfo.setParent(processParentId);
	        processInfo.setProcessHasSibling(processHasSibling);
	        processInfo.setCreatedBy(createdBy);
	        processInfo.setUpdatedBy(updatedBy);
	        processInfo.setDocType(docType);
	        processInfo.setGroupId(groupId);
	        
	        
		return processInfo;
	}

}
