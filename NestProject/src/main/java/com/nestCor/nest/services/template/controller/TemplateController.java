package com.nestCor.nest.services.template.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.nestCor.nest.services.template.model.service.TemplateService;
import com.nestCor.nest.services.template.model.vo.Template;

@Controller
public class TemplateController {
	
	@Autowired
	TemplateService templateService;
	
	@RequestMapping("/template/Tselect.do")
	@ResponseBody
	public Template selectOneTemplate(@RequestParam("tno") int tno) {
		
		System.out.println(tno);
		Template tp = templateService.selectOneTemplate(tno);
		
		System.out.println(tp);
		
		return tp;
	}
	
	@RequestMapping("/template/Tinsert.do")
	@ResponseBody
	public HashMap<String,Object> insertTemplate(@RequestParam("ttitle") String ttitle, @RequestParam("tcontent") String tcontent,
			@RequestParam("mno") int mno) {
		
		HashMap<String,Object> hmap = new HashMap<>();

		Template tp = new Template();
		
		tp.setTtitle(ttitle);
		tp.setTcontent(tcontent);
		tp.setMno(mno);
		
		int result = templateService.insertTemplate(tp);
		
		boolean tf = false;
		
		if(result>0) tf = true;
		
		hmap.put("tf", tf);
		
		return hmap;
	}
	
	@RequestMapping("/template/TselectList.do")
	@ResponseBody
	public HashMap<String,Object> selectListTemplate(@RequestParam("mno") int mno,Model model) {
		
		HashMap<String,Object> hmap = new HashMap<>();

		
		
		List<Template> result = templateService.selectListTemplate(mno);
		
		System.out.println(result.get(0));
		
		boolean tf = true;
		
		model.addAttribute("tlist",result);
		
		hmap.put("tf", tf);
		
		return hmap;
	}
	
	
	
	
}
