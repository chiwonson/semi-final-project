package a.b.c.board.dao;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.c.board.vo.BoardVO;

@Repository
public class BoardDAOImpl implemetns BoardDAO {
	Logger logger = LogManager.getLogger(BoardDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int BoardInsert(BoardVO bvo) {
		logger.info("BoardInsert 함수 진입 >>> : ");
		return sqlSession.insert("BoardInsert", bvo);
	}
	
	@Overried
	public List<BoardVO> BoardSelectAll(BoardVO bvo){
		logger.info("BoardSelectAll 함수 진입 >>> : ");
		return sqlSession.selectList("kosBoardSelectAll", bvo){
	
	}
		
	@Overried
	public int BoardDelete(BoardVO bvo) {
		logger.info("BoardDelete 함수 진입 >>> : ");
		return sqlSession.update("BoardDelete", bvo);
	
	}

}
