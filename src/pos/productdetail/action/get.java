package pos.productdetail.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Model.Productdetail;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class get extends ActionSupport implements ModelDriven<Productdetail> {
	int productid;

	public int getProductid() {
		return productid;
	}

	public void setProductid(int productid) {
		this.productid = productid;
	}

	Productdetail pd;

	@Action(value = "/getproductdetail", results = { @Result(name = "success", type = "json"),
			@Result(name = "error", location = "/Pages/Pos/Login.jsp") })
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		Query query = ss.createQuery("from Productdetail where productid = :id");
		query.setParameter("id", productid);
		pd = (Productdetail) query.list().get(0);
		return "success";
	}

	public Productdetail getPd() {
		return pd;
	}

	public void setPd(Productdetail pd) {
		this.pd = pd;
	}

	@Override
	public Productdetail getModel() {
		// TODO Auto-generated method stub
		return pd;
	}

}
