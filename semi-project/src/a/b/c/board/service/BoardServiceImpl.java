package a.b.c.board.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import a.b.c.board.dao.BoardDAO;
import a.b.c.board.vo.BoardVO;

@Service
@Transactional
public class BoardServiceImpl implements BoardService {
	Logger logger = LogManager.getLogger(BoardServiceImpl.class);
	
	@Autowired(required=false)
	private BoardDAO boardDAO;
	
	@Override
	public int BoardInsert(BoardVO bvo) {
		logger.info("BoardInsert 함수 진입 >>> : ");
		return boardDAO.BoardInsert(bvo);
	}
	
	@Override
	public List<BoardVO> BoardSelectAll(BoardVO bvo){
		logger.info("BoardSelectAll 함수 진입 >>> : ");
		return boardDAO.BoardSelectAll(bvo);
	}
	@Override
	public List<BoardVO> BoardSelect(BoardVO bvo){
		logger.info("BoardSelect 함수 진입 >>> : ");
		return boardDAO.BoardSelect(bvo);
	}
	
	@Override
	public List<BoardVO> BoardPwCheck(BoardVO bvo){
		logger.info("BoardPwCheck 함수 진입 >>> :");
		return boardDAO.BoardPwCheck(bvo);
	}
	@Override
	public int BoardHit(BoardVO bvo) {
		logger.info("BoardHit 함수 진입 >>> :");
		return boardDAO.BoardBhit(bvo);
	}
	@Override
	public int BoardUpdate(BoardVO bvo) {
		logger.info("BoardUpdate 함수 진입 >>> : ");
		return boardDAO.BoardUpdate(bvo);
		
	}
	
	@Override
	public int BoardDelete(BoardVO bvo) {
		logger.info("BoardDelete 함수 진입 >>> : ");
		return boardDAO.BoardDelete(bvo);
	}

	@Override
	public int BoardBhit(BoardVO bvo) {
		// TODO Auto-generated method stub
		return 0;
	}
	

}
