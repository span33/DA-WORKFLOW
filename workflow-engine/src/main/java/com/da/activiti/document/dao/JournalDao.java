package com.da.activiti.document.dao;

import com.da.activiti.dao.IBaseDao;
import com.da.activiti.model.JournalDetail;
import com.da.activiti.model.document.Document;

public interface JournalDao extends IBaseDao<JournalDetail> {
	
void 	updateFileLocation(Document obj)  ;

}
