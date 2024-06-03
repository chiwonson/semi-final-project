package a.b.c.news.controller;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import a.b.c.news.service.NewsService;

@Controller
public class NewsController {
	Logger logger = LogManager.getLogger(NewsController.class);
	
	@Autowired(required=false)
	private NewsService newsService;
	
}