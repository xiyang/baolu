package com.lsxyz.baolu.site.common;

import org.apache.log4j.Logger;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class ConfigurationHelper {
	
	private static Logger logger = Logger.getLogger(ConfigurationHelper.class);
	private static final String CONFIGURATION_FILE = "/config/jdbc.properties";
	private static final String CONFIGURATION_COMMON_FILE = "/config/common.properties";

	// initializing block for load configuration file
	static {
		InputStream is = ConfigurationHelper.class.getClassLoader().getResourceAsStream(CONFIGURATION_FILE);
		InputStream commonInputStream = ConfigurationHelper.class.getClassLoader().getResourceAsStream(CONFIGURATION_COMMON_FILE);
		if (is == null) {
			throw new RuntimeException("Cannot find Configuration file" + ConfigurationHelper.CONFIGURATION_FILE);
		}

		Properties properties = new Properties();
		Properties commonProperties = new Properties();
		Properties emailFromProperties = new Properties();
		Properties posterMailToProperties = new Properties();
		Properties reviewMailToProperties = new Properties();
		Properties payMailToProperties = new Properties();
		Properties payEURMailToProperties = new Properties();
		try {
			properties.load(is);
			commonProperties.load(commonInputStream);

		} catch (IOException e) {
			logger.error("Read configuration file " + ConfigurationHelper.CONFIGURATION_FILE, e);
			throw new RuntimeException("Read configuration file " + ConfigurationHelper.CONFIGURATION_FILE, e);
		}
	}

}
