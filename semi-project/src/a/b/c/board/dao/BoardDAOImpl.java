package a.b.c.board.dao;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.c.board.vo.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	Logger logger = LogManager.getLogger(BoardDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int BoardInsert(BoardVO bvo) {
		logger.info("BoardInsert 함수 진입 >>> : ");
		return sqlSession.insert("BoardInsert", bvo);
	}
	
	@Override
	public List<BoardVO> BoardSelectAll(BoardVO bvo){
		logger.info("BoardSelectAll 함수 진입 >>> : ");
		
		return sqlSession.selectList("BoardSelectAll", bvo);
	
	}
	@Override
	public List<BoardVO> BoardSelect(BoardVO bvo) {
		// TODO Auto-generated method stub
		logger.info("BoardSelect 함수 진입 >>> : ");	
		
		return sqlSession.selectList("BoardSelect", bvo);
	}
	
	@Override
	public List<BoardVO> BoardPwCheck(BoardVO bvo){
		logger.info("BoardPwCheck 함수 진입 >>> : ");
		
		return sqlSession.selectList("BoardPwCheck",bvo);
	}
	
	@Override
	public int BoardBhit(BoardVO bvo) {
		logger.info("BoardHit 함수 진입 >>> : ");
		return sqlSession.update("BoardBhit", bvo);
	}
	@Override
	public int BoardUpdate(BoardVO bvo) {
		logger.info("BoardUpdate 함수 진입 >>> : ");
		
		return sqlSession.update("BoardUpdate", bvo);
	}
	
	
	@Override
	public int BoardDelete(BoardVO bvo) {
		logger.info("BoardDelete 함수 진입 >>> : ");
		return sqlSession.update("BoardDelete", bvo);
	
	}

}
