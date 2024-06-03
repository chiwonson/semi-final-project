package a.b.c.news.service;

import java.util.List;

import a.b.c.news.vo.NewsVO;

public interface NewsService {
	
	public int newsInsert();
	public List<NewsVO> newsSelectAll();
	public List<NewsVO> newsSelect();
	public int newsUpdate();
	public int newsDelete();
}
