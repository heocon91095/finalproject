package Model;
// Generated Nov 26, 2016 9:09:39 PM by Hibernate Tools 5.1.0.Alpha1

/**
 * Customergroup generated by hbm2java
 */
public class Customergroup implements java.io.Serializable {

	private Integer cgroupid;
	private String cgroupname;
	private String cgroupnote;

	public Customergroup() {
	}

	public Customergroup(String cgroupname, String cgroupnote) {
		this.cgroupname = cgroupname;
		this.cgroupnote = cgroupnote;
	}

	public Integer getCgroupid() {
		return this.cgroupid;
	}

	public void setCgroupid(Integer cgroupid) {
		this.cgroupid = cgroupid;
	}

	public String getCgroupname() {
		return this.cgroupname;
	}

	public void setCgroupname(String cgroupname) {
		this.cgroupname = cgroupname;
	}

	public String getCgroupnote() {
		return this.cgroupnote;
	}

	public void setCgroupnote(String cgroupnote) {
		this.cgroupnote = cgroupnote;
	}

}
