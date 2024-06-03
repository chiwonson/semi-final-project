package a.b.c.product.dao;

import java.util.List;

import a.b.c.product.vo.ProductVO;

public interface ProductDAO {

	public List<ProductVO> productSelectAll();
	public List<ProductVO> productSelect();
	public int productInsert();
	public int productUpdate();
	public int productDelete();
}
