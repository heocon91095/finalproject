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
public class update extends ActionSupport implements ModelDriven<Customer> {
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

	@Action(value = "/updatecustomer", results = { @Result(name = "success", type = "json"),
			@Result(name = "error", location = "/Pages/Pos/Login.jsp") })
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

	@Override
	public Customer getModel() {
		// TODO Auto-generated method stub
		return customer;
	}
}
