package Action.ProductDetail;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Model.Productdetail;
import common.action.FactorySessionGet;

public class update extends ActionSupport implements ModelDriven<Productdetail>{
Productdetail productdetail;

public Productdetail getProductdetail() {
	return productdetail;
}

public void setProductdetail(Productdetail productdetail) {
	this.productdetail = productdetail;
}
@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
	SessionFactory sf = new FactorySessionGet().get();
	Session ss = sf.openSession();
	ss.update(productdetail);
	ss.flush();
	ss.close();
	return "success";
	}
@Override
public Productdetail getModel() {
	// TODO Auto-generated method stub
	return productdetail;
}
}
