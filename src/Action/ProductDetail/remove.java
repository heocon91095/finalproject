package Action.ProductDetail;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;

import Action.FactorySessionGet;

public class remove extends ActionSupport{
String productid;
	
	

	public String getProductid() {
	return productid;
}



public void setProductid(String productid) {
	this.productid = productid;
}



	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		Query qr = ss.createQuery("delete Productdetail where productid = :id");
		qr.setParameter("id", productid);
		qr.executeUpdate();
		ss.flush();
		ss.close();
		return "success";
	}

}
