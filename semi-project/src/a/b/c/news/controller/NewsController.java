package a.b.c.news.controller;

public class NewsController {

	private String nnum;
	private String nname;
	private String ntitle;
	private String ncontent;
	private String nphoto;
	private String deleteyn;
	private String insertdate;
	private String updatedate;
	
	public NewsController() {
		super();
	}

	public NewsController(String nnum, String nname, String ntitle, String ncontent, String nphoto, String deleteyn,
			String insertdate, String updatedate) {
		super();
		this.nnum = nnum;
		this.nname = nname;
		this.ntitle = ntitle;
		this.ncontent = ncontent;
		this.nphoto = nphoto;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
	}

	public String getNnum() {
		return nnum;
	}

	public String getNname() {
		return nname;
	}

	public String getNtitle() {
		return ntitle;
	}

	public String getNcontent() {
		return ncontent;
	}

	public String getNphoto() {
		return nphoto;
	}

	public String getDeleteyn() {
		return deleteyn;
	}

	public String getInsertdate() {
		return insertdate;
	}

	public String getUpdatedate() {
		return updatedate;
	}

	public void setNnum(String nnum) {
		this.nnum = nnum;
	}

	public void setNname(String nname) {
		this.nname = nname;
	}

	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}

	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}

	public void setNphoto(String nphoto) {
		this.nphoto = nphoto;
	}

	public void setDeleteyn(String deleteyn) {
		this.deleteyn = deleteyn;
	}

	public void setInsertdate(String insertdate) {
		this.insertdate = insertdate;
	}

	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}
	
}
