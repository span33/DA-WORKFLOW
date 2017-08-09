package com.da.activiti.FormBuilder;

import java.util.List;
import java.util.Map;

import com.da.activiti.dao.IBaseDao;
import com.da.activiti.model.UserForm;

public interface UserDao extends IBaseDao<UserForm> {
	

	
	 List<Map<String, Object>> getUserByDepartMentId(String departments);

	
	
	
}
