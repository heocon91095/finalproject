package Action.Customer;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Action.FactorySessionGet;
import Model.Customer;

public class list extends ActionSupport implements ModelDriven<Customer> {
	Customer customer;
	String group;
	String searchvalue;

	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	List<Customer> customers;

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return "success";
	}

	public String getList() {
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		System.out.println(searchvalue);
		if (searchvalue != null) {
			Query qr = ss.createQuery("from Customer where customername like :value");
			qr.setParameter("value", "%"+searchvalue+"%");
			customers = qr.list();
			System.out.println("1");
		} else if (group != null) {
			Query qr = ss.createQuery("from Customer where customergroup =:group");
			qr.setParameter("group", group);
			customers = qr.list();
			System.out.println("2");
		} else {
			customers = ss.createQuery("from Customer").list();
			System.out.println("3");
		}
		ss.close();
		if (customers != null)
			return "success";
		else {
			return "error";
		}
	}

	public String getSearchvalue() {
		return searchvalue;
	}

	public void setSearchvalue(String searchvalue) {
		this.searchvalue = searchvalue;
	}

	@Override
	public Customer getModel() {
		// TODO Auto-generated method stub
		return null;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public List<Customer> getCustomers() {
		return customers;
	}

	public void setCustomers(List<Customer> customers) {
		this.customers = customers;
	}
}
