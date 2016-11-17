package pos.suplier.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Model.Suplier;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class get extends ActionSupport implements ModelDriven<Suplier> {
	Suplier suplier;
	int suplierid;

	public Suplier getSuplier() {
		return suplier;
	}

	public void setSuplier(Suplier suplier) {
		this.suplier = suplier;
	}

	public int getSuplierid() {
		return suplierid;
	}

	public void setSuplierid(int suplierid) {
		this.suplierid = suplierid;
	}

	@Action(value = "/getsuplier", results = { @Result(name = "success", type = "json"),
			@Result(name = "error", location = "/Pages/Pos/Login.jsp") })
	public String getsuplierJson() {
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
		return suplier;
	}

}
