package com.nestCor.nest.services.space.model.vo;

import java.io.Serializable;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Component
@Getter @Setter @ToString
public class Space implements Serializable {

	private static final long serialVersionUID = 1005L;
		private int spaceNo;
		private int bizNo;
		private String spaceName;
		private String spaceExplain;
		private String rightSet;
		private Date createDate;
		private String postSpaceDir;
	
}
