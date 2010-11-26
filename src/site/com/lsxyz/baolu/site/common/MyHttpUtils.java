package com.lsxyz.baolu.site.common;

import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;


public class MyHttpUtils {

	/**
	 * get server response
	 * @param url
	 * @return
	 * @throws IOException
	 */
	public static String getServerResponse(String url) throws IOException {
		if (StringUtils.isBlank(url))
			return null;

		HttpClient httpClient = new DefaultHttpClient();
		HttpPost httpPost = new HttpPost(url);
		HttpResponse httpResponse = httpClient.execute(httpPost);

		HttpEntity httpEntity = httpResponse.getEntity();

		if (null == httpEntity) {
			return null;
		}

		InputStream in = httpEntity.getContent();
		byte[] bs = new byte[1024];
		ByteArrayOutputStream bo = new ByteArrayOutputStream();
		int i = -1;
		while ((i = in.read(bs)) != -1) {
			bo.write(bs, 0, i);
		}
		
		try {
			in.close();
			bo.close();
		} catch (IOException e) {} // should not happen
		
		return bo.toString();
	}
	
}
