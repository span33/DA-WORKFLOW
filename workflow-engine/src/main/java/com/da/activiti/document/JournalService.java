package com.da.activiti.document;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.da.activiti.document.dao.JournalDao;
import com.da.activiti.model.JournalDetail;

@Service("journalService")
public class JournalService {
	
	@Autowired protected JournalDao journalDao;
	
	@Transactional
    public String createJournal(JournalDetail journalDetail){
    	return journalDao.create(journalDetail);
    	
    	
    }
	
	@Transactional(readOnly = true)
    public List<JournalDetail> listAllJournal() {
        
        return journalDao.readAll();
       
    }

}
