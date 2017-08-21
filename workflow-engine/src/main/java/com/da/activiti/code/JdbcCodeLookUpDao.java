package com.da.activiti.code;

import java.sql.Types;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.da.activiti.dao.BaseDao;
import com.da.activiti.document.CodeLookUpRowMapper;
import com.da.activiti.exception.BusinessException;
import com.da.activiti.model.CodeLookUp;
import com.da.activiti.web.PagingCriteria;
import com.google.common.collect.ImmutableMap;

@Repository
@Component("codeLookUpDao")
public class JdbcCodeLookUpDao extends BaseDao implements CodeLookUpDao {
	private static final Logger LOG = LoggerFactory.getLogger(JdbcCodeLookUpDao.class);

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CodeLookUp> readAll() {
		String sql = "SELECT * FROM codelookup ORDER BY dt_created ASC";
		List<CodeLookUp> codeList = this.namedJdbcTemplate.query(sql, new CodeLookUpRowMapper());
		LOG.debug("got all codeList reports: {}", codeList.size());
		return codeList;
	}

	@Override
	public List<CodeLookUp> readPage(PagingCriteria criteria) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String create(CodeLookUp obj) throws BusinessException {
		String sql = "INSERT INTO codelookup (Code_type, Key_Code,Key_Value) "
				+ "VALUES (:codeType, :keyCode,:keyValue)";
		KeyHolder keyHolder = new GeneratedKeyHolder();
		BeanPropertySqlParameterSource source = new BeanPropertySqlParameterSource(obj);
		this.namedJdbcTemplate.update(sql, source, keyHolder);
		return Long.toString(keyHolder.getKey().longValue());
	}

	@Override
	public void createWithId(CodeLookUp obj) {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(CodeLookUp obj) {
		String sql = "UPDATE  CODELOOKUP  SET Code_type =:codeType, Key_Code =:keyCode,Key_Value =:keyValue where id =:id " ;
		BeanPropertySqlParameterSource source = new BeanPropertySqlParameterSource(obj);
		this.namedJdbcTemplate.update(sql, source);
	}

	@Override
	public void delete(String id) {
		String sql = "DELETE FROM codelookup WHERE id = :id";
		Map<String, String> params = ImmutableMap.of("id", id);
		int deleted = this.namedJdbcTemplate.update(sql, params);
		LOG.debug("Deleted: {} Process", deleted);

	}

	@Override
	public CodeLookUp read(String id) {
		// TODO Auto-generated method stub
		return null;
	}

}
