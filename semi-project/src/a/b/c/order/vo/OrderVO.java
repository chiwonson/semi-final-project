package a.b.c.order.vo;

public class OrderVO {

	private String pnum;
	private String pname;
	private String pphoto;
	private String hcnt;
	private String pprice;
	private String htotal;
	private String insertdate;
	
	public OrderVO() {
		super();
	}

	public OrderVO(String pnum, String pname, String pphoto, String hcnt, String pprice, String htotal,
			String insertdate) {
		super();
		this.pnum = pnum;
		this.pname = pname;
		this.pphoto = pphoto;
		this.hcnt = hcnt;
		this.pprice = pprice;
		this.htotal = htotal;
		this.insertdate = insertdate;
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

	public String getHcnt() {
		return hcnt;
	}

	public void setHcnt(String hcnt) {
		this.hcnt = hcnt;
	}

	public String getPprice() {
		return pprice;
	}

	public void setPprice(String pprice) {
		this.pprice = pprice;
	}

	public String getHtotal() {
		return htotal;
	}

	public void setHtotal(String htotal) {
		this.htotal = htotal;
	}

	public String getInsertdate() {
		return insertdate;
	}

	public void setInsertdate(String insertdate) {
		this.insertdate = insertdate;
	}
	
	
}
