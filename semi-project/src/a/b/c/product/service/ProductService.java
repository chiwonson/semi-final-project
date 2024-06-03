package a.b.c.product.service;

import java.util.List;

import a.b.c.product.vo.ProductVO;

public interface ProductService {

	public List<ProductVO> productSelectAll();
	public List<ProductVO> productSelect();
	public int productInsert();
	public int productUpdate();
	public int productDelete();
}
