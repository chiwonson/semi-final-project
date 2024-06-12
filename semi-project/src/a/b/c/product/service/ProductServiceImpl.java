package a.b.c.product.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import a.b.c.product.dao.ProductDAO;
import a.b.c.product.vo.ProductVO;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {
	Logger logger = LogManager.getLogger(ProductServiceImpl.class);
	
	@Autowired(required=false)
	private ProductDAO productDAO;

	@Override
	public List<ProductVO> productSelectAll(ProductVO pvo) {
		logger.info("ProductServiceImpl :: productSelectAll >>> : ");			
		return productDAO.productSelectAll(pvo);
	}

	@Override
	public List<ProductVO> productSelect(ProductVO pvo) {
		logger.info("ProductServiceImpl :: productSelect >>> : ");			
		return productDAO.productSelect(pvo);
	}

	@Override
	public int productInsert(ProductVO pvo) {
		logger.info("ProductServiceImpl :: productInsert >>> : ");			
		return productDAO.productInsert(pvo);
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
