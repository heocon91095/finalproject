package Model;
// Generated Nov 17, 2016 7:58:09 PM by Hibernate Tools 5.2.0.Beta1

import java.util.Date;

/**
 * Bill generated by hbm2java
 */
public class Bill implements java.io.Serializable {

	private Integer billid;
	private String customerid;
	private int total;
	private int tax;
	private int pay;
	private int excess;
	private String note;
	private String status;
	private Date day;

	public Bill() {
	}

	public Bill(int total, int tax, int pay, int excess, String status) {
		this.total = total;
		this.tax = tax;
		this.pay = pay;
		this.excess = excess;
		this.status = status;
	}

	public Bill(String customerid, int total, int tax, int pay, int excess, String note, String status, Date day) {
		this.customerid = customerid;
		this.total = total;
		this.tax = tax;
		this.pay = pay;
		this.excess = excess;
		this.note = note;
		this.status = status;
		this.day = day;
	}

	public Integer getBillid() {
		return this.billid;
	}

	public void setBillid(Integer billid) {
		this.billid = billid;
	}

	public String getCustomerid() {
		return this.customerid;
	}

	public void setCustomerid(String customerid) {
		this.customerid = customerid;
	}

	public int getTotal() {
		return this.total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getTax() {
		return this.tax;
	}

	public void setTax(int tax) {
		this.tax = tax;
	}

	public int getPay() {
		return this.pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public int getExcess() {
		return this.excess;
	}

	public void setExcess(int excess) {
		this.excess = excess;
	}

	public String getNote() {
		return this.note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getDay() {
		return this.day;
	}

	public void setDay(Date day) {
		this.day = day;
	}

}
