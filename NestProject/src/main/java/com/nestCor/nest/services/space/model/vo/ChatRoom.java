package com.nestCor.nest.services.space.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Component
@Setter
@Getter 
@ToString
public class ChatRoom implements Serializable {

	private static final long serialVersionUID = 1007L;
	private int roomIdx;
	private String chatter1;
	private String chatter2;
	private String chatters;
	private String groupChat;
	private int roomNo;
}
