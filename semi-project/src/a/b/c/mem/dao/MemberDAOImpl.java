package a.b.c.mem.dao;


import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.c.mem.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	Logger logger=LogManager.getLogger(MemberDAOImpl.class);
	
	@Autowired(required = false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int memberInsert(MemberVO tvo) {
		// TODO Auto-generated method stub
		logger.info("Insert 함수 진입 >>> : ");
		
		return sqlSession.insert("memberInsert", tvo);
	}

	@Override
	public List<MemberVO> memberSelectAll(MemberVO tvo) {
		// TODO Auto-generated method stub
		logger.info("memberSelectAll 함수진입 >>> : ");
		
		return sqlSession.selectList("memberSelectAll", tvo);
	}

	@Override
	public List<MemberVO> memberSelect(MemberVO tvo) {
		// TODO Auto-generated method stub
		logger.info("memberSelect 함수 진입 >>> : ");	
		
		return sqlSession.selectList("memberSelect", tvo);
	}

	@Override
	public List<MemberVO> idCheck(MemberVO tvo) {
		// TODO Auto-generated method stub
		logger.info("idcheck 함수진입 >>> : ");
		
		return sqlSession.selectList("idcheck", tvo);
	}

}
