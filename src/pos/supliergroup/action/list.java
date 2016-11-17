package Action.SuplierGroup;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Action.FactorySessionGet;
import Model.Supliergroup;

public class list extends ActionSupport implements ModelDriven<Supliergroup>{
	List<Supliergroup> supliergroups;
	Supliergroup supliergroup;
@Override
public String execute() throws Exception {
	// TODO Auto-generated method stub
	SessionFactory sf = new FactorySessionGet().get();
	Session ss = sf.openSession();
	supliergroups = ss.createQuery("from Supliergroup").list();
	ss.close();
	return "success";
}
public List<Supliergroup> getSupliergroups() {
	return supliergroups;
}
public void setSupliergroups(List<Supliergroup> supliergroups) {
	this.supliergroups = supliergroups;
}
@Override
public Supliergroup getModel() {
	// TODO Auto-generated method stub
	return supliergroup;
}
}
