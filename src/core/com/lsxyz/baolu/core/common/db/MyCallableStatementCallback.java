package com.lsxyz.baolu.core.common.db;

import org.springframework.dao.DataAccessException;

import java.sql.CallableStatement;
import java.sql.SQLException;

public interface MyCallableStatementCallback {
	Object doInCallableStatement(CallableStatement cs) throws SQLException, DataAccessException;
}
