package a.b.c.news.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import a.b.c.news.service.NewsService;
import a.b.c.news.vo.NewsVO;

@Controller
public class NewsController {
	Logger logger = LogManager.getLogger(NewsController.class);
	
	@Autowired(required=false)
	private NewsService newsService;
	
	public String newsInsertForm() {
		
		return "";
	}
	
	public String newsInsert(HttpServletRequest req) {
		
		return "";
	}
	
	public String newsSelectAll(NewsVO nvo, Model model) {
		
		return "";
	}
	
	public String newsSelect(NewsVO nvo, Model model) {
		
		return "";
	}

	public String newsUpdate(NewsVO nvo) {
	
		return "";
	}
	
	public String newsDelete(NewsVO nvo) {
		
		return "";
	}
}