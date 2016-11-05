package Action.Sell;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Action.FactorySessionGet;
import Model.Bill;

public class list extends ActionSupport implements ModelDriven<Object> {
	Bill bill;
	List<Object> billd;
	List<Bill> bills;

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		billd = ss.createQuery("from Bill p ,Customer k where p.customerid = k.customerid").list();
		System.out.println(billd.get(0));
		ss.flush();
		ss.close();
		return "success";
	}

	public Bill getBill() {
		return bill;
	}

	public void setBill(Bill bill) {
		this.bill = bill;
	}

	public List<Object> getBilld() {
		return billd;
	}

	public void setBilld(List<Object> billd) {
		this.billd = billd;
	}

	public List<Bill> getBills() {
		return bills;
	}

	public void setBills(List<Bill> bills) {
		this.bills = bills;
	}

	@Override
	public Bill getModel() {
		// TODO Auto-generated method stub
		return bill;
	}

}
