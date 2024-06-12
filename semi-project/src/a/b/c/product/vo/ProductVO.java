package a.b.c.product.vo;

public class ProductVO {

	private String pnum;
	private String pname;
	private String pphoto;
	private String pprice;
	private String pcnt;
	private String deleteyn;
	private String insertdate;
	private String updatedate;
	
	
	private String pageSize;
	private String groupSize;
	private String curPage;
	private String totalCount;
	
	public ProductVO() {
		super();
	}

	public ProductVO(String pnum, String pname, String pphoto, String pprice, String pcnt, String deleteyn, String insertdate,
			String updatedate, String pageSize, String groupSize, String curPage, String totalCount) {
		super();
		this.pnum = pnum;
		this.pname = pname;
		this.pphoto = pphoto;
		this.pprice = pprice;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.pageSize = pageSize;
		this.groupSize = groupSize;
		this.curPage = curPage;
		this.totalCount = totalCount;
	}

	public String getPnum() {
		return pnum;
	}

	public void setPnum(String pnum) {
		this.pnum = pnum;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPphoto() {
		return pphoto;
	}

	public void setPphoto(String pphoto) {
		this.pphoto = pphoto;
	}

	public String getPprice() {
		return pprice;
	}

	public void setPprice(String pprice) {
		this.pprice = pprice;
	}
	
	public String getPcnt() {
		return pcnt;
	}

	public void setPcnt(String pcnt) {
		this.pcnt = pcnt;
	}

	public String getDeleteyn() {
		return deleteyn;
	}

	public void setDeleteyn(String deleteyn) {
		this.deleteyn = deleteyn;
	}

	public String getInsertdate() {
		return insertdate;
	}

	public void setInsertdate(String insertdate) {
		this.insertdate = insertdate;
	}

	public String getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}

	public String getPageSize() {
		return pageSize;
	}

	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}

	public String getGroupSize() {
		return groupSize;
	}

	public void setGroupSize(String groupSize) {
		this.groupSize = groupSize;
	}

	public String getCurPage() {
		return curPage;
	}

	public void setCurPage(String curPage) {
		this.curPage = curPage;
	}

	public String getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}
	
	
	
}
