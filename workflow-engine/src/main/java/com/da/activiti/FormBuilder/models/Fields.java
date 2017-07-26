package com.da.activiti.FormBuilder.models;

import java.util.List;

public class Fields {
	
	private List<Field> field;

    public List<Field> getField ()
    {
        return field;
    }

    public void setField (List<Field> field)
    {
        this.field = field;
    }

    @Override
    public String toString()
    {
        return "ClassPojo [field = "+field+"]";
    }
}
