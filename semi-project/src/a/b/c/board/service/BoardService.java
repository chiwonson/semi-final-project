package a.b.c.board.service;

import java.util.List;

import a.b.c.board.vo.BoardVO;

public interface BoardService {
	
	public int BoardInsert(BoardVO bvo);
	public List<BoardVO> BoardSelectAll(BoardVO bvo);
	public int BoardDelete(BoardVO bvo);

}
