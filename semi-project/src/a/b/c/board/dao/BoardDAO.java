package a.b.c.board.dao;

import java.util.List;

import a.b.c.board.vo.BoardVO;

public interface BoardDAO {
	
	public int BoardInsert(BoardVO bvo);
	public List<BoardVO> BoardSelectAll(BoardVO bvo);
	public List<BoardVO> BoardSelect(BoardVO bvo);
	public List<BoardVO> BoardPwCheck(BoardVO bvo);
	
	public int BoardBhit(BoardVO bvo);
	
	public int BoardUpdate(BoardVO bvo);
	public int BoardDelete(BoardVO bvo);
	

}
