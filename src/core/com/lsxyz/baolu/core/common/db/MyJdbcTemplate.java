package com.lsxyz.baolu.core.common.db;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.support.JdbcUtils;

import java.sql.*;
import java.sql.Date;
import java.util.*;


public class MyJdbcTemplate{
	
	private static final Logger log = Logger.getLogger(MyJdbcTemplate.class);
	private Connection con;
	private MyJdbcTemplate() {
	}
	
	public static final MyJdbcTemplate jdbcTemplateInstance = new MyJdbcTemplate();
	
	/**
	 * execute query sql statement
	 * @param sql
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> executeQuery(String sql, final Map<String, String> paramMap) throws Exception {
		return (List<Map<String, Object>>) execute(sql, new MyPreparedStatementCallback() {
			@Override
			public Object doInPreparedStatement(PreparedStatement ps) {
				ResultSet rst = null;
				List<Map<String, Object>> columnVlues = new ArrayList<Map<String,Object>>();
				try {
					rst = ps.executeQuery();
					while (rst.next()) {
						Map<String, Object> columnMap = new HashMap<String, Object>();
						for (Iterator<String> iterator = paramMap.keySet().iterator(); iterator.hasNext();) {
							String key = iterator.next();
							String value = paramMap.get(key);
							Object coumnsValue = null;
							switch (ResultType.valueOf(StringUtils.trim(value).toUpperCase())) {
							
							case GETLONG:
								coumnsValue =rst.getLong(Integer.parseInt(key));
								break;
							case GETSTRING:
								coumnsValue = rst.getString(Integer.parseInt(key));
								break;
							case GETFLOAT:
								coumnsValue = rst.getFloat(Integer.parseInt(key));
								break;
							case GETDOUBLE:
								coumnsValue = rst.getDouble(Integer.parseInt(key));
								break;
							case GETINT:
								coumnsValue = rst.getInt(Integer.parseInt(key));
								break;
							default:
								break;
							}
							
							columnMap.put(key, coumnsValue);
						}
						columnVlues.add(columnMap);
					}
					return columnVlues;
				} catch (Exception e) {
					log.error(e.getMessage(), e);
					JdbcUtils.closeResultSet(rst);
					JdbcUtils.closeStatement(ps);
				} finally {
					JdbcUtils.closeResultSet(rst);
					JdbcUtils.closeStatement(ps);
				}
				return null;
			}
			
		});
	}
	
	/**
	 * execute insert or update sql statement
	 * @param sql
	 * @return
	 * @throws Exception
	 */
	public int insertOrUpdate(String sql, final Map<String, Object[]> paramMap) throws Exception{
		return update(sql, new MyPreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				try {
					for (Iterator<String> iterator = paramMap.keySet().iterator(); iterator.hasNext();) {
						String key = iterator.next();
						Object[] paramValue = paramMap.get(key);
						if (!ArrayUtils.isEmpty(paramValue) && paramValue.length > 1) {
							
							switch (PreparedStatementSetType.valueOf(StringUtils.trim((String) paramValue[0]).toUpperCase())) {
							case SETINT:
								ps.setInt(Integer.parseInt(key), (Integer)paramValue[1]);
								break;
							case SETLONG:
								ps.setLong(Integer.parseInt(key), (Long)paramValue[1]);
								break;
							case SETSTRING:
								ps.setString(Integer.parseInt(key), (String)paramValue[1]);
								break;
							case SETFLOAT:
								ps.setFloat(Integer.parseInt(key), (Float)paramValue[1]);
								break;
							case SETDOUBLE:
								ps.setDouble(Integer.parseInt(key), (Double)paramValue[1]);
								break;
							case SETDATE:
								ps.setDate(Integer.parseInt(key), (Date)paramValue[1]);
								break;
							default:
								break;
							}
						}
					}
				} catch (Exception e) {
					log.error(e.getMessage(), e);
				}
			}
		});
	}
	
	/**
	 * 
	 * @param sql
	 * @return
	 * @throws Exception
	 */
	public int update(String sql) throws Exception{
		return update(sql, null);
	}
	
	/**
	 * execute update sql statement
	 * @param sql
	 * @param pss
	 * @return
	 * @throws Exception
	 */
	public int update(String sql, final MyPreparedStatementSetter pss) throws Exception {

		Integer result = (Integer) execute(sql, new MyPreparedStatementCallback() {
			public Object doInPreparedStatement(PreparedStatement ps) {
				try {
					if (pss != null) {
						pss.setValues(ps);
					}
					int rows = ps.executeUpdate();
					return new Integer(rows);
				}catch(Exception ex){
					JdbcUtils.closeStatement(ps);
					log.error(ex.getMessage(), ex);
				}finally {
					JdbcUtils.closeStatement(ps);
				}
				return null;
			}
		});
		return result.intValue();
	}

	/**
	 * 
	 * @param sql
	 * @param action
	 * @return
	 * @throws Exception
	 */
	public Object execute(String sql, MyPreparedStatementCallback action)	throws Exception {

		PreparedStatement psToUse = null;
		try {
			Connection conToUse = con;
			psToUse =  conToUse.prepareStatement(sql);
			Object result = action.doInPreparedStatement(psToUse);
			return result;
		}
		catch (Exception ex) {
			log.error(ex.getMessage(), ex);
			JdbcUtils.closeStatement(psToUse);
			psToUse = null;
		}
		finally {
			JdbcUtils.closeStatement(psToUse);
		}
		
		return null;
	}
	
	
	/**
	 * 
	 * @param sql
	 * @return
	 * @throws Exception
	 */
	public int executeDelete(String sql) throws Exception {

		Statement psToUse = null;
		try {
			Connection conToUse = con;
			psToUse = conToUse.createStatement();
		    int deleteRows = psToUse.executeUpdate(sql);
			return deleteRows;
		}
		catch (Exception ex) {
			log.error(ex.getMessage(), ex);
			JdbcUtils.closeStatement(psToUse);
			psToUse = null;
			throw new Exception();
		}
		finally {
			JdbcUtils.closeStatement(psToUse);
		}
	}
	
	

	public Object execute(String callString, MyCallableStatementCallback action)
			throws DataAccessException {

		CallableStatement cs = null;
		try {
			cs = con.prepareCall(callString);
			Object result = action.doInCallableStatement(cs);
			return result;
		}
		catch (SQLException ex) {
			log.error(ex.getMessage(), ex);
			JdbcUtils.closeStatement(cs);
			cs = null;
		} finally {
			JdbcUtils.closeStatement(cs);
		}
		
		return null;
	}
	
	public Object jchemProcedureUpdateCall(final String callStr, final Map<String, Object[]> paramMap) throws DataAccessException {
		
		return (Object) execute(callStr, new MyCallableStatementCallback() {
			public Object doInCallableStatement(CallableStatement cs) throws SQLException {
				
				int callbackKey = -1;
				
				//generate param
				for(String paramOne : paramMap.keySet()){
					if(null != paramOne){
						Object[] paramOneValue = paramMap.get(paramOne);
						if(null != paramOneValue && paramOneValue.length == 2){
							String operationStr = (String)paramOneValue[0];
							Object operationValue = paramOneValue[1];
							if(operationStr.equalsIgnoreCase("registerOutParameter")){
								callbackKey = Integer.parseInt(paramOne);
								Object[] operationValueArr = (Object[])operationValue;
								cs.registerOutParameter(callbackKey, (Integer)operationValueArr[0], (String)operationValueArr[1]);
								
							}else{
								if(operationStr.equalsIgnoreCase("setLong")){
									cs.setLong(Integer.parseInt(paramOne), (Long)operationValue);
								}else{
									cs.setString(Integer.parseInt(paramOne), operationValue instanceof Long ? operationValue.toString() :(String)operationValue);
								}					
							}
						}
					}
				}
				
				if(callbackKey < 0 ) return null;
				
				@SuppressWarnings("unused")
				boolean retVal = cs.execute();
				
				List<Long> cd_ids = new ArrayList<Long>();
				Array ids = cs.getArray(callbackKey);
				
				ResultSet resultVal = null;
				
				try{
				
					resultVal = ids.getResultSet();
				
					Long cd_id = null;
					if (resultVal.next()) {
						cd_id = resultVal.getLong(2);
						cd_ids.add(cd_id);
						if (cd_id < 0) {
							return cd_ids;
						}
					}
					
				}catch(Exception ex){
					log.error(ex.getMessage(), ex);
					JdbcUtils.closeStatement(cs);
					JdbcUtils.closeResultSet(resultVal);
					resultVal = null;
					
				}finally{
					JdbcUtils.closeResultSet(resultVal);
					JdbcUtils.closeStatement(cs);
				}
				return cd_ids;
			}
		});
	}

	@SuppressWarnings("unchecked")
    public Object executeStoreProcedure(final String callStr, final Map<String, Object[]> paramMap) throws DataAccessException {
		
		return (Object) execute(callStr, new MyCallableStatementCallback() {
			public Object doInCallableStatement(CallableStatement cs) throws SQLException {
				
				Integer callbackKey = -1;
				//generate param
				for(String paramOne : paramMap.keySet()){
					if(StringUtils.isEmpty(paramOne)) continue;
					
					Object[] paramArray = paramMap.get(paramOne);
					if(paramArray == null || paramArray.length != 2) continue;
					
					ParamType operate = (ParamType)paramArray[0];
					Object operateValue = paramArray[1];
					int orderKey = Integer.parseInt(paramOne);
					if(orderKey == -1) continue;
					
					switch(operate){
						case SETLONG:
							cs.setLong(orderKey, (Long)operateValue);
							break;
						case SETINT:
							cs.setInt(orderKey, (Integer)operateValue);
							break;
						case SETSTRING:
							cs.setString(orderKey, (String)operateValue);
							break;
						case REGISTEROUTPARAMETER:
							Object[] operationValueArr = (Object[])operateValue;
							cs.registerOutParameter(orderKey, Types.INTEGER);
							callbackKey = orderKey;
							break;
					}
				}
				
				boolean retVal = cs.execute();
				if(!retVal){
					return null;
				}
				
				List<Object> results = new ArrayList<Object>();
				Array resultArray = cs.getArray(callbackKey);
				
				ResultSet resultVal = null;
				try{
					resultVal = resultArray.getResultSet();
				
					Object result = null;
					if (resultVal.next()) {
						result = resultVal.getLong(2);
						results.add(result);
					}
					
				}catch(Exception ex){
					log.error(ex.getMessage(), ex);
					JdbcUtils.closeStatement(cs);
					JdbcUtils.closeResultSet(resultVal);
					resultVal = null;
					
				}finally{
					JdbcUtils.closeResultSet(resultVal);
					JdbcUtils.closeStatement(cs);
				}
				return results;
			}
		});
	}

	/**
	 * @return the con
	 */
	public Connection getCon() {
		return con;
	}

	/**
	 * @param con the con to set
	 */
	public void setCon(Connection con) {
		this.con = con;
	}
	
	
	
	
}
