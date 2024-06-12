package a.b.c.product.controller;

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
import a.b.c.product.service.ProductService;
import a.b.c.product.vo.ProductVO;

@Controller
public class ProductController {
	Logger logger = LogManager.getLogger(ProductController.class);
	
	@Autowired(required=false)
	private ChabunService chabunService;
	
	@Autowired(required=false)
	private ProductService productService;

	@GetMapping("productInsertForm")
	public String productInsertForm() {
		logger.info("ProductController :: productInsertForm >>> : ");	
		return "product/productInsertForm";
	}
	
	@PostMapping("productInsert")
	public String productInsert(HttpServletRequest req) {
		logger.info("ProductController :: productInsert >>> : ");	
		
		String pnum = ChabunUtil.getProductChabun("Y", chabunService.getProductChabun().getPnum());
		logger.info("productInsert pnum >>> : " + pnum);
		
		FileUploadUtil fu = new FileUploadUtil(	 CommonUtils.PRODUCT_IMG_UPLOAD_PATH
												,CommonUtils.PRODUCT_IMG_FILE_SIZE
                								,CommonUtils.PRODUCT_EN_CODE);
		boolean bool = fu.imgfileUpload(req);			
		logger.info("kosmoProductInsert bool >>> : " + bool);
		
		ProductVO pvo = new ProductVO();
		
		pvo.setPnum(pnum);
		pvo.setPname(fu.getParameter("pname"));
		pvo.setPphoto(fu.getFileName("pphoto"));
		pvo.setPprice(fu.getParameter("pprice"));
		pvo.setPcnt(fu.getParameter("pcnt"));
		
		int nCnt = productService.productInsert(pvo);
		logger.info("productInsert nCnt >>> : " + nCnt);
		
		if (nCnt > 0) { return "product/productInsert";}
		return "product/productInsertForm";
	}
	
	@GetMapping("productSelectAll")
	public String productSelectAll(ProductVO pvo, Model model) {
		logger.info("ProductController :: productSelectAll >>> : ");	
		
		int pageSize = CommonUtils.PRODUCT_PAGE_SIZE;
		int groupSize = CommonUtils.PRODUCT_GROUP_SIZE;
		int curPage = CommonUtils.PRODUCT_CUR_PAGE;
		int totalCount = CommonUtils.PRODUCT_TOTAL_COUNT;
		
		if (pvo.getCurPage() !=null){
			curPage = Integer.parseInt(pvo.getCurPage());
		}
		pvo.setPageSize(String.valueOf(pageSize));
		pvo.setGroupSize(String.valueOf(groupSize));
		pvo.setCurPage(String.valueOf(curPage));
		pvo.setTotalCount(String.valueOf(totalCount));
		logger.info("productSelectAll pvo.getPageSize() >>> : " + pvo.getPageSize());
		logger.info("productSelectAll pvo.getGroupSize() >>> : " + pvo.getGroupSize());
		logger.info("productSelectAll pvo.getCurPage() >>> : " + pvo.getCurPage());
		logger.info("productSelectAll pvo.getTotalCount() >>> : " + pvo.getTotalCount());
		
		List<ProductVO> listAll = productService.productSelectAll(pvo);
		if (listAll.size()>0) {
			logger.info("productSelectAll listAll.size() >>> : " + listAll.size());
			
			model.addAttribute("pagingPVO", pvo);
			model.addAttribute("listAll", listAll);
			return "product/productSelectAll";
		}
		return "product/productInsertForm";
	}
	
	@GetMapping("productSelect")
	public String productSelect(ProductVO pvo, Model model) {
		logger.info("ProductController :: productSelect >>> : ");
		
		logger.info("productSelect 함수 진입::: pvo.getpnum() >>> : " + pvo.getPnum());
		
		List<ProductVO> listS = productService.productSelect(pvo);
		if (listS.size()>0) {
			logger.info("productSelectAll listS.size() >>> : " + listS.size());
			model.addAttribute("listS", listS);
			return "product/productSelect";
		}
		return "product/productSelectAll";
	}
}