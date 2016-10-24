package Action.ProductDetail;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Action.FactorySessionGet;
import Model.Productdetail;

public class add extends ActionSupport implements ModelDriven<Productdetail>{
Productdetail productdetail;
@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		System.out.println(productdetail.getProductid());
		ss.save(productdetail);
		ss.flush();
		ss.close();
		return "success";
	}
public Productdetail getProductdetail() {
	return productdetail;
}

public void setProductdetail(Productdetail productdetail) {
	this.productdetail = productdetail;
}

@Override
public Productdetail getModel() {
	// TODO Auto-generated method stub
	return productdetail;
}

}
