package pos.product.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Model.Product;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class update extends ActionSupport implements ModelDriven<Product> {
	Product product;

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Action(value = "/updateproduct", results = { @Result(name = "success", type = "json"),
			@Result(name = "error", location = "/Pages/Pos/Login.jsp") })
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
