package com.da.activiti.FormBuilder.gen.models;

public class Value {
	private String value;

    private String label;

    public String getValue ()
    {
        return value;
    }

    public void setValue (String value)
    {
        this.value = value;
    }

    public String getLabel ()
    {
        return label;
    }

    public void setLabel (String label)
    {
        this.label = label;
    }

    @Override
    public String toString()
    {
        return "ClassPojo [value = "+value+", label = "+label+"]";
    }

}
