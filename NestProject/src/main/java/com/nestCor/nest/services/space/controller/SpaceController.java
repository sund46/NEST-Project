package com.nestCor.nest.services.space.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.nestCor.nest.member.model.vo.Member;
import com.nestCor.nest.services.note.model.vo.Note;
import com.nestCor.nest.services.space.model.service.SpaceService;
import com.nestCor.nest.services.space.model.vo.ChatRoom;
import com.nestCor.nest.services.space.model.vo.Space;

@SessionAttributes(value= {"spaceList"})
@Controller
public class SpaceController {

	@Autowired
	private SpaceService sService;
	
	
	@RequestMapping("/space/createSpace.do")
	public String createSpace(Space space, HttpServletRequest req, Model model) {
		
		List<Space> spaceList = null;

		HttpSession session = req.getSession();
		Member m = (Member)session.getAttribute("member");
		
		if(space.getPostSpaceDir().equals("on")) {
			space.setPostSpaceDir("Y");
		}else space.setPostSpaceDir("N");
		
		space.setBizNo(m.getBizNo());
		
		int mNo = m.getmNo();
		
		
		int result = sService.createSpace(space,mNo);
		String url = "";
		
		
		if(result > 0) {
	
			// 스페이스 리스트
			spaceList = sService.selectSpaceList(m.getBizNo());
			
			model.addAttribute("spaceList",spaceList);
			
			url = "client/services/note/note_main";
		}else { // 에러
			
		}
		
		
		return url;
	}
	
	@RequestMapping("/space/selectChatRoomNo.do")
	@ResponseBody
	public int selectChatRoomNo(@RequestParam("chatter1") String chatter1,@RequestParam("chatter2") String chatter2) {
		
		ChatRoom chatRoom = new ChatRoom();
		chatRoom.setChatter1(chatter1);
		chatRoom.setChatter2(chatter2);
		chatRoom.setChatters(String.join(",", chatter1,chatter2));
		
		int roomNo = sService.selectChatRoomNo(chatRoom);
		
		return roomNo;
	}
	
	@RequestMapping("/space/selectOneSpace.do")
	public String selectOneSpace(@RequestParam int spaceNo, Model model) {
	
        Map<String,Object> spaceContentsMap = sService.getSpaceContentsMap(spaceNo);
     

        model.addAttribute("spaceContentsMap",spaceContentsMap);
        System.out.println(spaceContentsMap);
		return "client/services/space/space_main"; 
	}
	
	@RequestMapping("/space/noteFix.do")
	@ResponseBody
	public void noteFix(@RequestParam int nno) {
		System.out.println("여긴옴");
		sService.noteFix(nno);

	}
	
	@RequestMapping("/space/noteNotFix.do")
	@ResponseBody
	public void noteNotFix(@RequestParam int nno) {
		
		sService.noteNotFix(nno);

	}
	
	
	@RequestMapping("/space/selectFixedNoteList")
	@ResponseBody
	public List<Note> selectFixedNoteList(){
		
		List<Note> fixedNoteList = new ArrayList<>();
		
		fixedNoteList = sService.selectFixedNoteList();
		
		return fixedNoteList;
		
	}
	
	@RequestMapping("/space/spaceNoteDetail.do")
	public String spaceNoteDetail(@RequestParam("spaceno") int spaceNo,@RequestParam("nno") int nno,Model model) {
	
		Map<String,Object> spaceNoteDetailContents = 
				sService.spaceNoteDetail(spaceNo);
		
		model.addAttribute("spaceNoteDetailContents",spaceNoteDetailContents);
		model.addAttribute("nno",nno);
		return "client/services/note/note_of_space_main";
		
	}
	
	

	
	
}
