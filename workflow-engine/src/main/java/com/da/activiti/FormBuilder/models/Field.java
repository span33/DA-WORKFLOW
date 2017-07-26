package com.da.activiti.FormBuilder.models;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Field {
	
	private String style;

    private String name;

    private String subtype;
    
    @JsonProperty(value = "class")
    private String cssclass;

    private String label;

    private String type;

    private String required;

    private List<Option> option;

    public String getStyle ()
    {
        return style;
    }

    public void setStyle (String style)
    {
        this.style = style;
    }

    public String getName ()
    {
        return name;
    }

    public void setName (String name)
    {
        this.name = name;
    }

    public String getSubtype ()
    {
        return subtype;
    }

    public void setSubtype (String subtype)
    {
        this.subtype = subtype;
    }

    

    public String getLabel ()
    {
        return label;
    }

    public void setLabel (String label)
    {
        this.label = label;
    }

    public String getType ()
    {
        return type;
    }

    public void setType (String type)
    {
        this.type = type;
    }

    public String getRequired ()
    {
        return required;
    }

    public void setRequired (String required)
    {
        this.required = required;
    }

    public List<Option> getOption ()
    {
        return option;
    }

    public void setOption (List<Option> option)
    {
        this.option = option;
    }

    @Override
    public String toString()
    {
        return "ClassPojo [style = "+style+", name = "+name+", subtype = "+subtype+", class = "+cssclass+", label = "+label+", type = "+type+", required = "+required+", option = "+option+"]";
    }
}

