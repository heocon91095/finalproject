package pos.sell.action;

import java.util.Date;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Model.Bill;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class update extends ActionSupport {
	Bill bill;
	String customerid;
	int billid;
	int total;
	int tax;
	int pay;
	int excess;
	String note;
	String status;

	public int getBillid() {
		return billid;
	}

	public void setBillid(int billid) {
		this.billid = billid;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCustomerid() {
		return customerid;
	}

	public void setCustomerid(String customerid) {
		this.customerid = customerid;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getTax() {
		return tax;
	}

	public void setTax(int tax) {
		this.tax = tax;
	}

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public int getExcess() {
		return excess;
	}

	public void setExcess(int excess) {
		this.excess = excess;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Bill getBill() {
		return bill;
	}

	public void setBill(Bill bill) {
		this.bill = bill;
	}

	@Action(value = "/updatebill", results = { @Result(name = "success", type = "json"),
			@Result(name = "error", location = "/Pages/Pos/Login.jsp") })
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		System.out.println(customerid);
		Date date = new Date();
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		bill = (Bill) ss.createQuery("from Bill where billid =:id").setParameter("id", billid).uniqueResult();
		bill.setCustomerid(customerid);
		bill.setExcess(excess);
		bill.setNote(note);
		bill.setPay(pay);
		bill.setTotal(total);
		bill.setTax(tax);
		bill.setStatus(status);
		System.out.println(bill.getTotal());
		ss.update(bill);
		ss.flush();
		ss.close();
		return "success";
	}
}
