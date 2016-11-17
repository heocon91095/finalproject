package ecom.product.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Model.Product;
import Model.Productdetail;
import pos.common.action.FactorySessionGet;

@ParentPackage("tiles-default")
public class productdetail extends ActionSupport implements ModelDriven<Product>{
	String productid;
	Product product;

	public String getProductid() {
		return productid;
	}

	public void setProductid(String productid) {
		this.productid = productid;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Productdetail getPd() {
		return pd;
	}

	public void setPd(Productdetail pd) {
		this.pd = pd;
	}

	Productdetail pd;

	@Action(value = "/eproduct", results = { @Result(name = "success", type = "tiles", location = "ecom.product") })
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		product = (Product) ss.createQuery("from Product where productid=:id").setParameter("id", productid)
				.uniqueResult();
		pd = (Productdetail) ss.createQuery("from Productdetail where productid=:id").setParameter("id", productid)
				.uniqueResult();
		return "success";
	}

	@Override
	public Product getModel() {
		// TODO Auto-generated method stub
		return product;
	}
}
