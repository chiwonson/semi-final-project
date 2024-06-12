package a.b.c.mem.service;

import java.util.List;
import a.b.c.mem.vo.MemberVO;

public interface MemberService {

			int MemberInsert(MemberVO tvo);
			List<MemberVO> MemberSelectAll(MemberVO tvo);
			List<MemberVO> MemberSelect(MemberVO tvo);
			
			List<MemberVO> IdCheck(MemberVO tvo);
}
