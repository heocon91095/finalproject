package pos.customergroup.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Model.Customergroup;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class list extends ActionSupport implements ModelDriven<Customergroup> {
	List<Customergroup> customergroups;
	Customergroup customergroup;

	@Action(value = "/cgrouplist", results = { @Result(name = "success", type = "json"),
			@Result(name = "error", location = "/Pages/Pos/Login.jsp") })
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		customergroups = ss.createQuery("from Customergroup").list();
		ss.close();
		return "success";
	}

	public List<Customergroup> getCustomergroups() {
		return customergroups;
	}

	public void setCustomergroups(List<Customergroup> customergroups) {
		this.customergroups = customergroups;
	}

	@Override
	public Customergroup getModel() {
		// TODO Auto-generated method stub
		return customergroup;
	}
}
