package com.lsxyz.baolu.core.common.db;

import java.sql.PreparedStatement;

public interface MyPreparedStatementCallback {
	Object doInPreparedStatement(PreparedStatement ps);
}
