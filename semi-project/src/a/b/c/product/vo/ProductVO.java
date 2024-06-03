package a.b.c.product.vo;

public class ProductVO {

	private String tnum;
	private String pname;
	private int pprice;
	private int pcount;
	private String ptotal;
	
	public ProductVO() {
		super();
	}

	public ProductVO(String tnum, String pname, int pprice, int pcount, String ptotal) {
		super();
		this.tnum = tnum;
		this.pname = pname;
		this.pprice = pprice;
		this.pcount = pcount;
		this.ptotal = ptotal;
	}

	public String getTnum() {
		return tnum;
	}

	public void setTnum(String tnum) {
		this.tnum = tnum;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getPprice() {
		return pprice;
	}

	public void setPprice(int pprice) {
		this.pprice = pprice;
	}

	public int getPcount() {
		return pcount;
	}

	public void setPcount(int pcount) {
		this.pcount = pcount;
	}

	public String getPtotal() {
		return ptotal;
	}

	public void setPtotal(String ptotal) {
		this.ptotal = ptotal;
	}
	
}
