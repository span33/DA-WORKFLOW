package com.da.activiti.document;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.lang3.StringUtils;
import org.springframework.jdbc.core.RowMapper;

import com.da.activiti.FormBuilder.gen.models.Field;

public class UserFormRowMapper implements RowMapper<Field>{

	@Override
	public Field mapRow(ResultSet rs, int arg1) throws SQLException {
		// TODO Auto-generated method stub
		Field field = new Field();
		 String name = StringUtils.trim(rs.getString("name"));
		 String type = StringUtils.trim(rs.getString("type"));
		 String subtype = StringUtils.trim(rs.getString("subtype"));
		 String required = StringUtils.trim(rs.getString("required"));
		 String label = StringUtils.trim(rs.getString("label"));
		 String className = StringUtils.trim(rs.getString("class"));
		 String data = StringUtils.trim(rs.getString("data"));
		 int id = rs.getInt("user_form_mapping_id");
		 
		 field.setName(name);
		 field.setType(type);
		 field.setSubtype(subtype);
		 field.setRequired(required);
		 field.setLabel(label);
		 field.setClassName(className);
		 field.setJsonData(data);
		 field.setFieldId("field"+id);
		return field;
		 
		
	}

}
