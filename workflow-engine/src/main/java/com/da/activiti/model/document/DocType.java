package com.da.activiti.model.document;

import java.util.Arrays;
import java.util.List;

/**
 \* @author Santosh Pandey
 */
public enum DocType {
    BOOK_REPORT,
    INVOICE,
    RECEIPT,
    JOURNAL,
    GENERAL,
    OPENACCOUNT,
    TESTPROCESS,
    TEST33,
    PAYORDER,
    SALESORDER,
    OCAS,
    //Just for unit tests - do not use in production
    UNIT_TEST_NO_EXIST;

    public static List<DocType> asList(){
        return Arrays.asList(DocType.values());
    }
}
