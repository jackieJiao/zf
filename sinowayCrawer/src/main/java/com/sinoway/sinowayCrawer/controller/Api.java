package com.sinoway.sinowayCrawer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class Api {
	
	
	@RequestMapping(value="getPage")
	public void getpage(@RequestParam(value = "pageNo") String pageNo,
			@RequestParam(value = "key") String 
			){
		
	}
}
