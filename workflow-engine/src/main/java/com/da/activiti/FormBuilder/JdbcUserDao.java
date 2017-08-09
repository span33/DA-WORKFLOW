package com.da.activiti.FormBuilder;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.da.activiti.dao.BaseDao;
import com.da.activiti.model.UserForm;
import com.da.activiti.web.PagingCriteria;

@Repository
@Component("userDao")
public class JdbcUserDao extends BaseDao implements UserDao {
	private static final Logger LOG = LoggerFactory.getLogger(JdbcUserDao.class);

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<UserForm> readAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<UserForm> readPage(PagingCriteria criteria) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String create(UserForm obj) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void createWithId(UserForm obj) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(UserForm obj) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public UserForm read(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Map<String, Object>> getUserByDepartMentId(String departments) {
		String [] data = departments.split(",");
		List<String> parameters = new ArrayList<String> () ;
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT distinct ID_ FROM act_id_user where department_id in(");
		
		for(String ldata  :data ) {
			sb.append("?,");
			parameters.add(ldata);
		}
		sb.setLength(sb.length() - 1);
		sb.append(")");
		return executeDynamicNativeQueryWithInParameter(sb.toString(),parameters);
	}

	

}
