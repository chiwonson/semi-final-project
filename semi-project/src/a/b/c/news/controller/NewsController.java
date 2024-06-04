package a.b.c.news.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import a.b.c.common.ChabunUtil;
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
	
	@GetMapping("newsInsert")
	public String newsInsert(HttpServletRequest req) {
		logger.info("NewsController :: newsInsert >>> : ");
		
		String mnum = ChabunUtil.getMemberChabun("M", chabunService.getNewsChabun().getNnum());
		logger.info("kosMemberInsert 함수 mnum >>> : " + mnum);
		
		return "news/newsInsert";
	}
	
	@GetMapping("newsSelectAll")
	public String newsSelectAll(NewsVO nvo, Model model) {
		logger.info("NewsController :: newsSelectAll >>> : ");
		
		
		return "news/newsSelectAll";
	}
	
	@GetMapping("newsSelect")
	public String newsSelect(NewsVO nvo, Model model) {
		logger.info("NewsController :: newsSelect >>> : ");
		
		
		return "news/newsSelect";
	}

	@GetMapping("newsUpdate")
	public String newsUpdate(NewsVO nvo) {
		logger.info("NewsController :: newsUpdate >>> : ");
		
		
		return "news/newsUpdate";
	}
	
	@GetMapping("newsDelete")
	public String newsDelete(NewsVO nvo) {
		logger.info("NewsController :: newsDelete >>> : ");
		
		
		return "news/newsDelete";
	}
}