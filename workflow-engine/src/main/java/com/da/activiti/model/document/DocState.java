package com.da.activiti.model.document;

/**
 * Represents the acceptable document types. These are also the only acceptable {@code Category} or namespace
 * values in BPMN 2.0 XML and Models. This is because, by default, documents are associated with a workflow (and
 * possibly group) by the namespace element (or category in Activiti's query system).
 \* @author Santosh Pandey
 */
public enum DocState {
    DRAFT,
    APPROVED,
    REJECTED,
    WAITING_FOR_APPROVAL,
    WAITING_FOR_COLLABORATION,
    COLLABORATED,
    PUBLISHED,
    EMAILED,
    WAITING_FOR_DOCUMENT_TO_EMAIL,
    WAITING_FOR_DOCUMENT_TO_PUBLISH,
	WAITING_FOR_DOCUMENT_TO_SUBMIT,
	GENRIC_STATUS,
	DOCUMENT_SUBMITED;
	
	public static DocState getDocStateByName(String name){
   	 for(DocState docState : DocState.values()) {
   	        if(docState.name().equalsIgnoreCase(name)) {
   	        	return docState ;
   	        }
   	     }	
   	 return GENRIC_STATUS ;
   }
	
	public static DocState getDocStateStatusByName(String name){
		String lname = name.split("_")[0] ;
		lname = "WAITING_FOR_DOCUMENT_TO_"+lname ;
	   	 for(DocState docState : DocState.values()) {
	   	        if(docState.name().equalsIgnoreCase(lname)) {
	   	        	return docState ;
	   	        }
	   	     }	
	   	 return GENRIC_STATUS ;
	   }
}