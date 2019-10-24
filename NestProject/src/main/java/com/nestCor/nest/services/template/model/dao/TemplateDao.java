package com.nestCor.nest.services.template.model.dao;

import java.util.List;

import com.nestCor.nest.services.template.model.vo.Template;

public interface TemplateDao {
	
	int insertTemplate(Template template);
	
	Template selectOneTemplate(int tno);
	
	int deleteTemplate(int tno);
	
	List<Template> selectListTemplate(int mno);
}
