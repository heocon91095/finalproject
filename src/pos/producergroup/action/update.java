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
import com.opensymphony.xwork2.ActionSupport;

@ParentPackage("json-default")
public class update extends ActionSupport implements ModelDriven<Producergroup> {
	Producergroup producergroup;

	public Producergroup getProducergroup() {
		return producergroup;
	}

	public void setProducergroup(Producergroup producergroup) {
		this.producergroup = producergroup;
	}

	@Action(value = "/updateproducergroup", results = { @Result(name = "success", type = "json") })
	@Override
	public String execute() throws Exception {
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		ss.update(producergroup);
		ss.flush();
		ss.close();
		// TODO Auto-generated method stub
		return super.execute();
	}

	@Override
	public Producergroup getModel() {
		// TODO Auto-generated method stub
		return producergroup;
	}
}
