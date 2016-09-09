package com.sinoway.sinowayCrawer.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mysql.fabric.xmlrpc.base.Array;
import com.sinoway.sinowayCrawer.entity.House_detail;
import com.sinoway.sinowayCrawer.entity.Page;
import com.sinoway.sinowayCrawer.service.ApiService;

@Controller
public class Api {
	@Autowired
	private ApiService apiService;
	
	@RequestMapping(value="getPage")
	public Map<String, Object> getpage(@RequestParam(value = "pageNo") int pageNo,
			@RequestParam(value = "pageSize") int pageSize,
			@RequestParam(value = "condition") int condition
			)
	{
		/*经过条件筛选后的分页数据*/
		Map<String, Object> map = new HashMap<>();
		List<House_detail> list=new ArrayList<>();
		Page page=new Page();
		list=apiService.getpage(page);
		String success="success";
		String errorcode="100";
		
		map.put("data", list);
		map.put("success", success);
		map.put("errorcode", errorcode);
		return map;
	}
}
