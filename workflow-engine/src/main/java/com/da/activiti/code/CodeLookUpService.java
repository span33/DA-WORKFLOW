package com.da.activiti.code;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.da.activiti.exception.BusinessException;
import com.da.activiti.model.CodeLookUp;

@Service("codeLookUpService")
public class CodeLookUpService {

	@Autowired
	protected CodeLookUpDao codeLookUpDao;

	public List<CodeLookUp> fetchCodeList() {
		return codeLookUpDao.readAll();
	}

	public void addCodeType(CodeLookUp codeLookUp) throws BusinessException {
		codeLookUpDao.create(codeLookUp);
	}
	
	public void editCodeType(CodeLookUp codeLookUp) throws BusinessException {
		codeLookUpDao.update(codeLookUp);
	}
	
	public void deleteCodeType(String id) {
		codeLookUpDao.delete(id);
	}
	public List<CodeLookUp> fetchCodeList(String codeType ) {
		return codeLookUpDao.readByCodeType(codeType);
	}
}
