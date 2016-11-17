package pos.customer.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Model.Customer;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class get extends ActionSupport implements ModelDriven<Customer> {
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

	@Action(value = "/getcustomer", results = { @Result(name = "success", type = "json"),
			@Result(name = "error", location = "/Pages/Pos/Login.jsp") })
	public String getCustomerJson() {
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
