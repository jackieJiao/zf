package com.sinoway.sinowayCrawer.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	protected static Logger logger=Logger.getLogger("controller");
	@RequestMapping(value = "/bmap", method = RequestMethod.GET)
	public String bmap(){
		logger.debug("Received request to show common page");
		return "baiduMaptest";  
	}
	@RequestMapping(value = "/index")
	public String getCommonPage(){
		logger.debug("Received request to show common page");
		return "indexPage";  
	}
	
	@RequestMapping(value = "/searchList", method = RequestMethod.GET)
	public String searchList(){
		logger.debug("Received request to show common page");
		return "searchList";  
	}
	@RequestMapping(value = "/searchMap", method = RequestMethod.GET)
	public String searchMap(){
		logger.debug("Received request to show common page");
		return "searchMap";  
	}
	@RequestMapping(value = "/show", method = RequestMethod.GET)
	public String show(){
		logger.debug("Received request to show common page");
		return "show";  
	}
	
}
