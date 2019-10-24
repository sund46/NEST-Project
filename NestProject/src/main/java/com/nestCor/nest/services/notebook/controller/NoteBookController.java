package com.nestCor.nest.services.notebook.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nestCor.nest.services.note.model.service.NoteService;
import com.nestCor.nest.services.note.model.vo.Note;
import com.nestCor.nest.services.notebook.model.service.NoteBookService;
import com.nestCor.nest.services.notebook.model.vo.NoteBook;
import com.nestCor.nest.services.template.model.service.TemplateService;
import com.nestCor.nest.services.template.model.vo.Template;

@Controller
public class NoteBookController {

	 @Autowired 
	 NoteBookService noteBookService;
	 @Autowired 
	 NoteService noteService;
	 @Autowired 
	 TemplateService templateService;
	 
	 
	 @RequestMapping("/notebook/notebook.do") 
	 public String selectListNoteBook(@RequestParam("mno") int mno, Model model) {
		 
		 List<NoteBook> list = noteBookService.selectListNoteBook(mno);
		 System.out.println("list : "+list);
			
		 model.addAttribute("list",list);
		 model.addAttribute("topmenu",3);
		 
		 return "client/services/note/note_list";
	 }
	  
	 @RequestMapping("/notebook/goNotebook.do") 
	 public String selectOneNoteBook(@RequestParam("mno") int mno,@RequestParam("nbno") int nbno,@RequestParam("nbtitle") String nbtitle, Model model) {
		 List<Note> list = noteBookService.selectOneNoteBook(nbno);
		 
		 
		List<Template> tlist = templateService.selectListTemplate(mno);
		List<NoteBook> nblist = noteBookService.selectListNoteBook(mno);
			
		model.addAttribute("list",list);
		model.addAttribute("tlist",tlist);
		model.addAttribute("nblist",nblist);
		 model.addAttribute("nbtitle",nbtitle);
		 model.addAttribute("nbno", nbno);
		 model.addAttribute("topmenu",2);
		 
		 return "client/services/note/notebook_note";
	 }
	 
	 @RequestMapping("/notebook/copyNote.do")
		public String copyNote(@RequestParam("nbtitle") String nbtitle, @RequestParam("nno") int nno,@RequestParam("mno") int mno,@RequestParam("nbno") int nbno,Model model) {
			int result = noteService.copyNote(nno);
			
			List<Note> list = noteBookService.selectOneNoteBook(nbno);
			List<Template> tlist=templateService.selectListTemplate(mno);
			
			model.addAttribute("tlist",tlist);
			model.addAttribute("list",list);
			model.addAttribute("nbtitle",nbtitle);
			model.addAttribute("nbno", nbno);
			model.addAttribute("topmenu",2);
			
			
			return "client/services/note/notebook_note";
		}
	 
	 @RequestMapping("/notebook/trashGo.do")
	 @ResponseBody
	 public Boolean trashGo(@RequestParam("trashcan") String trashcan, @RequestParam("nno") int nno) {
		 Note note = new Note(); 
		 note.setNno(nno);
		 note.setTrashcan(trashcan);
		 
		 int result = noteBookService.trashGo(note);
		 
		 Note note2 = new Note(1,"N"); 
		 System.out.println(note2);
		 List<Note> list = noteService.selectListNote(note2);
		 System.out.println("list: " + list);
		 
		 boolean data;
		 
		 if(result>0) data = true; 
		 else data = false;
	
		 return data;
	 }
	 
	
	 @RequestMapping("/notebook/reNote.do")
	 @ResponseBody
	 public String insertReNote(@RequestParam("nno") int nno, Model model) {
		  
		 int result = noteBookService.insertOneRenote(nno); 
		
		 //model.addAttribute("list",list);
		 
		 String str="";
		 if(result>0) str="success";
		 else str="fail";
		 
		 System.out.println("result 확인 : "+result );
		 
		 return str;
	 }
	 
	 @RequestMapping("/notebook/deleteNoteBook.do")
	 @ResponseBody
	 public HashMap<String, Object> deleteNoteBook(@RequestParam("nbno") int nbno) {
		  
		 HashMap<String, Object> hmap = new HashMap<>();
			
			System.out.println("delete 전 확인 : " + nbno);
			int result = noteBookService.deleteNoteBook(nbno);
			boolean tf;
			if(result>0) tf=true;
			else tf=false;

			hmap.put("tf", tf);
			
			return hmap;
	 }
	 
	 @RequestMapping("/notebook/changeTitle.do")
	 @ResponseBody
	 public HashMap<String, Object> changeTitle(@RequestParam("nbno") int nbno, @RequestParam("nbtitle") String nbtitle) {
		  
		 HashMap<String, Object> hmap = new HashMap<>();
			NoteBook nb = new NoteBook(); 
				nb.setNbno(nbno);
				nb.setNbtitle(nbtitle);
			int result = noteBookService.changeTitle(nb);
			boolean tf;
			if(result>0) tf=true;
			else tf=false;

			hmap.put("tf", tf);
			
			return hmap;
	 }
	 
	 @RequestMapping("/notebook/insertNotebook.do")
	 public String insertNoteBook(@RequestParam("nbtitle") String nbtitle,@RequestParam("mno") int mno,  Model model) {
		  	
		 	NoteBook nb = new NoteBook();
		 	nb.setMno(mno);
		 	nb.setNbtitle(nbtitle);
		 	
			int result = noteBookService.insertNoteBook(nb);
			
			List<NoteBook> list = noteBookService.selectListNoteBook(mno);
			 
				
			 model.addAttribute("list",list);
			 model.addAttribute("topmenu",3);
			
			
			return "client/services/note/note_list";
	 }
	 
}
