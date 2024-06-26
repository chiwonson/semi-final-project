package a.b.c.common.chabun.dao;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.c.board.vo.BoardVO;
import a.b.c.mem.vo.MemberVO;
import a.b.c.news.vo.NewsVO;
import a.b.c.product.vo.ProductVO;

@Repository
public class ChabunDAOImpl implements ChabunDAO {
	Logger logger = LogManager.getLogger(ChabunDAOImpl.class);

	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public NewsVO getNewsChabun() {
		logger.info("DAO :: getNewsChabun 함수 진입 >>> : ");
		return sqlSession.selectOne("getNewsChabun");
	}

	@Override
	public ProductVO getProductChabun() {
		logger.info("DAO :: getProductChabun 함수 진입 >>> : ");
		return sqlSession.selectOne("getProductChabun");
	}
	
	@Override
	public MemberVO getMemberChabun() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getMemberChabun");
	}

	@Override
	public BoardVO getBoardChabun() {
		// TODO Auto-generated method stub
		logger.info("getBoardChabun 함수 진입 >>> : ");
		return sqlSession.selectOne("getBoardChabun"); // getKosBoardChabun
	}
}
