package a.b.c.board.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import a.b.c.board.dao.BoardDAO;
import a.b.c.board.vo.BoardVO;

public class BoardServiceImpl implements BoardService {
	Logger logger = LogManager.getLogger(BoardServiceImpl.class);
	
	@Autowired(required=false)
	private a.b.c.board.dao.BoardDAO BoardDAO;
	
	@Override
	public int BoardInsert(BoardVO bvo) {
		logger.info("BoardInsert 함수 진입 >>> : ");
		return BoardDAO.BoardInsert(bvo);
	}
	@Override
	public List<BoardVO> BoardSelectAll(BoardVO bvo){
		logger.info("BoardSelectAll 함수 진입 >>> : ");
		return BoardDAO.BoardSelectAll(bvo);
	}
	
	@Override
	public int BoardDelete(BoardVO bvo) {
		logger.info("BoardDelete 함수 진입 >>> : ");
		return BoardDAO.BoardDelete(bvo);
	}
	

}
