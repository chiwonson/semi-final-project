package a.b.c.mem.service;

import java.util.List;


import org.apache.log4j.Logger;
import org.apache.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import a.b.c.mem.dao.MemberDAO;
import a.b.c.mem.vo.MemberVO;

@Service
@Transactional
public class MemberServiceImpl implements MemberService{
	private Logger logger = LogManager.getLogger(MemberServiceImpl.class);

	@Autowired(required = false)
	private MemberDAO memberDAO;	
	
	@Override
	public int MemberInsert(MemberVO tvo) {
		// TODO Auto-generated method stub
		return  memberDAO.MemberInsert(tvo);
	}

}
