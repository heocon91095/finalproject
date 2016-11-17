package ecom.cart.action;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;

import Model.Customer;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class add2cart extends ActionSupport {
	Customer customer;
	int customerid;

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public int getCustomerid() {
		return customerid;
	}

	public void setCustomerid(int customerid) {
		this.customerid = customerid;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		try {
			Customer cus = (Customer) ss.createQuery("from Customer where address = :address")
					.setParameter("address", customer.getAddress()).uniqueResult();
			cus = customer;
			ss.update(cus);
			ss.flush();
			ss.close();
			customerid = cus.getCustomerid();
		} catch (Exception e) {
			ss.save(customer);
			ss.flush();
			ss.close();
			customerid = customer.getCustomerid();
		}
		return "succcess";
	}
}
