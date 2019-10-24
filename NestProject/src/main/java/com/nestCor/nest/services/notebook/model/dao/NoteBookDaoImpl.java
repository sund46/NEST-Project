package com.nestCor.nest.services.notebook.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nestCor.nest.services.note.model.vo.Note;
import com.nestCor.nest.services.notebook.model.vo.NoteBook;

@Repository
public class NoteBookDaoImpl implements NoteBookDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<Note> selectOneNoteBook(int nbno) {
		System.out.println("dao들어옴");
		return sqlSession.selectList("noteBook.selectOneNoteBook", nbno);
	}

	
	@Override
	public List<NoteBook> selectListNoteBook(int mno) {
		return sqlSession.selectList("noteBook.selectListNoteBook", mno);
	}
	
	@Override
	public int updateNoteBook(NoteBook noteBook) {
		return 0;
	}
	
	
	 @Override 
	 public int trashGo(Note note) { 
		 return sqlSession.update("noteBook.trashGo", note); 
	 }
	 

	@Override
	public int insertOneRenote(int nno) {
		return sqlSession.insert("noteBook.insertOneRenote", nno);
	}
	
	@Override
	public int deleteNoteBook(int nbno) {
		System.out.println("delete dao들어옴");
		return sqlSession.delete("noteBook.deleteNoteBook", nbno);
	}
	
	@Override
	public int changeTitle(NoteBook nb) {
		System.out.println("change dao들어옴");
		return sqlSession.update("noteBook.changeTitle", nb);
	}
	
	@Override
	public int insertNoteBook(NoteBook nb) {
		System.out.println("insert dao들어옴");
		return sqlSession.insert("noteBook.insertNoteBook", nb);
	}

	@Override
	public int searchNbno(int mno) {
		return sqlSession.selectOne("noteBook.searchNbno", mno);
	}
}
