package Model;
// Generated Nov 25, 2016 9:02:55 PM by Hibernate Tools 5.1.0.Alpha1

/**
 * Billtemplate generated by hbm2java
 */
public class Billtemplate implements java.io.Serializable {

	private Integer id;
	private String header;
	private String footer;

	public Billtemplate() {
	}

	public Billtemplate(String header, String footer) {
		this.header = header;
		this.footer = footer;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getHeader() {
		return this.header;
	}

	public void setHeader(String header) {
		this.header = header;
	}

	public String getFooter() {
		return this.footer;
	}

	public void setFooter(String footer) {
		this.footer = footer;
	}

}
