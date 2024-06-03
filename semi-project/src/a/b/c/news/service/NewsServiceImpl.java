package a.b.c.news.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import a.b.c.news.dao.NewsDAO;
import a.b.c.news.vo.NewsVO;

@Service
@Transactional
public class NewsServiceImpl implements NewsService {
	Logger logger = LogManager.getLogger(NewsServiceImpl.class);
	
	@Autowired(required=false)
	private NewsDAO newsDAO;
	
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
