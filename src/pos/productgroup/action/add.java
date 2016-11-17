package pos.productgroup.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;

import Model.Productgroup;
import pos.common.action.FactorySessionGet;
@ParentPackage("json-default")
public class add extends ActionSupport {
	Productgroup productgroup;
	public Productgroup getProductgroup() {
		return productgroup;
	}
	public void setProductgroup(Productgroup productgroup) {
		this.productgroup = productgroup;
	}
	@Action(value = "/addpgroup", results = { @Result(name = "success", type = "json"),
			@Result(name = "error", location = "/Pages/Pos/Login.jsp") })
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		ss.save(productgroup);
		ss.flush();
		ss.close();
		return "success";
	}
}
