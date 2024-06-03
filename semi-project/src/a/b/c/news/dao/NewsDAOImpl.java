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
	public int newsInsert() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<NewsVO> newsSelectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<NewsVO> newsSelect() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int newsUpdate() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int newsDelete() {
		// TODO Auto-generated method stub
		return 0;
	}

}
