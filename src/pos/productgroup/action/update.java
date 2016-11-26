package pos.productgroup.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Model.Productgroup;
import pos.common.action.FactorySessionGet;
import com.opensymphony.xwork2.ActionSupport;

@ParentPackage("json-default")
public class update extends ActionSupport implements ModelDriven<Productgroup> {
	Productgroup productgroup;

	public Productgroup getProductgroup() {
		return productgroup;
	}

	public void setProductgroup(Productgroup productgroup) {
		this.productgroup = productgroup;
	}

	@Action(value = "/updateproductgroup", results = { @Result(name = "success", type = "json") })
	@Override
	public String execute() throws Exception {
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		ss.update(productgroup);
		ss.flush();
		ss.close();
		// TODO Auto-generated method stub
		return super.execute();
	}

	@Override
	public Productgroup getModel() {
		// TODO Auto-generated method stub
		return productgroup;
	}
}
