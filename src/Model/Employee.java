package Model;
// Generated Nov 6, 2016 4:26:52 PM by Hibernate Tools 5.2.0.Beta1

/**
 * Employee generated by hbm2java
 */
public class Employee implements java.io.Serializable {

	private Integer employeeid;
	private String employeename;
	private String phone;
	private String address;
	private String mail;
	private String username;

	public Employee() {
	}

	public Employee(String employeename, String phone, String address, String mail, String username) {
		this.employeename = employeename;
		this.phone = phone;
		this.address = address;
		this.mail = mail;
		this.username = username;
	}

	public Integer getEmployeeid() {
		return this.employeeid;
	}

	public void setEmployeeid(Integer employeeid) {
		this.employeeid = employeeid;
	}

	public String getEmployeename() {
		return this.employeename;
	}

	public void setEmployeename(String employeename) {
		this.employeename = employeename;
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

	public String getMail() {
		return this.mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

}