package Model;
// Generated Nov 20, 2016 11:37:27 PM by Hibernate Tools 5.2.0.Beta1

/**
 * Productgroup generated by hbm2java
 */
public class Productgroup implements java.io.Serializable {

	private Integer pgroupid;
	private String pgroupname;
	private String pgroupnote;

	public Productgroup() {
	}

	public Productgroup(String pgroupname) {
		this.pgroupname = pgroupname;
	}

	public Productgroup(String pgroupname, String pgroupnote) {
		this.pgroupname = pgroupname;
		this.pgroupnote = pgroupnote;
	}

	public Integer getPgroupid() {
		return this.pgroupid;
	}

	public void setPgroupid(Integer pgroupid) {
		this.pgroupid = pgroupid;
	}

	public String getPgroupname() {
		return this.pgroupname;
	}

	public void setPgroupname(String pgroupname) {
		this.pgroupname = pgroupname;
	}

	public String getPgroupnote() {
		return this.pgroupnote;
	}

	public void setPgroupnote(String pgroupnote) {
		this.pgroupnote = pgroupnote;
	}

}
