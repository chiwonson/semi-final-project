package a.b.c.product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.c.product.vo.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO {
	Logger logger = LogManager.getLogger(ProductDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSession sqlSession;
	
	@Override
	public List<ProductVO> productSelectAll(ProductVO pvo) {
		logger.info("ProductDAOImpl :: productSelectAll >>> : ");			
		return sqlSession.selectList("productSelectAll", pvo);
	}

	@Override
	public List<ProductVO> productSelect(ProductVO pvo) {
		logger.info("ProductDAOImpl :: productSelect >>> : ");			
		return sqlSession.selectList("productSelect", pvo);
	}

	@Override
	public int productInsert(ProductVO pvo) {
		logger.info("ProductDAOImpl :: productInsert >>> : ");			
		return (Integer)sqlSession.insert("productInsert", pvo);
	}

	@Override
	public int productUpdate(ProductVO pvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int productDelete(ProductVO pvo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
