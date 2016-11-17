package pos.productdetail.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Model.Productdetail;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class update extends ActionSupport implements ModelDriven<Productdetail> {
	Productdetail productdetail;

	public Productdetail getProductdetail() {
		return productdetail;
	}

	public void setProductdetail(Productdetail productdetail) {
		this.productdetail = productdetail;
	}

	@Action(value = "/updateproductdetail", results = { @Result(name = "success", type = "json"),
			@Result(name = "error", location = "/Pages/Pos/Login.jsp") })
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
