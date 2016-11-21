package pos.sell.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;

import Model.Bill;
import Model.Billdetail;
import Model.Customer;
import pos.common.action.FactorySessionGet;

public class print extends ActionSupport {
	int billid;
	Bill bill;
	List<Billdetail> billdetail;
	Customer customer;
	public Bill getBill() {
		return bill;
	}

	public void setBill(Bill bill) {
		this.bill = bill;
	}

	public List<Billdetail> getBilldetail() {
		return billdetail;
	}

	public void setBilldetail(List<Billdetail> billdetail) {
		this.billdetail = billdetail;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public int getBillid() {
		return billid;
	}

	public void setBillid(int billid) {
		this.billid = billid;
	}

	@Action(value = "/printbill", results = { @Result(name = "success", location = "/Pages/Billtemplate/sell.jsp") })
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		bill = (Bill) ss.createQuery("from Bill where billid =:billid").setParameter("billid", billid).uniqueResult();
		billdetail = ss.createQuery("from Billdetail where billid =:billid").setParameter("billid", billid).list();
		customer = (Customer) ss.createQuery("from Customer where customerid =:id").setParameter("id", bill.getCustomerid()).uniqueResult();
		ss.close();
		return super.execute();
	}
}
