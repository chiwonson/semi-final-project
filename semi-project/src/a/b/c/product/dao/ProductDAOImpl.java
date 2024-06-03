package a.b.c.product.dao;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.c.product.vo.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO {
	Logger logger = LogManager.getLogger(ProductDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
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
