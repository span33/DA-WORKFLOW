package com.da.activiti.model.document;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.beans.PropertyEditorSupport;

/**
\* @author Santosh Pandey
*/
public class DocTypeEditor extends PropertyEditorSupport {

  /*  private static final Logger LOG = LoggerFactory.getLogger(DocTypeEditor.class);

    @Override
    public String getAsText() {
        DocType1 DocType = (DocType1) this.getValue();
        if (DocType == null) {
            return null;
        }
        LOG.trace("Converted DocType: {} to string={}", docType, DocType.toString());
        return DocType.toString();
    }

    @Override
    public void setAsText(String s) {
        if (StringUtils.isBlank(s)) {
            setValue(null);
            return;
        }
        DocType1 docType = DocType1.valueOf(s);
        LOG.trace("Converted DocType: {} ---> {}", s, docType);
        setValue(docType);
    }
*/
}
