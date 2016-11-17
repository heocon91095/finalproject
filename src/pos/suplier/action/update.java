package Action.Suplier;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Action.FactorySessionGet;
import Model.Suplier;

public class update extends ActionSupport implements ModelDriven<Suplier> {
	Suplier suplier;
	String suplierid;


	public Suplier getSuplier() {
		return suplier;
	}
	public void setSuplier(Suplier suplier) {
		this.suplier = suplier;
	}
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
		System.out.println(suplier.getSupliername());
		System.out.println(suplierid);
		ss.update(suplier);
		ss.flush();
		ss.close();
		return "success";
	}
	public String getsuplierJson(){
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		Query qr = ss.createQuery("from Suplier where suplierid = :id");
		qr.setParameter("id", suplierid);
		suplier = (Suplier) qr.list().get(0);
		return "success";
	}
	@Override
	public Suplier getModel() {
		// TODO Auto-generated method stub
		return null;
	}

}
