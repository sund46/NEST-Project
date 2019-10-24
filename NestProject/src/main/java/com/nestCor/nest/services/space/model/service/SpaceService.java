package com.nestCor.nest.services.space.model.service;

import java.util.List;
import java.util.Map;

import com.nestCor.nest.services.note.model.vo.Note;
import com.nestCor.nest.services.space.model.vo.ChatRoom;
import com.nestCor.nest.services.space.model.vo.Space;

public interface SpaceService {
		int createSpace(Space space,int mNo);
		List<Space> selectSpaceList(int bizNo);
		int updateSpace(Space space);
		int deleteSpace(String spaceName);
		int selectChatRoomNo(ChatRoom chatRoom);
		Map<String,Object> getSpaceContentsMap(int spaceNo);
		void noteFix(int nno);
		void noteNotFix(int nno);
		List<Note> selectFixedNoteList();
		Map<String, Object> spaceNoteDetail(int spaceNo);
	
	

		
		
		
		// 스페이스 컨텐츠 가져오는 것도 할 예정.
		

}
