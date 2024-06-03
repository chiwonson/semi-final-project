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
	public int newsInsert(NewsVO nvo) {
		logger.info("NewsServiceImpl :: newsInsert() >>> : ");
		return newsDAO.newsInsert(nvo);
	}

	@Override
	public List<NewsVO> newsSelectAll(NewsVO nvo) {
		logger.info("NewsServiceImpl :: newsSelectAll() >>> : ");
		return newsDAO.newsSelectAll(nvo);
	}

	@Override
	public List<NewsVO> newsSelect(NewsVO nvo) {
		logger.info("NewsServiceImpl :: newsSelect() >>> : ");
		return newsDAO.newsSelect(nvo);
	}

	@Override
	public int newsUpdate(NewsVO nvo) {
		logger.info("NewsServiceImpl :: newsUpdate() >>> : ");
		return newsDAO.newsUpdate(nvo);
	}

	@Override
	public int newsDelete(NewsVO nvo) {
		logger.info("NewsServiceImpl :: newsDelete() >>> : ");
		return newsDAO.newsDelete(nvo);
	}

}
