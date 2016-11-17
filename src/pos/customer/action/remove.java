package Action.Customer;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;

import Action.FactorySessionGet;
import Model.Customer;

public class remove extends ActionSupport {
	String customerid;
	public String getCustomerid() {
		return customerid;
	}
	public void setCustomerid(String customerid) {
		this.customerid = customerid;
	}
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		Query qr = ss.createQuery("delete Customer where customerid = :id");
		qr.setParameter("id", customerid);
		qr.executeUpdate();
		ss.flush();
		ss.close();
		return "success";
	}
}
