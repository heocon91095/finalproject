package Action.Suplier;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Action.FactorySessionGet;
import Model.Customer;
import Model.Suplier;

public class add extends ActionSupport implements ModelDriven<Suplier> {
	Suplier suplier;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		ss.save(suplier);
		ss.flush();
		ss.close();
		return "success";
	}


	public Suplier getSuplier() {
		return suplier;
	}


	public void setSuplier(Suplier suplier) {
		this.suplier = suplier;
	}


	@Override
	public Suplier getModel() {
		// TODO Auto-generated method stub
		return suplier;
	}
}
