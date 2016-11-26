package pos.customergroup.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Model.Customergroup;
import pos.common.action.FactorySessionGet;
import com.opensymphony.xwork2.ActionSupport;

@ParentPackage("json-default")
public class update extends ActionSupport implements ModelDriven<Customergroup> {
	Customergroup customergroup;

	public Customergroup getCustomergroup() {
		return customergroup;
	}

	public void setCustomergroup(Customergroup customergroup) {
		this.customergroup = customergroup;
	}

	@Action(value = "/updatecustomergroup", results = { @Result(name = "success", type = "json") })
	@Override
	public String execute() throws Exception {
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		ss.update(customergroup);
		ss.flush();
		ss.close();
		// TODO Auto-generated method stub
		return super.execute();
	}

	@Override
	public Customergroup getModel() {
		// TODO Auto-generated method stub
		return customergroup;
	}
}
