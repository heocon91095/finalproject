package Action.Customer;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Action.FactorySessionGet;
import Model.Customer;

public class add extends ActionSupport implements ModelDriven<Customer> {
	Customer customer;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		Customer cm = new Customer(customer.getCustomerid(), customer.getCustomername(), customer.getPhone(),
				customer.getAddress(), customer.getCustomergroup(), customer.getUsername(), customer.getMail());
		ss.save(cm);
		ss.flush();
		ss.close();
		return "success";
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	@Override
	public Customer getModel() {
		// TODO Auto-generated method stub
		return customer;
	}
}
