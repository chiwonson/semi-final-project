package a.b.c.common.chabun.service;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import a.b.c.board.vo.BoardVO;
import a.b.c.common.chabun.dao.ChabunDAO;
import a.b.c.mem.vo.MemberVO;
import a.b.c.news.vo.NewsVO;
import a.b.c.product.vo.ProductVO;

@Service
@Transactional
public class ChabunServiceImpl implements ChabunService {
	Logger logger = LogManager.getLogger(ChabunServiceImpl.class);

	@Autowired(required=false)
	private ChabunDAO chabunDAO;
	
	@Override
	public NewsVO getNewsChabun() {
		logger.info("Service :: getNewsChabun 함수 진입 >>> : ");
		return chabunDAO.getNewsChabun();
	}

	@Override
	public ProductVO getProductChabun() {
		logger.info("Service :: getProductChabun 함수 진입 >>> : ");
		return chabunDAO.getProductChabun();
	}
	
	@Override
	public MemberVO getMemberChabun() {
		// TODO Auto-generated method stub
		logger.info("getMemberChabun 함수진입 >>> : ");
		return chabunDAO.getMemberChabun();
	}

	@Override
	public BoardVO getBoardChabun() {
		// TODO Auto-generated method stub
		logger.info("getBoardChabun 함수 진입 >>> : ");
		return chabunDAO.getBoardChabun();
	}

	

}
