package com.da.activiti.model;

import java.io.Serializable;

import com.da.activiti.model.document.Document;

public class JournalDetail  extends Document implements Serializable {

	public JournalDetail() {
		this.groupId = "Approver" ;
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 1792098448183745747L;

	private String postingDate;
	
	private String period;

	private String referance;

	private String companyCode;

	private String documentHeader;

	private String debitAmount;

	private String creditAmount;

	private String approver;
	
	private String journalDocType;
	
	private String evidanceFileLocation;
	
	public String getEvidanceFileLocation() {
		return evidanceFileLocation;
	}

	public void setEvidanceFileLocation(String evidanceFileLocation) {
		this.evidanceFileLocation = evidanceFileLocation;
	}

	public String getJournalDocType() {
		return journalDocType;
	}

	public void setJournalDocType(String journalDocType) {
		this.journalDocType = journalDocType;
	}

	private String evidenceLocation;

	public String getPostingDate() {
		return postingDate;
	}

	public void setPostingDate(String postingDate) {
		this.postingDate = postingDate;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public String getReferance() {
		return referance;
	}

	public void setReferance(String referance) {
		this.referance = referance;
	}

	public String getCompanyCode() {
		return companyCode;
	}

	public void setCompanyCode(String companyCode) {
		this.companyCode = companyCode;
	}

	public String getDocumentHeader() {
		return documentHeader;
	}

	public void setDocumentHeader(String documentHeader) {
		this.documentHeader = documentHeader;
	}

	public String getDebitAmount() {
		return debitAmount;
	}

	public void setDebitAmount(String debitAmount) {
		this.debitAmount = debitAmount;
	}

	public String getCreditAmount() {
		return creditAmount;
	}

	public void setCreditAmount(String creditAmount) {
		this.creditAmount = creditAmount;
	}

	public String getApprover() {
		return approver;
	}

	public void setApprover(String approver) {
		this.approver = approver;
	}

	public String getEvidenceLocation() {
		return evidenceLocation;
	}

	public void setEvidenceLocation(String evidenceLocation) {
		this.evidenceLocation = evidenceLocation;
	}

	

	
}
