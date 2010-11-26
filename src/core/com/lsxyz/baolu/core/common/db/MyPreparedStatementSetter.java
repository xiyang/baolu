package com.lsxyz.baolu.core.common.db;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public interface MyPreparedStatementSetter {
	void setValues(PreparedStatement ps) throws SQLException;
}
