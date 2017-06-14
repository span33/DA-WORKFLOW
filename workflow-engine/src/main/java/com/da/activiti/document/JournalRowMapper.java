package com.da.activiti.document;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.lang3.StringUtils;
import org.springframework.jdbc.core.RowMapper;

import com.da.activiti.model.JournalDetail;
import com.da.activiti.model.document.DocState;
import com.da.activiti.model.document.DocType;
import com.da.activiti.model.document.Invoice;

/**
 \* @author Santosh Pandey
 */
public class JournalRowMapper implements RowMapper<JournalDetail> {

    @Override
    public JournalDetail mapRow(final ResultSet rs, final int rowNum) throws SQLException {
        String id = rs.getString("ID");
        String author = StringUtils.trim(rs.getString("AUTHOR"));
        String title = StringUtils.trim(rs.getString("TITLE"));
        String docState = StringUtils.trim(rs.getString("DOC_STATE"));
        String docType = StringUtils.trim(rs.getString("DOC_TYPE"));
        String postingDate = StringUtils.trim(rs.getString("POSTING_DATE"));
        String period = StringUtils.trim(rs.getString("PERIOD"));
        String referances = StringUtils.trim(rs.getString("REFERANCES"));
        String companyCode = StringUtils.trim(rs.getString("COMPANY_CODE"));
        String documentHeader = StringUtils.trim(rs.getString("DOCUMENT_HEADER"));
        String debitAmount = StringUtils.trim(rs.getString("DEBIT_AMOUNT"));
        String creditAmount = StringUtils.trim(rs.getString("CREDIT_AMOUNT"));
        String approver = StringUtils.trim(rs.getString("APPROVER"));
        String journalDocType = StringUtils.trim(rs.getString("JOURNAL_DOC_TYPE"));
        
        String evidenceLocation = StringUtils.trim(rs.getString("EVIDENCE_LOCATION"));
        Date createdDate = rs.getDate("CREATED_DATE");
        JournalDetail journalDetail = new JournalDetail();
        journalDetail.setId(id);
        
        journalDetail.setId(id);
        journalDetail.setAuthor(author);
        journalDetail.setTitle(title);
        journalDetail.setDocState(DocState.valueOf(docState));
        journalDetail.setDocType(DocType.valueOf(docType));
        journalDetail.setPostingDate(postingDate);
        journalDetail.setPeriod(period);
        journalDetail.setReferance(referances);
        journalDetail.setCompanyCode(companyCode);
        journalDetail.setDocumentHeader(documentHeader);
        journalDetail.setDebitAmount(debitAmount);
        journalDetail.setCreditAmount(creditAmount);
        journalDetail.setEvidenceLocation(evidenceLocation);
        journalDetail.setApprover(approver);
        journalDetail.setCreatedDate(createdDate);
        journalDetail.setJournalDocType(journalDocType);
        return journalDetail ;
    }
}

