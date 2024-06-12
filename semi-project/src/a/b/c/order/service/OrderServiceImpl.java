package a.b.c.order.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import a.b.c.order.dao.OrderDAO;
import a.b.c.order.vo.OrderVO;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {
	Logger logger = LogManager.getLogger(OrderServiceImpl.class);
	
	@Autowired(required=false)
	private OrderDAO orderDAO;

	@Override
	public int orderInsert(OrderVO ovo) {
		logger.info("OrderServiceImpl :: orderInsert 함수 진입 >>> : ");			
		return orderDAO.orderInsert(ovo);
	}
	
	@Override
	public List<OrderVO> orderSelectAll(OrderVO ovo) {
		logger.info("OrderServiceImpl :: orderSelectAll 함수 진입 >>> : ");			
		return orderDAO.orderSelectAll(ovo);
	}
	
	@Override
	public int orderDelete(OrderVO ovo) {
		logger.info("OrderServiceImpl :: orderInsert 함수 진입 >>> : ");			
		return orderDAO.orderDelete(ovo);
	}
}