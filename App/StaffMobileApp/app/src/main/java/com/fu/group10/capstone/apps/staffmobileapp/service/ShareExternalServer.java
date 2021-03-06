package com.fu.group10.capstone.apps.staffmobileapp.service;

import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import android.content.Context;import android.util.Config;
import android.util.Log;
import com.fu.group10.capstone.apps.staffmobileapp.Utils.Constants;


public class ShareExternalServer {

	public String shareRegIdWithAppServer(final Context context,
			final String regId, String username) {

		String result = "";
		Map<String, String> paramsMap = new HashMap<String, String>();
		paramsMap.put("regId", regId);
		paramsMap.put("username", username);
		paramsMap.put("shareRegId", "1");
		try {
			URL serverUrl = null;
			try {
				serverUrl = new URL(Constants.APP_SERVER_URL);
			} catch (MalformedURLException e) {
				Log.e("AppUtil", "URL Connection Error: "
						+ Constants.APP_SERVER_URL, e);
				result = "Invalid URL: " + Constants.APP_SERVER_URL;
			}

			StringBuilder postBody = new StringBuilder();
			Iterator<Entry<String, String>> iterator = paramsMap.entrySet()
					.iterator();

			while (iterator.hasNext()) {
				Entry<String, String> param = iterator.next();
				postBody.append(param.getKey()).append('=')
						.append(param.getValue());
				if (iterator.hasNext()) {
					postBody.append('&');
				}
			}
			String body = postBody.toString();
			byte[] bytes = body.getBytes();
			HttpURLConnection httpCon = null;
			try {
				httpCon = (HttpURLConnection) serverUrl.openConnection();
				httpCon.setDoOutput(true);
				httpCon.setUseCaches(false);
				httpCon.setFixedLengthStreamingMode(bytes.length);
				httpCon.setRequestMethod("POST");
				httpCon.setRequestProperty("Content-Type",
						"application/x-www-form-urlencoded;charset=UTF-8");
				OutputStream out = httpCon.getOutputStream();
				out.write(bytes);
				out.close();

				int status = httpCon.getResponseCode();
				if (status == 200) {
					result = "RegId shared with Application Server. RegId: "
							+ regId;
				} else {
					result = "Post Failure." + " Status: " + status;
				}
			} finally {
				if (httpCon != null) {
					httpCon.disconnect();
				}
			}

		} catch (IOException e) {
			result = "Post Failure. Error in sharing with App Server.";
			Log.e("AppUtil", "Error in sharing with App Server: " + e);
		}
		return result;
	}
}
