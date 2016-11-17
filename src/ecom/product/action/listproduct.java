package ecom.product.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;

import Model.Product;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class listproduct extends ActionSupport {
	String group ="*";
	String name ="*";
	List<Product> products;
	public String getGroup() {
		return group;
	}
	public void setGroup(String group) {
		this.group = group;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<Product> getProducts() {
		return products;
	}
	public void setProducts(List<Product> products) {
		this.products = products;
	}
	@Action(value="/Ecom/listproduct",results={@Result(name="success",type="json")})
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		products = ss.createQuery("from Product").list();
		ss.flush();
		ss.close();
		return "success";
	}
}
