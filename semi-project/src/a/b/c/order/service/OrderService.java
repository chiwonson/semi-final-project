package a.b.c.order.service;

import java.util.List;

import a.b.c.order.vo.OrderVO;

public interface OrderService {

	public int orderInsert(OrderVO ovo);
	public List<OrderVO> orderSelectAll(OrderVO ovo);
	public int orderDelete(OrderVO ovo);
}
