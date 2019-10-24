package com.nestCor.nest.services.template.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nestCor.nest.services.template.model.vo.Template;

@Repository
public class TemplateDaoImpl implements TemplateDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertTemplate(Template template) {
		System.out.println(template);
		return sqlSession.insert("template.insertTemplate",template);
	}

	@Override
	public Template selectOneTemplate(int tno) {
		
		return sqlSession.selectOne("template.selectOneTemplate",tno);
	}

	@Override
	public int deleteTemplate(int tno) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public List<Template> selectListTemplate(int mno) {
		return sqlSession.selectList("template.selectListTemplate",mno);
	}

}
