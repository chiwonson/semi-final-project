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
	public List<ProductVO> productSelectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductVO> productSelect() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int productInsert() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int productUpdate() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int productDelete() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
