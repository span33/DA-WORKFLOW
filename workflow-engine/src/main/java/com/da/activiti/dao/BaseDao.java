package com.da.activiti.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

public abstract class BaseDao {

	protected DataSource ds;
	protected NamedParameterJdbcTemplate namedJdbcTemplate;

	public DataSource getDataSource() {
		return this.ds;
	}

	@Autowired
	@Qualifier("dataSource")
	public void setDataSource(DataSource datasource) {
		this.ds = datasource;
		this.namedJdbcTemplate = new NamedParameterJdbcTemplate(this.ds);
	}

	public List<Map<String, Object>> executeDynamicNativeQuery(String sqlQuery) {
		List<Map<String, Object>> rows = new ArrayList<Map<String, Object>>();
		ResultSet rs = null;
		Connection con = null;
		try {
			con = ds.getConnection();
			rs = con.prepareStatement(sqlQuery).executeQuery();
			// ResultSetMetaData resultSetMetaData1 = rs.getMetaData();
			ResultSetMetaData resultSetMetaData = rs.getMetaData();
			// String name = resultSetMetaData.getColumnLabel(0);
			int colCount = rs.getMetaData().getColumnCount();
			Map<String, Object> rowUi = new LinkedHashMap<>();

			for (int index = 1; index <= colCount; index++) {
				rowUi.put("key" + index, resultSetMetaData.getColumnLabel(index));
			}
			rows.add(rowUi);

			while (rs.next()) {
				Map<String, Object> row = new LinkedHashMap<>();
				for (int index = 1; index <= colCount; index++) {
					row.put(resultSetMetaData.getColumnLabel(index), rs.getObject(index));
				}

				rows.add(row);
			}
			rs.close();
			con.close();
			rs = null;
			con = null;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		return rows;
	}

	public List<Map<String, Object>> executeDynamicNativeQueryWithParameter(String sqlQuery,
			Map<String, Object> parameters) {
		List<Map<String, Object>> rows = new ArrayList<Map<String, Object>>();
		ResultSet rs = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sqlQuery);
			if (!parameters.isEmpty()) {
				int counter = 0;
				for (Map.Entry<String, Object> entry : parameters.entrySet())
				{
					counter++;
					pstmt.setObject(counter, entry.getValue());
		
				}
			}
			rs = pstmt.executeQuery() ;
			// ResultSetMetaData resultSetMetaData1 = rs.getMetaData();
			ResultSetMetaData resultSetMetaData = rs.getMetaData();
			// String name = resultSetMetaData.getColumnLabel(0);
			int colCount = rs.getMetaData().getColumnCount();
			Map<String, Object> rowUi = new LinkedHashMap<>();

			for (int index = 1; index <= colCount; index++) {
				rowUi.put("key" + index, resultSetMetaData.getColumnLabel(index));
			}
			rows.add(rowUi);

			while (rs.next()) {
				Map<String, Object> row = new LinkedHashMap<>();
				for (int index = 1; index <= colCount; index++) {
					row.put(resultSetMetaData.getColumnLabel(index), rs.getObject(index));
				}

				rows.add(row);
			}
			rs.close();
			pstmt.close();
			con.close();
			rs = null;
			pstmt =null;
			con = null;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		return rows;
	}

}
