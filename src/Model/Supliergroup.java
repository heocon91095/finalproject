package Model;
// Generated Oct 19, 2016 8:56:35 PM by Hibernate Tools 5.1.0.Alpha1

/**
 * Supliergroup generated by hbm2java
 */
public class Supliergroup implements java.io.Serializable {

	private Integer sgroupid;
	private String sgroupname;
	private String sgroupnote;

	public Supliergroup() {
	}

	public Supliergroup(String sgroupname) {
		this.sgroupname = sgroupname;
	}

	public Supliergroup(String sgroupname, String sgroupnote) {
		this.sgroupname = sgroupname;
		this.sgroupnote = sgroupnote;
	}

	public Integer getSgroupid() {
		return this.sgroupid;
	}

	public void setSgroupid(Integer sgroupid) {
		this.sgroupid = sgroupid;
	}

	public String getSgroupname() {
		return this.sgroupname;
	}

	public void setSgroupname(String sgroupname) {
		this.sgroupname = sgroupname;
	}

	public String getSgroupnote() {
		return this.sgroupnote;
	}

	public void setSgroupnote(String sgroupnote) {
		this.sgroupnote = sgroupnote;
	}

}