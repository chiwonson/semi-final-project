package a.b.c.news.dao;

import java.util.List;

import a.b.c.news.vo.NewsVO;

public interface NewsDAO {

	public int newsInsert(NewsVO nvo);
	public List<NewsVO> newsSelectAll(NewsVO nvo);
	public List<NewsVO> newsSelect(NewsVO nvo);
	public int newsUpdate(NewsVO nvo);
	public int newsDelete(NewsVO nvo);
}
