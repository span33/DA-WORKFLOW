package com.da.activiti.code;

import java.util.List;

import com.da.activiti.dao.IBaseDao;
import com.da.activiti.model.CodeLookUp;

public interface CodeLookUpDao extends IBaseDao<CodeLookUp> {
	
	public List <CodeLookUp> readByCodeType(String codeType) ; 
}
