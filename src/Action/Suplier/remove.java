package Action.Suplier;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;

import Action.FactorySessionGet;
import Model.Suplier;

public class remove extends ActionSupport {
	String suplierid;
	public String getSuplierid() {
		return suplierid;
	}
	public void setSuplierid(String suplierid) {
		this.suplierid = suplierid;
	}
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		Query qr = ss.createQuery("delete Suplier where suplierid = :id");
		qr.setParameter("id", suplierid);
		qr.executeUpdate();
		ss.flush();
		ss.close();
		return "success";
	}
}
