package com.da.activiti.FormBuilder.models;

import javax.xml.bind.annotation.XmlAnyElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class FormTemplate {
	@XmlAnyElement
	private Fields fields;

    public Fields getFields ()
    {
        return fields;
    }

    public void setFields (Fields fields)
    {
        this.fields = fields;
    }

    @Override
    public String toString()
    {
        return "ClassPojo [fields = "+fields+"]";
    }

}
