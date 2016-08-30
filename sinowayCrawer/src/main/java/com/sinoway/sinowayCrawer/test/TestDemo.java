package com.sinoway.sinowayCrawer.test;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import com.sinoway.sinowayCrawer.utils.PageFetcher;

public class TestDemo {
	public static void main(String args[]) throws Exception {
		//String url = "http://localhost:8081/sinowayCrawer/valuesService/values.action";
		String url = "http://localhost:8080/sinowayCrawer/JXLRecallService/recall.action";

		// String
		// content="{\"transactions\":{\"report_time\":\"2016-02-20 04:34:02\",\"update_time\":\"2016-02-26 14:31:00\",\"data_source\":\"yanghangzhengxin\",\"sex\":\"M\",\"birthday\":\"1982XXXX\",\"istrue\":\"1\",\"salary\":\"4000-6000元\",\"job\":\"销售经理\",\"relativephone\":\"1596089XXXX\", \"relativetype\":\"兄弟姐妹\",\"socialphone\":\"1350751XXXX\",\"socialtype\":\"同事\",\"bankcard\":\"137636\",\"childnum\":\"1\",\"jobprovince\":\"福建\",\"jobcity\":\"龙岩\",\"company\":\"福建省龙岩市XX物业管理有限公司\",\"jobphone\":\"0597528XXXX\",\"jobaddress\":\"龙岩市新罗区中山路XX巷XX号XXX室\",\"QQ\":\"84162XXXX\",\"ismarry\":\"已婚\",\"email\":\"84162XXXX@qq.com\",\"education\":\"高中/职高/技校\"},\"wechat\":{\"wid\":\"606360\",\"wcity\":\"龙岩\",\"country\":\"中国\",\"photo\":\"http://wx.qlogo.cn/mmopen/PiajxSqBRaEIqjEaKRe8EscMS2tt8yeBPJPENLob7OCCQu30LpplnBpPyWeHviaj9mk8suSZjApTPnSZqMahib7xg/0\",\"nickname\":\"虎贲\",\"openid\":\"oHGoOs7C12p0xUnScID7Iv62zxfM\",\"wprovince\":\"福建\",\"wistrue\":\"1\"},\"loaninfo\":[{\"loantime\":\"2015-10-21 16:08:28\",\"advancetime\":\"2015-10-22 14:46:39\",\"loadmoney\":\"1000元\",\"loadperiod\":\"14\",\"interest\":\"100元\",\"freeinterest\":\"5元\",\"totalrefund\":\"1095元\",\"bankbinding\":\"建设银行\"}],\"refundinfo\":[{\"refundtime\":\"2015-11-05 08:00:00\",\"refundmoney\":\"1095元\",\"refundstatus\":\"按时还款\",\"refundmethod\":\"第三方支付银行卡代扣\"}],\"phoneinfo\":{\"servicetype\":\"ChinaMobile\",\"phoneid\":\"2909464\",\"homeaddress\":\"福建省龙岩市新罗区龙门XX128-10号\",\"servicename\":\"福建移动\",\"phoneistrue\":\"1\",\"phonename\":\"xx杰\",\"phoneregister\":\"1328178953000\"},\"phonebills\":[{\"pbid\":\"5383567\",\"pbtime\":\"201510\",\"amount\":\"84.52\"},{\"pbid\":\"5383568\",\"pbtime\":\"201508\",\"amount\":\"90.97\"}]}";

		/*String content = "{\"status\": \"success\",\"update_time\": \"2016-03-07 19:38:06\",\"request_args\": [{ \"token\": \"wangchu\"},{ \"env\": \"\"}],\"transactions\": " +
				"[{\"report_time\": \"2016-02-20 04:34:02\"," +
				"\"report_id\": \"2016022303000*********\"," +
				"\"update_time\": \"2016-02-26 14:31:00\"," +
				"\"data_source\": \"yanghangzhengxin\", " +
				"\"credit_record\": " +
				"{\"housing_loan_info\": " +
				"{\"no_overdue_account_detail\": " +
				"[\"2003年2月18日中国建设银行黑龙江省哈尔滨市住房支行发放的80,000元（人民币）个人住房贷款，2006年9月已结清。\",\"2014年3月1日中国工商银行四川省分行营业部发放的440,000元（人民币）个人住房贷款,2034年3月1日到期.截至2016年2月，余额418,710.\"],\"overdue_account_detail\": " +
				"[\"2003年2月18日中国建设银行黑龙江省哈尔滨市住房支行发放的80,000元（人民币）个人住房贷款，2006年9月已结清。\",\"2014年3月1日中国工商银行四川省分行营业部发放的440,000元（人民币）个人住房贷款,2034年3月1日到期.截至2016年2月，余额418,710.\"]," +
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
				"\"request_time\": \"2016-02-19 18:46:06\",\"queried_number\": \"**************5315\",\"queried_papers\": \"身份证\",\"query_marriage\": \"未婚\",\"token\": \"wangchu\",\"queried_name\": \"向**\",\"version\": \"2\"}],\"error_code\": 31200,\"error_msg\": \"请求用户数据成功\"}";*/

		String content = "{\"status\": \"success\",\"update_time\": \"2016-03-07 19:38:06\",\"request_args\": [{ \"token\": \"wangchu\"},{ \"env\": \"\"}],\"transactions\": " +
				"[{\"report_time\": \"2016-02-20 04:34:02\"," +
				"\"report_id\": \"2016022303000*********\"," +
				"\"update_time\": \"2016-02-26 14:31:00\"," +
				"\"data_source\": \"yanghangzhengxin\", " +
				"\"credit_record\": " +
				"{\"housing_loan_info\": " +
				"null," +
				"\"credit_info\": " +
				"{\"no_overdue_account_detail\":" +
				" [\"2014年2月20日中信银行发放的贷记卡（人民币账户）。截至2016年6月，信用额度26,000，已使用额度9,873。\",\"2015年9月10日中国工商银行湖北省分行营业部发放的贷记卡（人民币账户）。截至2016年1月，信用额度500，已使用额度0。\",\"2015年9月10日中国工商银行湖北省分行营业部发放的贷记卡（人民币账户）。截至2016年1月，信用额度500，已使用额度0。\"]," +
				"\"credit_no_overdue_account\": " +
				"[{\"status\": \"\"," +
				"\"overdraft_balance\": null," +
				"\"deadline_time\": \"2015-12-31 16:00:00\"," +
				"\"grant_time\": \"2015-09-09 16:00:00\"," +
				"\"credit_limit\": 485," +
				"\"grant_name\": \"贷记卡\"," +
				"\"grant_account_type\": \"美元账户\"," +
				"\"grant_company\": \"中国工商银行湖北省分行营业部\"," +
				"\"used_quotas\": 9873.0},{\"status\": \"\"," +
				"\"overdraft_balance\": null," +
				"\"deadline_time\": \"2015-12-31 16:00:00\"," +
				"\"grant_time\": \"2015-09-09 16:00:00\"," +
				"\"credit_limit\": 485," +
				"\"grant_name\": \"贷记卡\"," +
				"\"grant_account_type\": \"美元账户\"," +
				"\"grant_company\": \"中国工商银行湖北省分行营业部\"," +
				"\"used_quotas\": 9873.0},{\"status\": \"\"," +
				"\"overdraft_balance\": null," +
				"\"deadline_time\": \"2015-12-31 16:00:00\"," +
				"\"grant_time\": \"2015-09-09 16:00:00\"," +
				"\"credit_limit\": 485," +
				"\"grant_name\": \"贷记卡\"," +
				"\"grant_account_type\": \"美元账户\"," +
				"\"grant_company\": \"中国工商银行湖北省分行营业部\"," +
				"\"used_quotas\": 9873.0}]," +
				"\"credit_overdue_account\":" +
				"[]," +
				"\"overdue_account_detail\": []},"
				+ "\"summarys\":" +
				"null,"
				+ "\"loan_info\":null" +
				"}," +
				"\"query\": null," +
				"\"request_time\": \"2016-02-19 18:46:06\",\"queried_number\": \"**************5315\",\"queried_papers\": \"身份证\",\"query_marriage\": \"未婚\",\"token\": \"wangchu\",\"queried_name\": \"向**\",\"version\": \"2\"}]," +
				"\"error_code\": 31200,\"error_msg\": \"请求用户数据成功\"}";
		
		
		
		/*
		 * String content1= "{\"transactions\": {\"report_time\": \"2016-02-20
		 * 04:34:02\", \"report_id\": \"2016022303000*********\",
		 * \"update_time\": \"2016-02-26 14:31:00\", \"data_source\":
		 * \"yanghangzhengxin\", \"credit_record\": {\"housing_loan_info\":
		 * {\"no_overdue_account_detail\":
		 * [\"2003年2月18日中国建设银行黑龙江省哈尔滨市住房支行发放的80,000元（人民币）个人住房贷款，2006年9月已结清。 \
		 * ",\"2014年3月1日中国工商银行四川省分行营业部发放的440,000元（人民币）个人住房贷款,2034年3月1日到期.截至2016年2月，余额418,710.\"],
		 * 
		 * \"loan_no_overdue_account\": [ { \"deadline_time\": null,
		 * \"grant_amount_type\": \"人民币\", \"clear_time\": \"2006-08-31
		 * 16:00:00\", \"grant_time\": \"2003-02-17 16:00:00\",
		 * \"grant_amount\": 80000, \"grant_name\": \"个人住房贷款\",
		 * \"grant_company\": \"中国建设银行黑龙江省哈尔滨市住房支行\", \"balance \": null,
		 * \"expiration_time\": null } ]
		 * 
		 * 
		 * } } } }";
		 */Map<String, String> params = new HashMap<String, String>();
		params.put("data", content);
		PageFetcher pf = new PageFetcher();
		System.out.println(pf.dopost(url, params));
		/*
		 * "{
		 * 
		 * 
		 * \"transactions\": [ { \"report_time\": \"2016-02-20 04:34:02\",
		 * \"update_time\": \"2016-02-26 14:31:00\", \"data_source\":
		 * \"yanghangzhengxin\", "credit_record": { "housing_loan_info": {
		 * "no_overdue_account_detail": [
		 * "2003年2月18日中国建设银行黑龙江省哈尔滨市住房支行发放的80,000元（人民币）个人住房贷款，2006年9月已结清。",
		 * "2014年3月1日中国工商银行四川省分行营业部发放的440,000元（人民币）个人住房贷款，2034年3月1日到期。截至2016年2月，余额418,710。"
		 * ], "loan_no_overdue_account": [ { "deadline_time": null,
		 * "grant_amount_type": "人民币", "clear_time": "2006-08-31 16:00:00",
		 * "grant_time": "2003-02-17 16:00:00", "grant_amount": 80000,
		 * "grant_name": "个人住房贷款", "grant_company": "中国建设银行黑龙江省哈尔滨市住房支行",
		 * "balance ": null, "expiration_time": null } ],
		 * "overdue_account_detail": [
		 * "2002年4月19日中国银行吉林省分行发放的76,000元（人民币）个人住房贷款，2014年11月已结清。最近5年内有1个月处于逾期状态，没有发生过90天以上逾期。"
		 * ,
		 * "2004年6月28日交通银行青岛分行发放的300,000元（人民币）个人住房贷款，2012年7月已结清。最近5年内有4个月处于逾期状态，没有发生过90天以上逾期。"
		 * ], "loan_overdue_account": [ { "month_of_five_year_90": 0,
		 * "month_of_five_year": 1, "grant_amount_type": "人民币",
		 * "overdue_amount": null, "clear_time": "2014-10-31 16:00:00",
		 * "grant_time": "2002-04-18 16:00:00", "grant_amount": 76000,
		 * "grant_name": "个人住房贷款", "grant_company": "中国银行吉林省分行", "balance ":
		 * null, "expiration_time": null, "deadline_time": null } ] },
		 * "credit_info": { "no_overdue_account_detail": [
		 * "2015年9月10日中国工商银行湖北省分行营业部发放的贷记卡（美元账户）。截至2016年1月,信用额度折合人民币485，已使用额度0。"
		 * , "2015年9月10日中国工商银行湖北省分行营业部发放的贷记卡（人民币账户）。截至2016年1月，信用额度500，已使用额度0。"
		 * ], "credit_no_overdue_account": [ { "status": "",
		 * "overdraft_balance": null, "deadline_time": "2015-12-31 16:00:00",
		 * "grant_time": "2015-09-09 16:00:00", "credit_limit": 485,
		 * "grant_name": "贷记卡", "grant_account_type": "美元账户", "grant_company":
		 * "中国工商银行湖北省分行营业部", "used_quotas": 0 } ], "credit_overdue_account": [ {
		 * "status": "", "month_of_five_year_90": 5, "credit_limit": 2,
		 * "month_of_five_year": 5, "overdue_amount": null,
		 * "grant_account_type": "人民币账户", "grant_name": "贷记卡", "grant_company":
		 * "中国工商银行湖北省分行营业部", "grant_time": "2007-11-19 16:00:00", "used_quotas":
		 * 0, "deadline_time": "2015-12-31 16:00:00" } ],
		 * "overdue_account_detail": [
		 * "2007年11月20日中国工商银行湖北省分行营业部发放的贷记卡（人民币账户）。截至2016年1月，信用额度2，已使用额度0。最近5年内有5个月处于逾期状态，其中5个月逾期超过90天。"
		 * ,
		 * "2015年8月28日中国工商银行长治市分行发放的贷记卡（人民币账户）。截至2016年1月，信用额度1,000，已使用额度1,000。最近5年内有1个月处于逾期状态，没有发生过90天以上逾期。"
		 * ] }, "summarys": [ { "guarantee_number": 0,
		 * "no_settle_account_number": 35, "account_number": 43, "type": "信用卡",
		 * "overdue_account_num": 1, "overdue90_account_num": 1 }, {
		 * "guarantee_number": 0, "no_settle_account_number": 0,
		 * "account_number": 0, "type": "购房贷款", "overdue_account_num": 0,
		 * "overdue90_account_num": 0 }, { "guarantee_number": 0,
		 * "no_settle_account_number": 8, "account_number": 64, "type": "其他贷款",
		 * "overdue_account_num": 2, "overdue90_account_num": 0 } ],
		 * "loan_info": { "no_overdue_account_detail": [
		 * "2016年1月12日浙江网商银行股份有限公司发放的1,779元（人民币）个人经营性贷款，2017年1月12日到期。截至2016年1月，余额1,779。"
		 * ,
		 * "2016年1月22日招联消费金融有限公司发放的1,701元（人民币）个人消费贷款，2017年1月22日到期。截至2016年1月，余额1,701。"
		 * ], "loan_no_overdue_account": [ { "deadline_time":
		 * "2015-12-31 16:00:00", "grant_amount_type": "人民币", "clear_time":
		 * null, "grant_time": "2016-01-11 16:00:00", "grant_amount": 1779,
		 * "grant_name": "个人经营性贷款", "grant_company": "浙江网商银行股份有限公司", "balance ":
		 * 1779, "expiration_time": "2017-01-11 16:00:00" } ],
		 * "overdue_account_detail": [
		 * "2015年9月21日招联消费金融有限公司发放的4,000元（人民币）个人消费贷款，2016年9月21日到期。截至2016年1月，余额2,299。最近5年内有1个月处于逾期状态，没有发生过90天以上逾期。"
		 * ,
		 * "2015年10月21日招联消费金融有限公司发放的900元（人民币）个人消费贷款，2015年12月已结清。最近5年内有1个月处于逾期状态，没有发生过90天以上逾期。"
		 * ], "loan_overdue_account": [ { "month_of_five_year_90": 0,
		 * "month_of_five_year": 1, "grant_amount_type": "人民币",
		 * "overdue_amount": null, "clear_time": null, "grant_time":
		 * "2015-09-20 16:00:00", "grant_amount": 4000, "grant_name": "个人消费贷款",
		 * "grant_company": "招联消费金融有限公司", "balance ": 2299, "expiration_time":
		 * "2016-09-20 16:00:00", "deadline_time": "2015-12-31 16:00:00" } ] }
		 * },
		 * 
		 * 
		 * "report_id": "2016022303000*********" } ],
		 * 
		 * }";
		 */
	}

}
