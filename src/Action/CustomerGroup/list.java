package Action.CustomerGroup;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Action.FactorySessionGet;
import Model.Customergroup;

public class list extends ActionSupport implements ModelDriven<Customergroup>{
	List<Customergroup> customergroups;
	Customergroup customergroup;
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
