package com.da.activiti.document;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.da.activiti.model.CodeLookUp;

public class CodeLookUpRowMapper implements RowMapper<CodeLookUp> {

	@Override
	public CodeLookUp mapRow(ResultSet rs, int arg1) throws SQLException {
		CodeLookUp codeLookUp = new CodeLookUp();
		String codeType = rs.getString("Code_type");
		String keyCode = rs.getString("Key_Code");
		String keyValue = rs.getString("Key_Value");
		String dateCreated = rs.getString("Dt_Created");
		String id = rs.getString("id");
		codeLookUp.setId(id);
		codeLookUp.setCodeType(codeType);
		codeLookUp.setKeyCode(keyCode);
		codeLookUp.setKeyValue(keyValue);
		codeLookUp.setDateCreated(dateCreated);
		return codeLookUp;

	}

}
