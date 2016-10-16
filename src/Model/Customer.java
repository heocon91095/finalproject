package Model;
// Generated Oct 16, 2016 3:14:53 AM by Hibernate Tools 5.1.0.Alpha1

/**
 * Customer generated by hbm2java
 */
public class Customer implements java.io.Serializable {

	private String customerid;
	private String customername;
	private String phone;
	private String address;
	private String customergroup;
	private String username;
	private String mail;

	public Customer() {
	}

	public Customer(String customerid, String customername, String phone, String address) {
		this.customerid = customerid;
		this.customername = customername;
		this.phone = phone;
		this.address = address;
	}

	public Customer(String customerid, String customername, String phone, String address, String customergroup,
			String username, String mail) {
		this.customerid = customerid;
		this.customername = customername;
		this.phone = phone;
		this.address = address;
		this.customergroup = customergroup;
		this.username = username;
		this.mail = mail;
	}

	public String getCustomerid() {
		return this.customerid;
	}

	public void setCustomerid(String customerid) {
		this.customerid = customerid;
	}

	public String getCustomername() {
		return this.customername;
	}

	public void setCustomername(String customername) {
		this.customername = customername;
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

	public String getCustomergroup() {
		return this.customergroup;
	}

	public void setCustomergroup(String customergroup) {
		this.customergroup = customergroup;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getMail() {
		return this.mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

}
