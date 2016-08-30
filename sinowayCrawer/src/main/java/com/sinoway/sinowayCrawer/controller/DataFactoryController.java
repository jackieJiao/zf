package com.sinoway.sinowayCrawer.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sinoway.sinowayCrawer.entity.ToShow;

@Controller
public class DataFactoryController {
	
	@RequestMapping(value = "getAllMarkers", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getAllMarkers(){
		System.out.println("this is in getall***");
		List<ToShow> list=new ArrayList<>();
		ToShow t1=new ToShow("116.417854", "39.921988", "地址：北京市东城区王府井大街88号乐天银泰百货八层");
		list.add(t1);
		ToShow t2=new ToShow("116.406605", "39.921585", "地址：北京市东城区东华门大街");
		list.add(t2);
		ToShow t3=new ToShow("116.412222", "39.912345", "地址：北京市东城区正义路甲5号");
		list.add(t3);
		
		
		Map<String, Object> map2 = new HashMap<>();
		map2.put("data_info", list);
		return map2;
	}
	
}
