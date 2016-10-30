package Action.Product;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Action.FactorySessionGet;
import Model.Product;

public class get extends ActionSupport implements ModelDriven<Product>{
Product product;
String productid;
public Product getProduct() {
	return product;
}
public void setProduct(Product product) {
	this.product = product;
}
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
		Query query = ss.createQuery("from Product where productid = :id");
		query.setParameter("id", productid);
		product = (Product)query.list().get(0);
		ss.close();
		return "success";
	}
	@Override
	public Product getModel() {
		// TODO Auto-generated method stub
		return product;
	}

}
