package Action.ProductDetail;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Action.FactorySessionGet;
import Model.Productdetail;

public class get extends ActionSupport implements ModelDriven<Productdetail> {
	String productid;
	public String getProductid() {
		return productid;
	}
	public void setProductid(String productid) {
		this.productid = productid;
	}

	Productdetail pd;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		Query query = ss.createQuery("from Productdetail where productid = :id");
		query.setParameter("id", productid);
		pd = (Productdetail) query.list().get(0);
		return "success";
	}
	public Productdetail getPd() {
		return pd;
	}

	public void setPd(Productdetail pd) {
		this.pd = pd;
	}

	@Override
	public Productdetail getModel() {
		// TODO Auto-generated method stub
		return pd;
	}

}
