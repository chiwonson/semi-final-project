package a.b.c.mem.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import a.b.c.mem.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Override
	public int MemberInsert(MemberVO tvo) {
		// TODO Auto-generated method stub
		
		return sqlSession.insert("MemberInsert", tvo);
	}

}
