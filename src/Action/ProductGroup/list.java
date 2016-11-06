package Action.ProductGroup;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Model.Productgroup;
import common.action.FactorySessionGet;

public class list extends ActionSupport implements ModelDriven<Productgroup> {
Productgroup pg;
List<Productgroup> pgs;
public List<Productgroup> getPgs() {
	return pgs;
}

public void setPgs(List<Productgroup> pgs) {
	this.pgs = pgs;
}

public Productgroup getPg() {
	return pg;
}

public void setPg(Productgroup pg) {
	this.pg = pg;
}
@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
	SessionFactory sf = new FactorySessionGet().get();
	Session ss = sf.openSession();
	pgs = ss.createQuery("from Productgroup").list(); 
	return "success";
	}
@Override
public Productgroup getModel() {
	// TODO Auto-generated method stub
	return pg;
}

}
