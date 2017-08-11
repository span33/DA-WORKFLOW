package com.da.activiti.document;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.lang3.StringUtils;
import org.springframework.jdbc.core.RowMapper;

import com.da.activiti.model.document.TaskInfo;

public class TaskRowMapper  implements RowMapper<TaskInfo>{

	@Override
	public TaskInfo mapRow(ResultSet rs, int rownum) throws SQLException {
			TaskInfo taskInfo = new TaskInfo();
		 	int taskId = rs.getInt("task_id");
	        String taskName = StringUtils.trim(rs.getString("task_name"));
	        String taskDescription = StringUtils.trim(rs.getString("task_description"));
	        String taskOwner = StringUtils.trim(rs.getString("task_owner"));
	        String taskType = StringUtils.trim(rs.getString("task_type"));
	       // String taskTemplateId = StringUtils.trim(rs.getString("task_parent_id"));
	       // String taskHasSibling = StringUtils.trim(rs.getString("task_hasSiblings"));
	        String taskStatus = StringUtils.trim(rs.getString("task_status") );
	        String processId = StringUtils.trim(rs.getString("process_id"));
	        String actor = StringUtils.trim(rs.getString("task_actor"));
	        taskInfo.setProcessId(processId);
	        taskInfo.setTaskName(taskName);
	        taskInfo.setTaskDescription(taskDescription);
	        taskInfo.setTaskOwner(taskOwner);
	        taskInfo.setTaskType(taskType);
	        taskInfo.setTaskStatus(taskStatus);
	        taskInfo.setActorId(actor);
	        taskInfo.setId(taskId);
		return taskInfo;
	}

}
