package a.b.c.mem.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import a.b.c.common.ChabunUtil;
import a.b.c.common.CommonUtils;
import a.b.c.common.FileUploadUtil;
import a.b.c.common.chabun.service.ChabunService;
import a.b.c.mem.service.MemberService;
import a.b.c.mem.vo.MemberVO;

@Controller
public class MemberController {
	Logger logger = LogManager.getLogger(MemberController.class);

	//필드 오토 와이어드
	@Autowired(required=false)
	private ChabunService chabunService;
	
	// 필드 오토 와이어드
	@Autowired(required=false)
	private MemberService MemberService;
	
	//회원입력폼
	@GetMapping("memForm")
	public String MemberInsertForm() {
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
			FileUploadUtil fu = new FileUploadUtil(	 CommonUtils.MEM_IMG_UPLOAD_PATH
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
			tvo.setTphoto(fu.getFileName("tphoto"));
			
			//성별
			tvo.setTgender(fu.getParameter("tgender"));
			
			//이메일
			String temail = fu.getParameter("temail");
			String temail1 = fu.getParameter("temail1");		
			tvo.setTemail(temail.concat("@").concat(temail1));
			
			//취미
			String thobby="";
			String hobby[]=fu.getParameterValues("thobby");
			if (hobby.length > 0) {
									for (int i=0; i < hobby.length; i++) {
																	thobby += hobby[i] + ",";									
									}
			}
			tvo.setThobby(thobby);
			
			//생일
			String tbirth = fu.getParameter("tbirth");
			String tbirth1 = fu.getParameter("tbirth1");
			String tbirth2 = fu.getParameter("tbirth2");
			tvo.setTbirth(tbirth.concat(tbirth1).concat(tbirth2));
			
			//서비스호출
			int nCnt = MemberService.MemberInsert(tvo);
			
			if(nCnt > 0) {
							logger.info("memberInsert 함수 nCnt >>> : " + nCnt);
							return "mem/memInsert";
				
			}
			
			return "mem/memForm";
	}
	
	// 회원 목록
		@GetMapping("memSelectAll")
		public String memberSelectAll(MemberVO tvo, Model model) {
			logger.info("memberSelectAll 함수 진입 >>> : ");
			
			List<MemberVO> listAll = MemberService.MemberSelectAll(tvo);
			if (listAll.size() > 0) {
				logger.info("memberSelectAll listAll.size() >>> : " + listAll.size());
				
				model.addAttribute("listAll", listAll);
				
				// 검색 조회 후 리프레쉬된 페이지에 설정 유지용 데이터
				model.addAttribute("search_tvo", tvo);
				
				return "mem/memSelectAll";
			}
			
			return "mem/memForm";
		}
		
		// 회원 조회
		@PostMapping("memSelect")
		public String memberSelect(MemberVO tvo, Model model) {
			logger.info("memberSelect 함수 진입 >>> : ");
			logger.info("memberSelect 함수 진입 tvo >>> : " + tvo);
			logger.info("memberSelect 함수 진입 tvo >>> : " + tvo.getTnum());
			
			List<MemberVO> listS = MemberService.MemberSelect(tvo);
			if (listS.size() > 0) {
				logger.info("memberSelectAll listS.size() >>> : " + listS.size());
				
				model.addAttribute("listS", listS);
				return "mem/memSelect";
			}
			
			return "mem/memSelectAll";
		}
	

}
