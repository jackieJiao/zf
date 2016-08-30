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

public class TestRecall {
	public static void main(String args[]) throws Exception {
		String url = "http://218.241.151.82:8097/sinowayCrawer/JXLRecallService/recall.action";
		/*String content = "{\"status\": \"success\",\"update_time\": \"2016-03-07 19:38:06\",\"request_args\": [{ \"token\": \"wangchu\"},{ \"env\": \"\"}],\"transactions\": " +
				"[{\"report_time\": \"2016-02-20 04:34:02\"," +
				"\"report_id\": \"2016022303000*********\"," +
				"\"update_time\": \"2016-02-26 14:31:00\"," +
				"\"data_source\": \"yanghangzhengxin\", " +
				"\"credit_record\": " +
				"{\"housing_loan_info\": " +
				"{\"no_overdue_account_detail\": " +
				"[\"2003年2月18日中国建设银行黑龙江省哈尔滨市住房支行发放的80,000元（人民币）个人住房贷款，2006年9月已结清。\",\"2014年3月1日中国工商银行四川省分行营业部发放的440,000元（人民币）个人住房贷款,2034年3月1日到期.截至2016年2月，余额418,710.\"],\"overdue_account_detail\": " +
				"[\"2003年3月18日中国建设银行黑龙江省哈尔滨市住房支行发放的80,000元（人民币）个人住房贷款，2006年9月已结清。\",\"2014年4月1日中国工商银行四川省分行营业部发放的440,000元（人民币）个人住房贷款,2034年3月1日到期.截至2016年2月，余额418,710.\"]," +
				"\"loan_no_overdue_account\":" +
				"[{\"deadline_time\": null," +
				"\"grant_amount_type\": \"人民币\", " +
				"\"clear_time\": \"2006-08-31 16:00:00\"," +
				"\"grant_time\": \"2003-02-17 16:00:00\"," +
				"\"grant_amount\": 80000," +
				"\"grant_name\": \"个人住房贷款\"," +
				"\"grant_company\": \"中国建设银行黑龙江省哈尔滨市住房支行\", " +
				"\"balance \": null,\"expiration_time\": null}]," +
				"\"loan_overdue_account\": " +
				"[{\"month_of_five_year_90\": 0," +
				"\"month_of_five_year\": 1," +
				"\"grant_amount_type\": \"人民币\"," +
				"\"overdue_amount\": null," +
				"\"clear_time\": \"2014-10-31 16:00:00\"," +
				"\"grant_time\": \"2002-04-18 16:00:00\"," +
				"\"grant_amount\": 76000," +
				"\"grant_name\": \"个人住房贷款\"," +
				"\"grant_company\": \"中国银行吉林省分行\"," +
				"\"balance \": null," +
				"\"expiration_time\": null,\"deadline_time\": null}]}," +
				"\"credit_info\": " +
				"{\"no_overdue_account_detail\":" +
				" [\"2015年9月10日中国工商银行湖北省分行营业部发放的贷记卡（美元账户）。截至2016年1月,信用额度折合人民币485，已使用额度0。\",\"2015年9月10日中国工商银行湖北省分行营业部发放的贷记卡（人民币账户）。截至2016年1月，信用额度500，已使用额度0。\"]," +
				"\"credit_no_overdue_account\": " +
				"[{\"status\": \"\"," +
				"\"overdraft_balance\": null," +
				"\"deadline_time\": \"2015-12-31 16:00:00\"," +
				"\"grant_time\": \"2015-09-09 16:00:00\"," +
				"\"credit_limit\": 485," +
				"\"grant_name\": \"贷记卡\"," +
				"\"grant_account_type\": \"美元账户\"," +
				"\"grant_company\": \"中国工商银行湖北省分行营业部\"," +
				"\"used_quotas\": 0}]," +
				"\"credit_overdue_account\":" +
				"[{\"status\": \"\"," +
				"\"month_of_five_year_90\": 5," +
				"\"credit_limit\": 2," +
				"\"month_of_five_year\": 5," +
				"\"overdue_amount\": null," +
				"\"grant_account_type\": \"人民币账户\"," +
				"\"grant_name\": \"贷记卡\"," +
				"\"grant_company\": \"中国工商银行湖北省分行营业部\"," +
				"\"grant_time\": \"2007-11-19 16:00:00\"," +
				"\"used_quotas\": 0,\"deadline_time\": \"2015-12-31 16:00:00\"}]," +
				"\"overdue_account_detail\": [\"2007年11月20日中国工商银行湖北省分行营业部发放的贷记卡（人民币账户）。截至2016年1月，信用额度2，已使用额度0。最近5年内有5个月处于逾期状态，其中5个月逾期超过90天。\",\"2015年8月28日中国工商银行长治市分行发放的贷记卡（人民币账户）。截至2016年1月，信用额度1,000，已使用额度1,000。最近5年内有1个月处于逾期状态，没有发生过90天以上逾期。\"" +
				"]},"
				+ "\"summarys\":" +
				"[{\"guarantee_number\":0,\"no_settle_account_number\":35," +
				"\"account_number\":43,\"type\":\"信用卡\",\"overdue_account_num\":1," +
				"\"overdue90_account_num\":1}," +
				"{\"guarantee_number\":0,\"no_settle_account_number\": 0," +
				"\"account_number\": 0," +
				"\"type\": \"购房贷款\",\"overdue_account_num\": 0,\"overdue90_account_num\": 0}],"
				+ "\"loan_info\":" +
				"{\"no_overdue_account_detail\":" +
				" [\"2016年1月12日浙江网商银行股份有限公司发放的1,779元（人民币）个人经营性贷款，2017年1月12日到期。截至2016年1月，余额1,779。\",\"2016年1月22日招联消费金融有限公司发放的1,701元（人民币）个人消费贷款，2017年1月22日到期。截至2016年1月，余额1,701。\"],"
				+ "\"loan_no_overdue_account\": " +
				"[{\"deadline_time\": \"2015-12-31 16:00:00\"," +
				"\"grant_amount_type\": \"人民币\"," +
				"\"clear_time\": null," +
				"\"grant_time\": \"2016-01-11 16:00:00\"," +
				"\"grant_amount\": 1779,\"grant_name\": \"个人经营性贷款\"," +
				"\"grant_company\": \"浙江网商银行股份有限公司\",\"balance\": 1779," +
				"\"expiration_time\": \"2017-01-11 16:00:00\"}]," +
				"\"overdue_account_detail\": [\"2015年9月21日招联消费金融有限公司发放的4,000元（人民币）个人消费贷款，2016年9月21日到期。截至2016年1月，余额2,299。最近5年内有1个月处于逾期状态，没有发生过90天以上逾期。\",\"2015年10月21日招联消费金融有限公司发放的900元（人民币）个人消费贷款，2015年12月已结清。最近5年内有1个月处于逾期状态，没有发生过90天以上逾期。\"]," +
				"\"loan_overdue_account\": " +
				"[{\"month_of_five_year_90\": 0,\"month_of_five_year\": 1,\"grant_amount_type\":"
				+ " \"人民币\",\"overdue_amount\": null," +
				"\"clear_time\": null,\"grant_time\": \"2015-09-20 16:00:00\"," +
				"\"grant_amount\": 4000,\"grant_name\": \"个人消费贷款\"," +
				"\"grant_company\": \"招联消费金融有限公司\"," +
				"\"balance \": 2299,\"expiration_time\": \"2016-09-20 16:00:00\"," +
				"\"deadline_time\": \"2015-12-31 16:00:00\"}]}}," +
				"\"query\": { \"personal_query_details\": [{\"query_time\": \"2016-02-13 16:00:00\",\"query_reason\": \"本人查询(互联网个人信用信息服务平台)\",\"query_operator\": \"本人\"},{ \"query_time\": \"2016-01-26 16:00:00\",\"query_reason\": \"本人查询(互联网个人信用信息服务平台)\",\"query_operator\": \"本人\"}]," +
				" \"institution_query_details\": [{\"query_time\": \"2016-02-19 16:00:00\",\"query_reason\": \"贷款审批\", \"query_operator\": \"深圳市中兴小额贷款有限公司cxy_05\"},{\"query_time\": \"2016-02-13 16:00:00\",\"query_reason\": \"贷款审批\",\"query_operator\": \"北银消费金融有限公司\byxf_ggcx1\"}]}," +
				"\"request_time\": \"2016-02-19 18:46:06\",\"queried_number\": \"**************5315\",\"queried_papers\": \"身份证\",\"query_marriage\": \"未婚\",\"token\": \"wangchu\",\"queried_name\": \"向**\",\"version\": \"2\"}],\"error_code\": 31200,\"error_msg\": \"请求用户数据成功\"}";
	*/	String content2 = "{\"data_info\":{\"transactions\":[{\"report_time\":\"2016-05-03 17:46:00\",\"update_time\":\"2016-05-06 09:05:59\",\"data_source\":\"yanghangzhengxin\",\"credit_record\":{\"credit_info\":{\"no_overdue_account_detail\":[\"2014年9月5日中国工商银行北京市分行发放的贷记卡（人民币账户）。截至2016年4月，信用额度600，已使用额度0。\",\"2013年11月19日平安银行信用卡中心发放的贷记卡（美元账户）。截至2016年4月,信用额度折合人民币40,000，已使用额度0。\",\"2013年11月19日平安银行信用卡中心发放的贷记卡（人民币账户）。截至2016年4月，信用额度40,000，已使用额度0。\",\"2013年7月5日中国工商银行北京市分行发放的贷记卡（人民币账户）。截至2016年4月，信用额度600，已使用额度0。\",\"2013年3月15日中信银行发放的贷记卡（人民币账户）。截至2016年4月，信用额度84,000，已使用额度16,443。\",\"2013年3月15日中信银行发放的贷记卡（美元账户）。截至2016年4月,信用额度折合人民币83,955，已使用额度0。\",\"2007年11月8日招商银行发放的贷记卡（人民币账户）。截至2016年4月，信用额度36,000，已使用额度0。\",\"2007年11月8日招商银行发放的贷记卡（美元账户）。截至2016年4月,信用额度折合人民币36,000，已使用额度0。\",\"2014年7月7日中国民生银行发放的贷记卡（人民币账户）。截至2016年4月，信用额度1，尚未激活。\",\"2012年7月10日华夏银行发放的贷记卡（人民币账户）。截至2016年4月，信用额度40,000，尚未激活。\"],\"credit_no_overdue_account\":[{\"status\":\"\",\"deadline_time\":\"2016-04-01 00:00:00\",\"grant_time\":\"2014-09-05 00:00:00\",\"credit_limit\":600.0,\"grant_name\":\"贷记卡\",\"grant_account_type\":\"人民币账户\",\"grant_company\":\"中国工商银行北京市分行\",\"used_quotas\":0.0},{\"status\":\"\",\"deadline_time\":\"2016-04-01 00:00:00\",\"grant_time\":\"2013-11-19 00:00:00\",\"credit_limit\":40000.0,\"grant_name\":\"贷记卡\",\"grant_account_type\":\"美元账户\",\"grant_company\":\"平安银行信用卡中心\",\"used_quotas\":0.0},{\"status\":\"\",\"deadline_time\":\"2016-04-01 00:00:00\",\"grant_time\":\"2013-11-19 00:00:00\",\"credit_limit\":40000.0,\"grant_name\":\"贷记卡\",\"grant_account_type\":\"人民币账户\",\"grant_company\":\"平安银行信用卡中心\",\"used_quotas\":0.0},{\"status\":\"\",\"deadline_time\":\"2016-04-01 00:00:00\",\"grant_time\":\"2013-07-05 00:00:00\",\"credit_limit\":600.0,\"grant_name\":\"贷记卡\",\"grant_account_type\":\"人民币账户\",\"grant_company\":\"中国工商银行北京市分行\",\"used_quotas\":0.0},{\"status\":\"\",\"deadline_time\":\"2016-04-01 00:00:00\",\"grant_time\":\"2013-03-15 00:00:00\",\"credit_limit\":84000.0,\"grant_name\":\"贷记卡\",\"grant_account_type\":\"人民币账户\",\"grant_company\":\"中信银行\",\"used_quotas\":16443.0},{\"status\":\"\",\"deadline_time\":\"2016-04-01 00:00:00\",\"grant_time\":\"2013-03-15 00:00:00\",\"credit_limit\":83955.0,\"grant_name\":\"贷记卡\",\"grant_account_type\":\"美元账户\",\"grant_company\":\"中信银行\",\"used_quotas\":0.0},{\"status\":\"\",\"deadline_time\":\"2016-04-01 00:00:00\",\"grant_time\":\"2007-11-08 00:00:00\",\"credit_limit\":36000.0,\"grant_name\":\"贷记卡\",\"grant_account_type\":\"人民币账户\",\"grant_company\":\"招商银行\",\"used_quotas\":0.0},{\"status\":\"\",\"deadline_time\":\"2016-04-01 00:00:00\",\"grant_time\":\"2007-11-08 00:00:00\",\"credit_limit\":36000.0,\"grant_name\":\"贷记卡\",\"grant_account_type\":\"美元账户\",\"grant_company\":\"招商银行\",\"used_quotas\":0.0},{\"status\":\"尚未激活\",\"deadline_time\":\"2016-04-01 00:00:00\",\"grant_time\":\"2014-07-07 00:00:00\",\"credit_limit\":1.0,\"grant_name\":\"贷记卡\",\"grant_account_type\":\"人民币账户\",\"grant_company\":\"中国民生银行\"},{\"status\":\"尚未激活\",\"deadline_time\":\"2016-04-01 00:00:00\",\"grant_time\":\"2012-07-10 00:00:00\",\"credit_limit\":40000.0,\"grant_name\":\"贷记卡\",\"grant_account_type\":\"人民币账户\",\"grant_company\":\"华夏银行\"}],\"credit_overdue_account\":[],\"overdue_account_detail\":[]},\"summarys\":[{\"guarantee_number\":0,\"no_settle_account_number\":10,\"account_number\":10,\"type\":\"信用卡\",\"overdue_account_num\":0,\"overdue90_account_num\":0},{\"guarantee_number\":0,\"no_settle_account_number\":0,\"account_number\":0,\"type\":\"购房贷款\",\"overdue_account_num\":0,\"overdue90_account_num\":0},{\"guarantee_number\":0,\"no_settle_account_number\":0,\"account_number\":0,\"type\":\"其他贷款\",\"overdue_account_num\":0,\"overdue90_account_num\":0}]},\"request_time\":\"2016-05-03 14:45:15\",\"queried_number\":\"**************4213\",\"queried_papers\":\"身份证\",\"query_marriage\":\"已婚\",\"token\":\"eab51a33fcb34de99fc9cffc42a98f77\",\"queried_name\":\"王炜\",\"version\":\"2\",\"query\":{\"personal_query_details\":[{\"query_time\":\"2016-04-15 00:00:00\",\"query_reason\":\"本人查询(互联网个人信用信息服务平台)\",\"query_operator\":\"本人\"}],\"institution_query_details\":[{\"query_time\":\"2016-03-09 00:00:00\",\"query_reason\":\"贷后管理\",\"query_operator\":\"平安银行信用卡中心/XIONGNIANB*NG*18\"},{\"query_time\":\"2015-12-02 00:00:00\",\"query_reason\":\"贷后管理\",\"query_operator\":\"招商银行/CMBUS*R0*4\"},{\"query_time\":\"2015-11-17 00:00:00\",\"query_reason\":\"贷后管理\",\"query_operator\":\"平安银行信用卡中心/*IONGNIA*BING618\"},{\"query_time\":\"2015-05-19 00:00:00\",\"query_reason\":\"贷款审批\",\"query_operator\":\"中国民生银行/ms*h00*4\"},{\"query_time\":\"2014-08-30 00:00:00\",\"query_reason\":\"信用卡审批\",\"query_operator\":\"中国工商银行/ic*c-sun*ian\"},{\"query_time\":\"2014-05-28 00:00:00\",\"query_reason\":\"信用卡审批\",\"query_operator\":\"中国民生银行信用卡中心/ms*h*x1\"}]},\"report_id\":\"2016050603000211566603\"}]},\"uid\":\"\",\"sub_type\":\"credit\",\"phone\":\"13901006568\",\"idcard\":\"110108197910134213\",\"name\":\"王炜\",\"type\":\"raw_data_tokenLvl\"}";
       
		Map<String, String> params = new HashMap<String, String>();
		params.put("data", content2);
		PageFetcher pf = new PageFetcher();
		System.out.println(pf.dopost(url, params));
	}
}
