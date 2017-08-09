package JdbcWorkFlowDao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.lang3.StringUtils;
import org.springframework.jdbc.core.RowMapper;

import com.da.activiti.model.WorkFlowBean;
import com.da.activiti.model.document.DocState;

public class WorkFlowRowMapper implements RowMapper<WorkFlowBean> {

	@Override
	public WorkFlowBean mapRow(ResultSet rs, int arg1) throws SQLException {
			WorkFlowBean  workFlowBean =  new WorkFlowBean();
			int id = rs.getInt("id");
	        String docType = StringUtils.trim(rs.getString("doc_type"));
	        String processUerformId = StringUtils.trim(rs.getString("process_userform_id"));
	        String docState = StringUtils.trim(rs.getString("DOC_STATE"));
	        String createdBy = StringUtils.trim(rs.getString("created_by"));
	        String group = StringUtils.trim(rs.getString("GROUP_ID"));
	        workFlowBean.setId(Integer.toString(id));
	        workFlowBean.setDocType(docType);
	        workFlowBean.setDocState(DocState.getDocStateByName(docState));
	        workFlowBean.setCreatedBy(createdBy);
	        workFlowBean.setUserProcessFormId(processUerformId);
	        workFlowBean.setAuthor(createdBy);
	        workFlowBean.setGroupId(group);
	        return workFlowBean ;
	}
	

}
