package com.da.activiti.FormBuilder.models;

public class Option {
	 private String content;

	    private String selected;

	    private String value;

	    private String label;

	    public String getContent ()
	    {
	        return content;
	    }

	    public void setContent (String content)
	    {
	        this.content = content;
	    }

	    public String getSelected ()
	    {
	        return selected;
	    }

	    public void setSelected (String selected)
	    {
	        this.selected = selected;
	    }

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
	        return "ClassPojo [content = "+content+", selected = "+selected+", value = "+value+", label = "+label+"]";
	    }
	}