package pos.customer.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;

import Model.Customer;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class remove extends ActionSupport {
	int customerid;

	public int getCustomerid() {
		return customerid;
	}

	public void setCustomerid(int customerid) {
		this.customerid = customerid;
	}

	@Action(value = "/removecustomer", results = { @Result(name = "success", type = "json"),
			@Result(name = "error", location = "/Pages/Pos/Login.jsp") })
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
