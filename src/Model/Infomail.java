package Model;
// Generated Nov 27, 2016 10:26:32 PM by Hibernate Tools 5.1.0.Alpha1

/**
 * Infomail generated by hbm2java
 */
public class Infomail implements java.io.Serializable {

	private Integer id;
	private String mail;

	public Infomail() {
	}

	public Infomail(String mail) {
		this.mail = mail;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getMail() {
		return this.mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

}