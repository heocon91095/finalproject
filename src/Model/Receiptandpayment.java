package Model;
// Generated Nov 21, 2016 9:24:55 PM by Hibernate Tools 5.1.0.Alpha1

/**
 * Receiptandpayment generated by hbm2java
 */
public class Receiptandpayment implements java.io.Serializable {

	private Integer billid;
	private String billtype;
	private String receivername;
	private String phone;
	private Integer cash;
	private String reason;
	private String address;
	private String date;

	public Receiptandpayment() {
	}

	public Receiptandpayment(String billtype, String receivername, String phone, Integer cash, String reason,
			String address, String date) {
		this.billtype = billtype;
		this.receivername = receivername;
		this.phone = phone;
		this.cash = cash;
		this.reason = reason;
		this.address = address;
		this.date = date;
	}

	public Integer getBillid() {
		return this.billid;
	}

	public void setBillid(Integer billid) {
		this.billid = billid;
	}

	public String getBilltype() {
		return this.billtype;
	}

	public void setBilltype(String billtype) {
		this.billtype = billtype;
	}

	public String getReceivername() {
		return this.receivername;
	}

	public void setReceivername(String receivername) {
		this.receivername = receivername;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getCash() {
		return this.cash;
	}

	public void setCash(Integer cash) {
		this.cash = cash;
	}

	public String getReason() {
		return this.reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDate() {
		return this.date;
	}

	public void setDate(String date) {
		this.date = date;
	}

}
