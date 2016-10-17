package Action.CustomerGroup;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Action.FactorySessionGet;
import Model.Customergroup;

public class add extends ActionSupport implements ModelDriven<Customergroup> {
	Customergroup customergroup;

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		System.out.println(customergroup.getCgroupname());
		ss.save(customergroup);
		ss.flush();
		ss.close();
		return "success";
	}

	public Customergroup getCustomergroup() {
		return customergroup;
	}

	public void setCustomergroup(Customergroup customergroup) {
		this.customergroup = customergroup;
	}

	@Override
	public Customergroup getModel() {
		// TODO Auto-generated method stub
		return customergroup;
	}
}
