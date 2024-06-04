package a.b.c.mem.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import a.b.c.common.ChabunUtil;
import a.b.c.common.CommonUtils;
import a.b.c.common.FileUploadUtil;
import a.b.c.common.chabun.service.ChabunService;
import a.b.c.mem.service.MemberService;
import a.b.c.mem.vo.MemberVO;

@Controller
public class MemberController {
	Logger logger = LogManager.getLogger(MemberController.class);

	//회원입력폼
	@GetMapping("memForm")
	public String kosMemberInsertForm() {
				logger.info("memberInsertForm 함수진입 >>> : ");
				return "mem/memForm";
	}
	
	//회원등록
	@PostMapping("memInsert")
	public String memberInsert(HttpServletRequest req) {
			logger.info("memberInsert 함수진입 >>> :");
			
			//채번구하기
			String tnum = ChabunUtil.getMemberChabun("D", chabunService.getMemberChabun().getTnum());
			logger.info("memberInsert 함수 tnum >>> : " + tnum);
			
			//이미지 업로드
			FileUploadUtil fu = new FileUploadUtil(CommonUtils.MEM_IMG_UPLOAD_PATH
										,CommonUtils.MEM_IMG_FILE_SIZE
										,CommonUtils.MEM_EN_CODE);
			
			//req-mr-fu
			//이미지 파일 원본사이즈
			boolean bool = fu.imgfileUpload(req);
			logger.info("memberInsert bool >>> : " + bool);
			
			MemberVO tvo= null;
			tvo = new MemberVO();
			
			//채번
			tvo.setTnum(tnum);
			
			//이름
			tvo.setTname(fu.getParameter("tname"));
			
			//아이디
			tvo.setTname(fu.getParameter("tname"));

			//비밀번호
			tvo.setTpw(fu.getParameter("tpw"));
			
			//사진
			tvo.setTphoto(fu.getParameter("tphoto"));
			
			//서비스호출
			int nCnt = MemberService.memberInsert(tvo);
			
			if(nCnt > 0) {
							logger.info("memberInsert 함수 nCnt >>> : " + nCnt);
							return "mem/memInsert";
				
			}
			
			return "mem/memForm";
		
	}
	

}
