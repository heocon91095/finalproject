package Model;
// Generated Nov 26, 2016 9:09:39 PM by Hibernate Tools 5.1.0.Alpha1

/**
 * Suplier generated by hbm2java
 */
public class Suplier implements java.io.Serializable {

	private Integer suplierid;
	private String supliername;
	private String phone;
	private String address;
	private String supliergroup;
	private String mail;

	public Suplier() {
	}

	public Suplier(String supliername, String phone, String address, String mail) {
		this.supliername = supliername;
		this.phone = phone;
		this.address = address;
		this.mail = mail;
	}

	public Suplier(String supliername, String phone, String address, String supliergroup, String mail) {
		this.supliername = supliername;
		this.phone = phone;
		this.address = address;
		this.supliergroup = supliergroup;
		this.mail = mail;
	}

	public Integer getSuplierid() {
		return this.suplierid;
	}

	public void setSuplierid(Integer suplierid) {
		this.suplierid = suplierid;
	}

	public String getSupliername() {
		return this.supliername;
	}

	public void setSupliername(String supliername) {
		this.supliername = supliername;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getSupliergroup() {
		return this.supliergroup;
	}

	public void setSupliergroup(String supliergroup) {
		this.supliergroup = supliergroup;
	}

	public String getMail() {
		return this.mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

}
