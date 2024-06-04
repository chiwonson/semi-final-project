package a.b.c.mem.dao;


import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.c.mem.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired(required = false)
	private SqlSession sqlSession;
	
	@Override
	public int MemberInsert(MemberVO tvo) {
		// TODO Auto-generated method stub
		
		return sqlSession.insert("MemberInsert", tvo);
	}

}
