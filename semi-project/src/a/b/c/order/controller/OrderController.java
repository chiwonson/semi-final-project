package a.b.c.order.controller;

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

import a.b.c.common.CommonUtils;
import a.b.c.common.FileUploadUtil;
import a.b.c.common.chabun.service.ChabunService;
import a.b.c.order.service.OrderService;
import a.b.c.order.vo.OrderVO;

@Controller
public class OrderController {
	Logger logger = LogManager.getLogger(OrderController.class);
	
	@Autowired(required=false)
	private ChabunService chabunService;
	
	@Autowired(required=false)	
	private OrderService orderService;

	@PostMapping("orderInsertForm")
	public String orderInsertForm(HttpServletRequest req, Model model) {  // ???? 다시생각
		logger.info("OrderController :: orderInsertForm >>> : ");
		FileUploadUtil fu = new FileUploadUtil(	 CommonUtils.ORDER_IMG_UPLOAD_PATH
                ,CommonUtils.ORDER_IMG_FILE_SIZE
                ,CommonUtils.ORDER_EN_CODE);
		boolean bool = fu.imgfileUpload(req);
		logger.info("kosMemberInsert bool >>> : " + bool);
		OrderVO ovo = new OrderVO();
		ovo.setPnum(fu.getParameter("pnum"));
		ovo.setPname(fu.getParameter("pname"));
		ovo.setPphoto(fu.getFileName("pphoto"));
		ovo.setPprice(fu.getParameter("pprice"));
		ovo.setHcnt(fu.getParameter("hcnt"));
		ovo.setHtotal(fu.getParameter("htotal"));
		
		int nCnt = orderService.orderInsert(ovo);
		logger.info("orderService nCnt >>> : " + nCnt);
		
		if (nCnt > 0) { 
			model.addAttribute("ovo", ovo);
			return "order/orderInsert";
		}
		return "product/productSelect";		
	}
	
	@GetMapping("orderSelectAll")
	public String orderInsert(OrderVO ovo, Model model) {
		logger.info("OrderController :: orderSelectAll >>> : ");
		
		List<OrderVO> listOrderAll = orderService.orderSelectAll(ovo);
		if (listOrderAll.size() > 0) {
			logger.info("orderSelectAll listOrderAll.size() >>> : " + listOrderAll.size());
			
			model.addAttribute("listOrderAll", listOrderAll);

			
			return "order/orderInsertcon";
		}
		
		
		return "product/productSelectAll";
	}
	
	@GetMapping("orderDelete")
	public String orderDelete(OrderVO ovo, Model model) {
		logger.info("OrderController :: orderDelete >>> : ");
		
		int nCnt = orderService.orderDelete(ovo);
		if (nCnt > 0) {
			logger.info("orderDelete nCnt >>> : " + nCnt);
						
			return "order/orderDelete";
		}
		
		return "product/productSelectAll";
	}
}
