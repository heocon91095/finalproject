package Action.Suplier;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Action.FactorySessionGet;
import Model.Customer;
import Model.Suplier;

public class list extends ActionSupport implements ModelDriven<Suplier> {
	Suplier suplier;
	List<Suplier> supliers;
	String group;
	String searchvalue;

	public Suplier getSuplier() {
		return suplier;
	}

	public void setSuplier(Suplier suplier) {
		this.suplier = suplier;
	}

	public List<Suplier> getSupliers() {
		return supliers;
	}

	public void setSupliers(List<Suplier> supliers) {
		this.supliers = supliers;
	}

	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return "success";
	}

	public String getList() {
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		System.out.println(searchvalue);
		if (searchvalue != null) {
			Query qr = ss.createQuery("from Suplier where supliername like :value");
			qr.setParameter("value", "%" + searchvalue + "%");
			supliers = qr.list();
			System.out.println("1");
		} else if (group != null) {
			Query qr = ss.createQuery("from Suplier where supliergroup =:group");
			qr.setParameter("group", group);
			supliers = qr.list();
			System.out.println("2");
		} else {
			supliers = ss.createQuery("from Suplier").list();
			System.out.println("3");
		}
		ss.close();
		if (supliers != null)
			return "success";
		else {
			return "error";
		}
	}

	public String getSearchvalue() {
		return searchvalue;
	}

	public void setSearchvalue(String searchvalue) {
		this.searchvalue = searchvalue;
	}


	@Override
	public Suplier getModel() {
		// TODO Auto-generated method stub
		return suplier;
	}
}
