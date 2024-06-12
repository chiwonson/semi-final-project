package a.b.c.board.controller;

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

import a.b.c.board.service.BoardService;
import a.b.c.board.vo.BoardVO;
import a.b.c.common.ChabunUtil;
import a.b.c.common.CommonUtils;
import a.b.c.common.FileUploadUtil;
import a.b.c.common.chabun.service.ChabunService;



@Controller
public class BoardController {
	Logger logger = LogManager.getLogger(BoardController.class);
	
	// 컨트롤러에서 채번 서비스 연결 
	@Autowired(required=false)
	private ChabunService chabunService;
	
	// 컨트롤러에서 회원 서비스 연결 
	@Autowired(required=false)
	private BoardService boardService;

	
	@GetMapping("boardForm")
	public String BoardForm() {
		logger.info("BoardForm 함수 진입 >>> : ");
		
		return "board/boardForm";
	}
	
	
	// 게시판 글쓰기 
	@PostMapping("boardInsert")
	public String BoardInsert(HttpServletRequest req) {
		logger.info("BoardInsert 함수 진입 >>> : ");	
		
		// 채번 구하기
		String num = chabunService.getBoardChabun().getBnum();
		logger.info("BoardInsert num >>> : " + num);
		String bnum = ChabunUtil.getBoardChabun("N", num);
		logger.info("BoardInsert bnum >>> : " + bnum);
			
		// 이미지 업로드 
		FileUploadUtil fu = new FileUploadUtil(	 CommonUtils.BOARD_IMG_UPLOAD_PATH
								                ,CommonUtils.BOARD_IMG_FILE_SIZE
								                ,CommonUtils.BOARD_EN_CODE);
		
		// 이미지 파일 원본 사이즈 
		boolean bool = fu.imgfileUpload(req);
		logger.info("BoardInsert bool >>> : " + bool);

		BoardVO _bvo = null;
		_bvo = new BoardVO();
			
		_bvo.setBnum(bnum);
		_bvo.setBsubject(fu.getParameter("bsubject"));
		_bvo.setBname(fu.getParameter("bname"));
		_bvo.setBpw(fu.getParameter("bpw"));
		_bvo.setBcontent(fu.getParameter("bcontent"));
		_bvo.setBfile(fu.getFileName("bfile"));
		
		// 서비스 호출
		int nCnt = boardService.BoardInsert(_bvo);
		if (nCnt > 0) { 
			logger.info("BoardInsert nCnt >>> : " + nCnt);
			return "board/boardInsert";
		}
		return "board/boardForm";
	}
	
	// 게시판 전체 조회 
	@GetMapping("boardSelectAll")
	public String BoardSelectAll(BoardVO bvo, Model model) {
		logger.info("BoardSelectAll 함수 진입 >>> : ");
		
		// 페이징 처리 ====================================================================
		int pageSize = CommonUtils.BOARD_PAGE_SIZE;
		int groupSize = CommonUtils.BOARD_GROUP_SIZE;
		int curPage = CommonUtils.BOARD_CUR_PAGE;
		int totalCount = CommonUtils.BOARD_TOTAL_COUNT;
		
		if (bvo.getCurPage() !=null){
			curPage = Integer.parseInt(bvo.getCurPage());
		}
		
		bvo.setPageSize(String.valueOf(pageSize));
		bvo.setGroupSize(String.valueOf(groupSize));
		bvo.setCurPage(String.valueOf(curPage));
		bvo.setTotalCount(String.valueOf(totalCount));

		logger.info("SpringFileUploadSelectAll bvo.getPageSize() >>> : 	" + bvo.getPageSize());
		logger.info("SpringFileUploadSelectAll bvo.getGroupSize() >>> : 	" + bvo.getGroupSize());
		logger.info("SpringFileUploadSelectAll bvo.getCurPage() >>> : 	" + bvo.getCurPage());
		logger.info("SpringFileUploadSelectAll bvo.getTotalCount() >>> : " + bvo.getTotalCount());
		// 페이징 처리 ======================================================================================
		
		// 서비스 호출
		List<BoardVO> listAll = boardService.BoardSelectAll(bvo);		
		if (listAll.size() > 0) { 
			logger.info("BoardSelectAll listAll.size() >>> : " + listAll.size());
			
			model.addAttribute("pagingBVO", bvo);				
			model.addAttribute("listAll", listAll);
			return "board/boardSelectAll";
		}		
		return "board/boardSelectAll";
	}
	
	// 게시글 조회 
	@GetMapping("boardSelect")
	public String BoardSelect(BoardVO bvo, Model model) {
		logger.info("BoardSelect 함수 진입 >>> : ");
		
		logger.info("BoardSelect 함수 진입  bvo.getBnum() >>> : " + bvo.getBnum());
		
		// 서비스 호출
		List<BoardVO> listS = boardService.BoardSelect(bvo);		
		if (listS.size() == 1) { 
			logger.info("BoardSelect listS.size() >>> : " + listS.size());
			
			int bhitCnt = boardService.BoardBhit(bvo);
			logger.info("BoardSelect bhitCnt >>> : " + bhitCnt);
					
			model.addAttribute("listS", listS);
			return "board/boardSelect";
		}		
		return "board/boardSelectAll";
	}
		
	// 게시글 내용보기  
	@GetMapping("boardSelectContents")
	public String BoardSelectContents(BoardVO bvo, Model model) {
		logger.info("BoardSelectContents 함수 진입 >>> : ");
		
		logger.info("BoardSelectContents 함수 진입  bvo.getBnum() >>> : " + bvo.getBnum());
		
		// 서비스 호출
		List<BoardVO> listS = boardService.BoardSelect(bvo);		
		if (listS.size() == 1) { 
			logger.info("BoardSelect listS.size() >>> : " + listS.size());
			
			int bhitCnt = boardService.BoardBhit(bvo);
			logger.info("BoardSelect BhitCnt >>> : " + bhitCnt);
					
			model.addAttribute("listS", listS);
			return "board/boardSelectContents";
		}		
		return "board/boardSelectAll";
	}
	
	// 게시글 수정 
	@GetMapping("boardUpdate")
	public String BoardUpdate(BoardVO bvo, Model model) {
		logger.info("BoardUpdate 함수 진입 >>> : ");
		logger.info("BoardDelete 함수 진입 bvo.getNum() >>> : " + bvo.getBnum());
		
		int nCnt = boardService.BoardUpdate(bvo);
		
		if (nCnt > 0) { 
			logger.info("BoardUpdate nCnt >>> : " + nCnt);
			return "board/boardUpdate";
		}
		return "#";		
	}
	
	// 게시글 삭제
	@GetMapping("boardDelete")
	public String BoardDelete(BoardVO bvo, Model model) {
		logger.info("BoardDelete 함수 진입 >>> : ");
		logger.info("BoardDelete 함수 진입 bvo.getBnum() >>> : " + bvo.getBnum());
		
		int nCnt = boardService.BoardDelete(bvo);
		
		if (nCnt > 0) { 
			logger.info("BoardDelete nCnt >>> : " + nCnt);
			return "board/boardDelete";
		}
		return "#";		
	}
	
	// 패스워드 체크하기
	@PostMapping("boardPwCheck")
	@ResponseBody
	public Object BoardPwCheck(BoardVO bvo) {
		logger.info("BoardPwCheck 함수 진입 >>> :");		
		logger.info("BoardPwCheck bvo.getBpw()() >>> : " + bvo.getBpw());			
		
		List<BoardVO> list = boardService.BoardPwCheck(bvo);			
		logger.info("BoardPwCheck list.size() >>> : " + list.size());
		
		String msg = "";		
		if (list.size() == 1) {msg = "ID_YES";}  
		else { msg = "ID_NO";}  
		
		return msg;		
	}

}
