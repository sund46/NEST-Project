package com.nestCor.nest.services.note.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nestCor.nest.services.note.model.vo.Note;

@Repository
public class NoteDaoImpl implements NoteDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertNote(Note note) {
		return sqlSession.insert("note.insertNote",note);
	}

	@Override
	public Note selectOneNote(Note note) {
		return null;
	}

	@Override
	public List<Note> selectListNote(Note note) {
		return sqlSession.selectList("note.selectListNote", note);
	}

	@Override
	public int updateNote(Note note) {
		return sqlSession.update("note.updateNote",note);
	}

	@Override
	public int goTrash(Note note) {
		return sqlSession.update("note.goTrash", note);
	}
	
	@Override
	public int goAllTrash(Note note) {
		return sqlSession.update("note.goAllTrash", note);
	}
	
	@Override
	public int deleteOneTrash(int nno) {
		System.out.println("deleteOneTrash dao");
		return sqlSession.delete("note.deleteOneTrash", nno);
	}

	@Override
	public int deleteAllTrash(int mno) {
		System.out.println("deleteOneTrash dao");
		return sqlSession.delete("note.deleteAllTrash", mno);
	}
	
	@Override
	public int restoreTrash(Note note) {
		return sqlSession.update("note.restoreTrash", note);
	}
	
	@Override
	public Note noteDetail(int nno) {
		return sqlSession.selectOne("note.noteDetail",nno);
	}
	
	@Override
	public int firstSave(Note note) {
		
		int result = 0;
		
		if(note.getNno()>0) {
			result = sqlSession.insert("note.updateNote",note);
		}else {
			result = sqlSession.insert("note.firstSave",note);
		}

		return result;
	}
	
	@Override
	public int searchNno(Note note) {
		
		return sqlSession.selectOne("note.searchNno",note);
	}
	
	@Override
	public int moveNote(Note note) {
		return sqlSession.update("note.moveNote",note);
	}
	
	@Override
	public int copyNote(int nno) {
		return sqlSession.insert("note.copyNote",nno);
	}
	
	@Override
	public List<Note> searchNote(Note note) {
		
		List<Note> list;
		
		list = sqlSession.selectList("note.searchNote1",note);
		
		if(list.size()>0) {
			System.out.println("널이 아니오"+list.size()+"개");
		}else {
			list = sqlSession.selectList("note.searchNote2",note);
		}
		
		
		return list;
	}
}
