package com.nestCor.nest.services.template.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.nestCor.nest.services.template.model.dao.TemplateDao;
import com.nestCor.nest.services.template.model.vo.Template;

@Service
public class TemplateServiceImpl implements TemplateService {
	
	@Autowired
	TemplateDao templateDao;
	
	@Override
	public int insertTemplate(Template template) {
		
		return templateDao.insertTemplate(template);
	}

	@Override
	public Template selectOneTemplate(int tno) {
		
		return templateDao.selectOneTemplate(tno);
	}

	@Override
	public int deleteTemplate(int tno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Template> selectListTemplate(int mno) {
		return templateDao.selectListTemplate(mno);
	}
	
}
