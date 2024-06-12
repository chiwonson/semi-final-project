package a.b.c.mem.vo;

public class MemberVO {
	
	private String tnum;
	private String tname;
	private String tid;
	private String tpw;
	private String tphoto;
	private String tgender;
	private String temail;
	private String thobby;
	private String tbirth;
	
	
	public MemberVO() {
	}

	public MemberVO(String tnum, String tname, String tid, String tpw, String tphoto, 
					String tgender, String temail, 
					String thobby,String tbirth) {
		this.tnum = tnum;
		this.tname = tname;
		this.tid = tid;
		this.tpw = tpw;
		this.tphoto = tphoto;
		this.tgender = tgender;
		this.temail = temail;
		this.thobby = thobby;
		this.tbirth = tbirth;		
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
	
	public String getTgender() {
		return tgender;
	}

	public void setTgender(String tgender) {
		this.tgender = tgender;
	}
	

	public String getTemail() {
		return temail;
	}

	public void setTemail(String temail) {
		this.temail = temail;
	}


	public String getThobby() {
		return thobby;
	}

	public void setThobby(String thobby) {
		this.thobby = thobby;
	}


	public String getTbirth() {
		return tbirth;
	}

	public void setTbirth(String tbirth) {
		this.tbirth = tbirth;
	}


	//search 변수
	private String keyword;			// 검색어
	private String searchFilter;	// 검색조건
	

	public MemberVO(String keyword, String searchFilter) {

		this.keyword = keyword;
		this.searchFilter = searchFilter;
		
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getSearchFilter() {
		return searchFilter;
	}

	public void setSearchFilter(String searchFilter) {
		this.searchFilter = searchFilter;
	}

	
	
	
	
	
	
	
	
	
}
