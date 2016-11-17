package common.action;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Model.Product;

public class posproduct extends ActionSupport implements ModelDriven<Product> {
	Product product;
	List<Product> products;
	String key;
	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	String group;
	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	public String getlist() {
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		if (key !=null)
		{
			Query query = ss.createQuery("from Product where productname like :key");
			query.setParameter("key", "%"+key+"%");
			products = query.list();
			System.out.println(products.get(0));
			ss.close();
			System.out.println("1");
			return "success";
		}
		if(group != null)
		{
			Query query = ss.createQuery("from Product where groupid = :group");
			query.setParameter("group", group);
			products = query.list();
			ss.close();
			System.out.println("2");
			return "success";
		}
		products = ss.createQuery("from Product").list();
		ss.close();
		return "success";
	}

	public String addproduct() {
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		ss.save(product);
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