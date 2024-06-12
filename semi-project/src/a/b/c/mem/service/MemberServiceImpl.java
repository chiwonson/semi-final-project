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
		
		//String memberId = tvo.getTid();
		  String memberId = generateMemberId();
	      tvo.setTid(memberId);
		
		return  memberDAO.memberInsert(tvo);
	}

	@Override
	public List<MemberVO> MemberSelectAll(MemberVO tvo) {
		// TODO Auto-generated method stub
		logger.info("memberSelectAll() 함수진입 >>> : ");
		
		return memberDAO.memberSelectAll(tvo);
	}

	@Override
	public List<MemberVO> MemberSelect(MemberVO tvo) {
		// TODO Auto-generated method stub
		logger.info("memberSelect() 함수진입 >>> : ");
		
		return memberDAO.memberSelect(tvo);
	}

	@Override
	public List<MemberVO> IdCheck(MemberVO tvo) {
		// TODO Auto-generated method stub
		logger.info("idCheck() 함수 진입 >>> : ");
		
		return memberDAO.idCheck(tvo);
	}
	
	// 회원 아이디 생성 메서드
    private String generateMemberId() {
        // 회원 아이디 생성로직 추가 (예: UUID 또는 시퀀스 활용)
        // 여기서는 단순 예시로 현재 시간을 사용하고, 앞에 "T"을 붙여서 회원 아이디를 생성합니다.
        return "T" + System.currentTimeMillis();
    }

}
