package a.b.c.order.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.c.order.vo.OrderVO;

@Repository
public class OrderDAOImpl implements OrderDAO {
	Logger logger = LogManager.getLogger(OrderDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSession sqlSession;
	
	@Override
	public int orderInsert(OrderVO ovo) {
		// TODO Auto-generated method stub
		logger.info("OrderDAOImpl :: orderInsert >>> : ");			
		return (Integer)sqlSession.insert("orderInsert", ovo);
	}
	
	@Override
	public List<OrderVO> orderSelectAll(OrderVO ovo) {
		logger.info("OrderDAOImpl :: orderSelectAll >>> : ");			
		return sqlSession.selectList("orderSelectAll", ovo);
	}

	@Override
	public int orderDelete(OrderVO ovo) {
		logger.info("OrderDAOImpl :: orderDelete >>> : ");			
		return (Integer)sqlSession.update("orderInsert", ovo);
	}
}