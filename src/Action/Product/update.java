package Action.Product;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Action.FactorySessionGet;
import Model.Product;

public class update extends ActionSupport implements ModelDriven<Product> {
Product product;
	public Product getProduct() {
	return product;
}

public void setProduct(Product product) {
	this.product = product;
}
@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		System.out.println(product.getProductid());
		ss.update(product);
		ss.flush();
		ss.close();
		return "success";
	}
	@Override
	public Product getModel() {
		// TODO Auto-generated method stub
		return product;
	}

}
