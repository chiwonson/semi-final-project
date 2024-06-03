package a.b.c.news.dao;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.c.news.vo.NewsVO;

@Repository
public class NewsDAOImpl implements NewsDAO {
	Logger logger = LogManager.getLogger(NewsDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;

	@Override
	public int newsInsert(NewsVO nvo) {
		logger.info("NewsDAOImpl :: newsInsert >>> : ");	
		return sqlSession.insert("newsInsert", nvo);
	}

	@Override
	public List<NewsVO> newsSelectAll(NewsVO nvo) {
		logger.info("NewsDAOImpl :: newsSelectAll >>> : ");	
		return sqlSession.selectList("newsSelect", nvo);
	}

	@Override
	public List<NewsVO> newsSelect(NewsVO nvo) {
		logger.info("NewsDAOImpl :: newsSelect >>> : ");	
		return sqlSession.selectList("newsSelectAll", nvo);
	}

	@Override
	public int newsUpdate(NewsVO nvo) {
		logger.info("NewsDAOImpl :: newsUpdate >>> : ");	
		return sqlSession.update("newsUpdate", nvo);
	}

	@Override
	public int newsDelete(NewsVO nvo) {
		logger.info("NewsDAOImpl :: newsDelete >>> : ");	
		return sqlSession.delete("newsDelete", nvo);
	}

}
