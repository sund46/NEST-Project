package com.nestCor.nest.services.note.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.nestCor.nest.services.board.model.service.BoardService;
import com.nestCor.nest.services.board.model.vo.Board;
import com.nestCor.nest.services.note.model.service.NoteService;
import com.nestCor.nest.services.note.model.vo.Note;
import com.nestCor.nest.services.notebook.model.service.NoteBookService;
import com.nestCor.nest.services.notebook.model.vo.NoteBook;
import com.nestCor.nest.services.template.model.service.TemplateService;
import com.nestCor.nest.services.template.model.vo.Template;


@Controller
public class NoteController {
	@Autowired
	NoteService noteService;
	
	@Autowired
	TemplateService templateService;
	
	@Autowired
	NoteBookService nbService;

	@Autowired
	BoardService bService;
	
	
	@RequestMapping("/note/index.do")
	public String indexgo() {
		return "client/services/note/index";
	}
	
	@RequestMapping("/note/nShare.do")
	public String noteShare() {
		return "client/services/note/note_file_share";
	}
	
	@RequestMapping("/note/tag.do")
	public String tag() {
		return "client/services/note/note_tag";
	}
	
	@RequestMapping("/note/newNote.do")
	public String newNote(@RequestParam("mno") int mno, Model model) {
		
		List<Template> list = templateService.selectListTemplate(mno);
		
		model.addAttribute("tlist",list);
		model.addAttribute("topmenu",1);
		return "client/services/note/newNote";
	}
	
	@RequestMapping("/note/noteDetail.do")
	@ResponseBody
	public Note noteDetail(@RequestParam("nno") int nno) {
		Note note = new Note();
		
		note = noteService.noteDetail(nno);
		
		System.out.println(note+"들어옴");
		return note;
	}
	
	// 새 노트 저장 시
	@RequestMapping("/note/firstSave.do")
	@ResponseBody
	public int firstSave(@RequestParam("nno") int nno,@RequestParam("ntitle") String ntitle, @RequestParam("ncontent") String ncontent, @RequestParam("mno") int mno,Model model) {
		Note note = new Note();
		
		int nbno = nbService.searchNbno(mno);
		
		note.setMno(mno);
		note.setNno(nno);
		note.setNbno(nbno);
		note.setNtitle(ntitle);
		note.setNcontent(ncontent);
		System.out.println("저장시도");
		int result = noteService.firstSave(note);
		
		boolean check;
		if(result>0) check=true;
		else check=false;
		
		int nNo = noteService.searchNno(note);
		
		
		
		return nNo;
	}
	
	@RequestMapping("/note/saveNote.do")
	@ResponseBody
	public Note saveNote(@RequestParam("nno") int nno,@RequestParam("ntitle") String ntitle, @RequestParam("ncontent") String ncontent) {
		Note note = new Note();
		note.setNno(nno);
		note.setNtitle(ntitle);
		note.setNcontent(ncontent);
		
		int result = noteService.updateNote(note);
		
		boolean check;
		if(result>0) check=true;
		else check=false;
		
		note = noteService.noteDetail(nno);
		
		System.out.println(note.getnDate());
		
		return note;
	}
	
	
	@RequestMapping("/note/note.do")
	public String selectListNote(@RequestParam("mno") int mno, @RequestParam("trashcan") String yn, Model model) {
		
		Note note = new Note(mno,yn);

		List<Note> list = noteService.selectListNote(note);
		List<Template> tlist = templateService.selectListTemplate(mno);
		List<NoteBook> nblist = nbService.selectListNoteBook(mno);
		
		model.addAttribute("list",list);
		model.addAttribute("tlist",tlist);
		model.addAttribute("nblist",nblist);
		
		String path;
		if(yn.equals("Y")) {path="client/services/note/note_trashcan"; model.addAttribute("topmenu",5);}
		else {path="client/services/note/note_main"; model.addAttribute("topmenu",2);}
		
		return path;
	}
	
	
	
	@RequestMapping("/note/goBackTrash.do")
	@ResponseBody
	public HashMap<String,Object> goTrash(@RequestParam("trashcan") String trashcan, @RequestParam("nno") int nno) {
		Note note = new Note();
		note.setNno(nno);
		note.setTrashcan(trashcan);
		
		int result = noteService.goTrash(note);
		
		HashMap<String, Object> hmap = new HashMap<>();
		
		boolean tf;
		
		if(result>0) tf = true;
		else tf=false;
		
		hmap.put("tf", tf);
		
		return hmap;
	}
	
	@RequestMapping("/note/goAllTrash.do")
	public String goAllTrash(@RequestParam("trashcan") String trashcan, @RequestParam("mno") int mno) {
		Note note = new Note();
		note.setMno(mno);
		note.setTrashcan(trashcan);
		
		int result = noteService.goAllTrash(note);
		
		if(result>0) System.out.println("휴지통으로이동");
		else System.out.println("이동 실패");
		
		return "client/services/note/note_main";
	}
	
	
	@RequestMapping("/note/deleteOneTrash.do")
	@ResponseBody
	public HashMap<String, Object> deleteOneTrash(@RequestParam int nno) {
		// 혹시 모르니 json 
		HashMap<String, Object> hmap = new HashMap<>();
		
		System.out.println("delete 전 확인 : " + nno);
		int result = noteService.deleteOneTrash(nno);
		boolean tf;
		if(result>0) tf=true;
		else tf=false;

		hmap.put("tf", tf);
		
		return hmap;
	}
	
	@RequestMapping("/note/deleteAllTrash.do")
	@ResponseBody
	public boolean deleteAllTrash(@RequestParam int mno) {
		System.out.println("mno 확인 : "+mno);
		int result = noteService.deleteAllTrash(mno);
		
		boolean tf;
		if(result>0) tf=true;
		else tf=false;
		
		
		
		return tf;
	}
	
	
	@RequestMapping("/note/restoreTrash.do")
	@ResponseBody
	public boolean restoreTrash(@RequestParam("nno") int nno, @RequestParam("trashcan") String trashcan) {
		Note note = new Note();
		note.setNno(nno);
		note.setTrashcan(trashcan);
		System.out.println("note:" + note);
		
		int result = noteService.restoreTrash(note);
		
		Note note2 = new Note(1, "Y");
		List<Note> list = noteService.selectListNote(note2);
		System.out.println("list : "+list);
		
		boolean tf;
		if(result>0) tf=true;
		else tf=false;

		return tf;
	}
	
	@RequestMapping("/note/moveNote.do")
	@ResponseBody
	public boolean restoreTrash(@RequestParam("nno") int nno, @RequestParam("nbno") int nbno ) {
		Note note = new Note();
		note.setNno(nno);
		note.setNbno(nbno);
		System.out.println("note:" + note);
		
		int result = noteService.moveNote(note);
		
		boolean tf;
		if(result>0) tf=true;
		else tf=false;

		return tf;
	}
	
	@RequestMapping("/note/copyNote.do")
	public String copyNote(@RequestParam("nno") int nno,@RequestParam("mno") int mno,Model model) {
		int result = noteService.copyNote(nno);
		
		Note note = new Note(mno,"N");

		List<Note> list = noteService.selectListNote(note);
		List<Template> tlist = templateService.selectListTemplate(mno);
		List<NoteBook> nblist = nbService.selectListNoteBook(mno);
		
		model.addAttribute("list",list);
		model.addAttribute("tlist",tlist);
		model.addAttribute("nblist",nblist);
		model.addAttribute("topmenu",2);
		
		
		return "client/services/note/note_main";
	}
	
	@RequestMapping("/note/searchNote.do")
	public String searchNote(@RequestParam("search") String search,@RequestParam("mno") int mno,Model model) {
		
		Note note = new Note();
		
		note.setMno(mno);
		note.setNtitle(search);
		System.out.println(note);
		List<Note> list = noteService.searchNote(note);
		List<Template> tlist=templateService.selectListTemplate(mno);
		
		model.addAttribute("tlist",tlist);
		model.addAttribute("list",list);
		model.addAttribute("search",search);
		model.addAttribute("topmenu",4);
		
		
		return "client/services/note/note_search";
	}
	
	@RequestMapping("/note/moveNbno.do")
	@ResponseBody
	public HashMap<String, Object> moveNote(@RequestParam("nno") int nno,@RequestParam("nbno") int nbno ) {
		HashMap<String, Object> hmap = new HashMap<>();
		
		Note note = new Note();
		note.setNbno(nbno);
		note.setNno(nno);
		
		int result = noteService.moveNote(note);
		boolean tf;
		if(result>0) tf=true;
		else tf=false;

		hmap.put("tf", tf);
		
		return hmap;
	}
	
	@RequestMapping("/note/goCommunity.do")
	@ResponseBody
	public HashMap<String, Object> goCommunity(@RequestParam("ntitle") String btitle, @RequestParam("ncontent") String bcontent,
			@RequestParam("nickname") String bwriter, @RequestParam("cate1") String cate1, @RequestParam("cate2") String cate2) {
		HashMap<String, Object> hmap = new HashMap<>();
		
		Board board = new Board();
		board.setBtitle(btitle);
		board.setBcontent(bcontent);
		board.setBwriter(bwriter);
		board.setCate1_code(cate1);
		board.setCate2_code(cate2);
		
		System.out.println(board);
		
		int result = bService.insertBoard(board);
		boolean tf;
		if(result>0) tf=true;
		else tf=false;

		hmap.put("tf", tf);
		
		return hmap;
	}
	
	
	
	
	
	@RequestMapping(value = "/a/images", method = RequestMethod.POST)
	@ResponseBody
	public String handleTinyMCEUpload(@RequestParam("files") MultipartFile files[],HttpSession session) {
	    System.out.println("uploading______________________________________MultipartFile " + files.length);
	    String filePath = "/resources/uploads/images/" + files[0].getOriginalFilename();
	    String result = uploadFilesFromTinyMCE("images", files, false,session);
	    System.out.println(result);
	    return "{\"location\":\"" + filePath + "\"}";

	}
	@RequestMapping(value = "/a/files", method = RequestMethod.POST, produces = "application/String; charset=utf8")
	@ResponseBody
	public String handleTinyMCEUpload2(@RequestParam("files") MultipartFile files[],HttpSession session) {
	    System.out.println("uploading______________________________________MultipartFile " + files.length);
	    String filePath = "/resources/uploads/files/" + files[0].getOriginalFilename();
	    String result = uploadFilesFromTinyMCE("files", files, false,session);
	    System.out.println(result);
	    return "{\"location\":\"" + filePath + "\"}";
	}
	private String uploadFilesFromTinyMCE(String prefix, MultipartFile files[], boolean isMain,HttpSession session) {
		ServletContext context=session.getServletContext();
	    System.out.println("uploading______________________________________" + prefix);
	    try {
	        String folder = context.getRealPath("/") + "/resources/uploads/" + prefix+"/";
	        StringBuffer result = new StringBuffer();
	        byte[] bytes = null;
	        result.append("Uploading of File(s) ");

	        for (int i = 0; i < files.length; i++) {
	            if (!files[i].isEmpty()) {
	                try {
	                    boolean created = false;
	                    try {
	                        File theDir = new File(folder); 
	                        theDir.mkdir();
	                        created = true;
	                    } catch (SecurityException se) {
	                        se.printStackTrace();
	                    }
	                    if (created) {
	                        System.out.println("DIR created");
	                    }
	                    String path = "";
	                    path = folder + files[i].getOriginalFilename();
	                    File destination = new File(path);
	                    System.out.println("--> " + destination);
	                    System.out.println("파일전송");
	                    files[i].transferTo(destination);
	                    result.append(files[i].getOriginalFilename() + " Succsess. ");
	                } catch (Exception e) {
	                    throw new RuntimeException("Product Image saving failed", e);
	                }
	            } else
	                result.append(files[i].getOriginalFilename() + " Failed. ");
	        }
	        return result.toString();

	    } catch (Exception e) {
	        return "Error Occured while uploading files." + " => " + e.getMessage();
	    }
	}
	
	
}
