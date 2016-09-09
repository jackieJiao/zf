package com.sinoway.sinowayCrawer.service;

import java.util.List;

import com.sinoway.sinowayCrawer.entity.House_detail;
import com.sinoway.sinowayCrawer.entity.Page;


public interface ApiService {
	
	public List<House_detail> getpage(Page page);
}
