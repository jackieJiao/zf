package com.sinoway.sinowayCrawer.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import freemarker.core.ParseException;
import freemarker.template.Configuration;
import freemarker.template.MalformedTemplateNameException;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateNotFoundException;
/*
 * 此对象负责处理word模板
 */
public class ProcessT2 {
	//模板对象
	private Configuration cfg;
	public void init() throws IOException{
		cfg=new Configuration();
		cfg.setClassForTemplateLoading(this.getClass(), "/");
		cfg.setDefaultEncoding("utf-8");
	}
	public void process(Map<String, Object> dataMap,HttpServletRequest req) throws TemplateNotFoundException, MalformedTemplateNameException, ParseException, IOException{
		Template t=cfg.getTemplate("testone.ftl","UTF-8");
		try {
			 /* 生成输出到控制台 */  
	        /*Writer out = new OutputStreamWriter(System.out);  
	        t.process(dataMap, out);  
	        out.flush();  */
	  
	        /* 生成输出到文件 */  
	        File fileDir =  new File(req.getServletContext().getRealPath("/")+"WEB-INF/classes/demo1.xml");
	        OutputStreamWriter out = new OutputStreamWriter(new FileOutputStream(fileDir),"UTF-8");  
            t.process(dataMap, out);
            out.flush(); 
            out.close(); 
		} catch (TemplateException e) {
			e.printStackTrace();
		}
	}
}
