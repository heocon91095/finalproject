package Action;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Model.Product;

public class posproduct extends ActionSupport implements ModelDriven<Product> {
	Product product;
	List<Product> products;

	public String getlist() {
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		products = ss.createQuery("from Product").list();
		ss.close();
		return "success";
	}

	public String addproduct() {
		Product pd = new Product();
		pd.setProductname(product.getProductname());
		pd.setGroupid(product.getGroupid());
		pd.setNote(product.getNote());
		pd.setValuein(product.getValuein());
		pd.setValueout(product.getValueout());
		pd.setVat(product.getVat());
		pd.setUnit("cai");
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		ss.save(pd);
		ss.flush();
		ss.close();
		return "success";
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	@Override
	public Product getModel() {
		// TODO Auto-generated method stub
		return product;
	}

}