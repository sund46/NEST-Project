package com.nestCor.nest.services.template.model.service;


import java.util.List;

import com.nestCor.nest.services.template.model.vo.Template;

public interface TemplateService {
	
	int insertTemplate(Template template);
	
	Template selectOneTemplate(int tno);
	
	int deleteTemplate(int tno);

	List<Template> selectListTemplate(int mno);
	
}
