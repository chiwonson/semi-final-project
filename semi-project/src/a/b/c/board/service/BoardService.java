package a.b.c.board.service;

import java.util.List;

import a.b.c.board.vo.BoardVO;

public interface BoardService {
	
	public int BoardInsert(BoardVO bvo);
	public List<BoardVO> BoardSelectAll(BoardVO bvo);
	public List<BoardVO> BoardSelect(BoardVO bvo);
	
	public List<BoardVO> BoardPwCheck(BoardVO bvo);
	
	public int BoardHit(BoardVO bvo);
	
	public int BoardUpdate(BoardVO bvo);
	public int BoardDelete(BoardVO bvo);
	public int BoardBhit(BoardVO bvo);

}
