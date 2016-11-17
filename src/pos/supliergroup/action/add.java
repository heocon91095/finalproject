package Action.SuplierGroup;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Action.FactorySessionGet;
import Model.Supliergroup;

public class add extends ActionSupport implements ModelDriven<Supliergroup> {
	Supliergroup supliergroup;

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		System.out.println(supliergroup.getSgroupname());
		ss.save(supliergroup);
		ss.flush();
		ss.close();
		return "success";
	}

	public Supliergroup getSupliergroup() {
		return supliergroup;
	}

	public void setSupliergroup(Supliergroup supliergroup) {
		this.supliergroup = supliergroup;
	}

	@Override
	public Supliergroup getModel() {
		// TODO Auto-generated method stub
		return supliergroup;
	}
}
