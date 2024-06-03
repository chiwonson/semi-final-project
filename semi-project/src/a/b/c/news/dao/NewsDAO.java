package a.b.c.news.dao;

import java.util.List;

import a.b.c.news.vo.NewsVO;

public interface NewsDAO {

	public int newsInsert();
	public List<NewsVO> newsSelectAll();
	public List<NewsVO> newsSelect();
	public int newsUpdate();
	public int newsDelete();
}
