package a.b.c.board.vo;

public class BoardVO {
	
	private String tnum;
	private String tname;
	private String tpw;
	private String tphoto
	private String pname;
	private int price;
	private int count;
	private String total;
	private String tcontent;
	private String insertdate;
	private String detail;
	
	public BoardVO() {
		
	}
	
	public BoardVO(String tnum, String tname, String tpw, String pname, int price, int count, String total, String tcontent, String insertdate, String detail) {
		
		this.tnum = tnum;
		this.tname = tname;
		this.tpw = tpw;
		this.tphoto = tphoto;
		this.pname = pname;
		this.price = price;
		this.count = count;
		this.tcontent = tcontent;
		this.insertdate = insertdate;
		this.detail = detail;
		

	}

	public String getTnum() {
		return tnum;
	}

	public void setTnum(String tnum) {
		this.tnum = tnum;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public String getTpw() {
		return tpw;
	}

	public void setTpw(String tpw) {
		this.tpw = tpw;
	}

	public String getTphoto() {
		return tphoto;
	}

	public void setTphoto(String tphoto) {
		this.tphoto = tphoto;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public String getTcontent() {
		return tcontent;
	}

	public void setTcontent(String tcontent) {
		this.tcontent = tcontent;
	}

	public String getInsertdate() {
		return insertdate;
	}

	public void setInsertdate(String insertdate) {
		this.insertdate = insertdate;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}
	
}