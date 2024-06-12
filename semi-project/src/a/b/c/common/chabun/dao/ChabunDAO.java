package a.b.c.common.chabun.dao;

import a.b.c.board.vo.BoardVO;
import a.b.c.mem.vo.MemberVO;
import a.b.c.news.vo.NewsVO;
import a.b.c.product.vo.ProductVO;

public interface ChabunDAO {

	public MemberVO getMemberChabun();
	public NewsVO getNewsChabun();
	public ProductVO getProductChabun();
	public BoardVO getBoardChabun();
}
