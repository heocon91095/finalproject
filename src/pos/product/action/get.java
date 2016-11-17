package pos.product.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Model.Product;
import pos.common.action.FactorySessionGet;
@ParentPackage("json-default")
public class get extends ActionSupport implements ModelDriven<Product>{
Product product;
int productid;
public Product getProduct() {
	return product;
}
public void setProduct(Product product) {
	this.product = product;
}
@Action(value = "/getproduct", results = { @Result(name = "success", type = "json"),
		@Result(name = "error", location = "/Pages/Pos/Login.jsp") })
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
	public int getProductid() {
	return productid;
}
public void setProductid(int productid) {
	this.productid = productid;
}
	@Override
	public Product getModel() {
		// TODO Auto-generated method stub
		return product;
	}

}
