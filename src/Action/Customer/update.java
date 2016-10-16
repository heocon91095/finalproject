package Action.Customer;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Action.FactorySessionGet;
import Model.Customer;

public class update extends ActionSupport implements ModelDriven<Customer> {
	Customer customer;
	String customerid;
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
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
		System.out.println(customer.getCustomername());
		System.out.println(customerid);
		ss.update(customer);
		ss.flush();
		ss.close();
		return "success";
	}
	public String getCustomerJson(){
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		Query qr = ss.createQuery("from Customer where customerid = :id");
		qr.setParameter("id", customerid);
		customer = (Customer) qr.list().get(0);
		return "success";
	}
	@Override
	public Customer getModel() {
		// TODO Auto-generated method stub
		return customer;
	}
}
