package Model;
// Generated Nov 17, 2016 7:58:09 PM by Hibernate Tools 5.2.0.Beta1

/**
 * Producergroup generated by hbm2java
 */
public class Producergroup implements java.io.Serializable {

	private Integer groupid;
	private String groupname;
	private String groupnote;

	public Producergroup() {
	}

	public Producergroup(String groupname, String groupnote) {
		this.groupname = groupname;
		this.groupnote = groupnote;
	}

	public Integer getGroupid() {
		return this.groupid;
	}

	public void setGroupid(Integer groupid) {
		this.groupid = groupid;
	}

	public String getGroupname() {
		return this.groupname;
	}

	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}

	public String getGroupnote() {
		return this.groupnote;
	}

	public void setGroupnote(String groupnote) {
		this.groupnote = groupnote;
	}

}
