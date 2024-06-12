package a.b.c.news.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import a.b.c.common.ChabunUtil;
import a.b.c.common.CommonUtils;
import a.b.c.common.FileUploadUtil;
import a.b.c.common.chabun.service.ChabunService;
import a.b.c.news.service.NewsService;
import a.b.c.news.vo.NewsVO;

@Controller
public class NewsController {
	Logger logger = LogManager.getLogger(NewsController.class);
	
	@Autowired(required=false)
	private ChabunService chabunService;
	
	@Autowired(required=false)
	private NewsService newsService;
	
	@GetMapping("newsInsertForm")
	public String newsInsertForm() {
		logger.info("NewsController :: newsInsertForm >>> : ");
		return "news/newsInsertForm";
	}
	
	@PostMapping("newsInsert")
	public String newsInsert(HttpServletRequest req) {
		logger.info("NewsController :: newsInsert >>> : ");
		
		String nnum = ChabunUtil.getMemberChabun("M", chabunService.getNewsChabun().getNnum());
		logger.info("Controller :: newsInsert :: nnum >>> : " + nnum);
		
		FileUploadUtil fu = new FileUploadUtil(	 CommonUtils.NEWS_IMG_UPLOAD_PATH
                								,CommonUtils.NEWS_IMG_FILE_SIZE
                								,CommonUtils.NEWS_EN_CODE);
		boolean bool = fu.imgfileUpload(req);
		logger.info("kosMemberInsert bool >>> : " + bool);
		
		NewsVO nvo = new NewsVO();
		nvo.setNnum(nnum);
		nvo.setNname(fu.getParameter("nname"));
		nvo.setNtitle(fu.getParameter("ntitle"));
		nvo.setNphoto(fu.getFileName("nphoto"));
		nvo.setNcontent(fu.getParameter("ncontent"));
		
		int nCnt = newsService.newsInsert(nvo);
		if (nCnt > 0) {
			logger.info("Controller :: newsInsert :: nCnt >>> : " + nCnt);
			return "news/newsInsert";
		}
			
		return "news/newsInsertForm";
	}
	
	@GetMapping("newsSelectAll")
	public String newsSelectAll(NewsVO nvo, Model model) {
		logger.info("NewsController :: newsSelectAll >>> : ");
		
		List<NewsVO> listAll = newsService.newsSelectAll(nvo);
		if (listAll.size() > 0) {
			logger.info("listAll.size >>> : " + listAll);
			model.addAttribute("listAll", listAll);
			
			model.addAttribute("search_nvo", nvo);
			return "news/newsSelectAll";
		}
		
		return "news/newsInsertForm";
	}
	
	@GetMapping("newsSelect")
	public String newsSelect(NewsVO nvo, Model model) {
		logger.info("NewsController :: newsSelect >>> : " + nvo.getNnum());
		
		List<NewsVO> listS = newsService.newsSelect(nvo);
		if (listS.size() > 0) {
			logger.info("listAll.size >>> : " + listS);
			model.addAttribute("listS", listS);
			
			return "news/newsSelect";
		}
		
		return "news/newsSelectAll";
	}
	
	@GetMapping("newsSelectOne")
	public String newsSelectOne(NewsVO nvo, Model model) {
		logger.info("NewsController :: newsSelectOne >>> : " + nvo.getNnum());
		
		List<NewsVO> listO = newsService.newsSelect(nvo);
		if (listO.size() > 0) {
			logger.info("listAll.size >>> : " + listO);
			model.addAttribute("listO", listO);
			
			return "news/newsSelectOne";
		}
		
		return "news/newsSelectAll";
	}

	@GetMapping("newsUpdate")
	public String newsUpdate(NewsVO nvo) {
		logger.info("NewsController :: newsUpdate >>> : " + nvo.getNnum());
		
		int nCnt = newsService.newsUpdate(nvo);
		if (nCnt > 0) {
			logger.info("Controller :: newsUpdate :: nCnt >>> : " + nCnt);
			return "news/newsUpdate";
		}		
		return "#";
	}
	
	@GetMapping("newsDelete")
	public String newsDelete(NewsVO nvo) {
		logger.info("NewsController :: newsDelete >>> : " + nvo.getNnum());
		
		int nCnt = newsService.newsDelete(nvo);
		if (nCnt > 0) {
			logger.info("Controller :: newsDelete :: nCnt >>> : " + nCnt);
			return "news/newsDelete";
		}
		return "#";
	}
}