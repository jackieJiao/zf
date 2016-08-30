package com.sinoway.sinowayCrawer.test;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.HashMap;
import java.util.Map;

import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLException;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.ParseException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.ssl.SSLSocketFactory;
import org.apache.http.conn.ssl.X509HostnameVerifier;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicHeader;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.sinoway.sinowayCrawer.utils.PageFetcher;

public class TestStartCommit {
	public static void main(String args[]) throws Exception {
		String url = "http://localhost:8080/sinowayCrawer/JXLRecallService/startCommit.action";
		/*13823567153yangzemiao1112		13823567153			2016-06-21 17:07:32	n8pc8q			549977633@qq.com
		18650192539yishabai			yishabai		2016-06-20 11:20:57	insbvb		18650192539	yisha.bai@yahoo.com
*/
		
		String json =
				"{" +
			      "\"name\": \"段博卿\"," +
				  "\"cell_phone_num\": \"15901574763\"," +
				  "\"id_card_num\": \"110101199204222050\", " +
				  "\"account\": \"15901574763\"," +
				  "\"password\": \"Bravo2016!!\"," +
				  "\"captcha\": \"fuk3yb\"" +
				"}";
		System.out.println(json);
		Gson gson = new Gson();
		JsonObject obj = gson.fromJson(json, JsonObject.class);
		Map<String, String> params = new HashMap<String, String>();
		params.put("data", json);
		PageFetcher pf = new PageFetcher();
		System.out.println(pf.dopost(url, params));
	}
}
