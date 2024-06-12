package a.b.c.mem.dao;

import java.util.List;
import a.b.c.mem.vo.MemberVO;

public interface MemberDAO {
	
		int memberInsert(MemberVO tvo);
		List<MemberVO> memberSelectAll(MemberVO tvo);
		List<MemberVO> memberSelect(MemberVO tvo);
		
		List<MemberVO> idCheck(MemberVO tvo);

}
