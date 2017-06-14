package com.da.activiti.document.dao;

import static com.google.common.base.Preconditions.checkArgument;

import java.sql.Types;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.da.activiti.dao.BaseDao;
import com.da.activiti.document.JournalRowMapper;
import com.da.activiti.model.JournalDetail;
import com.da.activiti.model.document.Document;
import com.da.activiti.web.PagingCriteria;
import com.google.common.collect.ImmutableMap;


@Repository
@Component("journalDao")
public class JdbcJournalDao extends BaseDao implements JournalDao {
	
	private static final Logger LOG = LoggerFactory.getLogger(JdbcProcessDao.class);

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<JournalDetail> readAll() {
		 String sql = "SELECT * FROM JOURNAL ORDER BY created_date ASC";
	        List<JournalDetail> reports = this.namedJdbcTemplate.query(sql, new JournalRowMapper ());
	        LOG.debug("got all invoices: {}", reports.size());
	        return reports;
	}

	@Override
	public List<JournalDetail> readPage(PagingCriteria criteria) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String create(JournalDetail obj) {
		LOG.debug("Inserting  Journal into SQL backend: {}",obj);
	      

	    
        String sql = "INSERT INTO JOURNAL ( AUTHOR, POSTING_DATE, PERIOD,  REFERANCES, DOC_TYPE, DOC_STATE, COMPANY_CODE, DOCUMENT_HEADER ,DEBIT_AMOUNT ,CREDIT_AMOUNT ,  APPROVER ,  EVIDENCE_LOCATION,JOURNAL_DOC_TYPE) " +
                				  "VALUES (:author, :postingDate,  :period, :referance, :docType, :docState, :companyCode, :documentHeader, :debitAmount , :creditAmount , :approver , :evidenceLocation , :journalDocType)";
        KeyHolder keyHolder = new GeneratedKeyHolder(); 
        BeanPropertySqlParameterSource source = new BeanPropertySqlParameterSource(obj);
        source.registerSqlType("docState", Types.VARCHAR);
        source.registerSqlType("docType", Types.VARCHAR);
        this.namedJdbcTemplate.update(sql, source,keyHolder);
        return  Long.toString(keyHolder.getKey().longValue());
	}

	@Override
	public void createWithId(JournalDetail obj) {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(JournalDetail obj) {
		checkArgument(StringUtils.isNotBlank(obj.getId()), "document id cannot be blank");
        String sql = "UPDATE JOURNAL SET title=:title , doc_state=:docState WHERE id=:id";

        BeanPropertySqlParameterSource source = new BeanPropertySqlParameterSource(obj);
        source.registerSqlType("docState", Types.VARCHAR);
        int results = this.namedJdbcTemplate.update(sql, source);
        LOG.debug("Updated: {} journals", results);

	}
	
	@Override
	public void updateFileLocation(Document obj) {
		checkArgument(StringUtils.isNotBlank(obj.getId()), "document id cannot be blank");
        String sql = "UPDATE JOURNAL SET  EVIDENCE_LOCATION=:evidanceFileLocation WHERE id=:id";

        BeanPropertySqlParameterSource source = new BeanPropertySqlParameterSource(obj);
        int results = this.namedJdbcTemplate.update(sql,source);
        LOG.debug("Updated: {} journals", results);

	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub

	}

	@Override
	public JournalDetail read(String id) {
		String sql = "SELECT * FROM JOURNAL where id = :id";
        Map<String, String> params = ImmutableMap.of("id", id);
        JournalDetail journal = this.namedJdbcTemplate.queryForObject(sql, params, new JournalRowMapper());
        return journal;
	}

}
