package pos.producergroup.action;

import java.util.List;

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
public class list extends ActionSupport implements ModelDriven<Producergroup> {
	List<Producergroup> producergroups;
	Producergroup producergroup;

	@Action(value = "/producergrouplist", results = { @Result(name = "success", type = "json"),
			@Result(name = "error", location = "/Pages/Pos/Login.jsp") })
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		producergroups = ss.createQuery("from Producergroup").list();
		ss.close();
		return "success";
	}

	public List<Producergroup> getProducergroups() {
		return producergroups;
	}

	public void setProducergroups(List<Producergroup> producergroups) {
		this.producergroups = producergroups;
	}

	@Override
	public Producergroup getModel() {
		// TODO Auto-generated method stub
		return producergroup;
	}
}
