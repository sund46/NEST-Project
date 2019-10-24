package com.nestCor.nest.services.note.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nestCor.nest.services.note.model.dao.NoteDao;
import com.nestCor.nest.services.note.model.vo.Note;

@Service
public class NoteServiceImpl implements NoteService {

	@Autowired
	NoteDao noteDao;
	
	@Override
	public int insertNote(Note note) {
		return noteDao.insertNote(note);
	}

	@Override
	public Note selectOneNote(Note note) {
		return null;
	}

	@Override
	public List<Note> selectListNote(Note note) {
		return noteDao.selectListNote(note);
	}

	@Override
	public int updateNote(Note note) {
		return noteDao.updateNote(note);
	}

	@Override
	public int goTrash(Note note) {
		return noteDao.goTrash(note);
	}
	
	@Override
	public int goAllTrash(Note note) {
		return noteDao.goAllTrash(note);
	}
	
	
	@Override
	public int deleteOneTrash(int nno) {
		System.out.println("deleteOneTrash 서비스");
		return noteDao.deleteOneTrash(nno);
	} 

	@Override
	public int deleteAllTrash(int mno) {
		System.out.println("deleteAllTrash 서비스");
		return noteDao.deleteAllTrash(mno);
	}
	
	@Override
	public int restoreTrash(Note note) {
		return noteDao.restoreTrash(note);
	}
	
	@Override
	public Note noteDetail(int nno) {
		return noteDao.noteDetail(nno);
	}
	
	@Override
	public int firstSave(Note note) {
		return noteDao.firstSave(note);
	}
	
	@Override
	public int searchNno(Note note) {
		return noteDao.searchNno(note);
	}
	
	@Override
	public int moveNote(Note note) {
		return noteDao.moveNote(note);
	}
	
	@Override
	public int copyNote(int nno) {
		return noteDao.copyNote(nno);
	}
	
	@Override
	public List<Note> searchNote(Note note) {
		return noteDao.searchNote(note);
	}
	
	
	
}
