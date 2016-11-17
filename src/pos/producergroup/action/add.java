package pos.producergroup.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Model.Producergroup;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class add extends ActionSupport implements ModelDriven<Producergroup> {
	Producergroup producergroup;
	@Action(value = "/addproducergroup", results = { @Result(name = "success", type = "json"),
			@Result(name = "error", location = "/Pages/Pos/Login.jsp") })
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		ss.save(producergroup);
		ss.flush();
		ss.close();
		return "success";
	}

	public Producergroup getProducergroup() {
		return producergroup;
	}

	public void setProducergroup(Producergroup producergroup) {
		this.producergroup = producergroup;
	}

	@Override
	public Producergroup getModel() {
		// TODO Auto-generated method stub
		return producergroup;
	}
}
