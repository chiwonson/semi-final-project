package a.b.c.mem.vo;

public class MemberVO {
	
	private String tnum;
	private String tname;
	private String tid;
	private String tpw;
	private String tphoto;
	
	public MemberVO() {
	}

	public MemberVO(String tnum, String tname, String tid, String tpw, String tphoto) {
		this.tnum = tnum;
		this.tname = tname;
		this.tid = tid;
		this.tpw = tpw;
		this.tphoto = tphoto;
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

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
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
	
	
	
}
