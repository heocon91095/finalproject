package pos.supliergroup.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Model.Supliergroup;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class list extends ActionSupport implements ModelDriven<Supliergroup> {
	List<Supliergroup> supliergroups;
	Supliergroup supliergroup;

	@Action(value = "/sgrouplist", results = { @Result(name = "success", type = "json"),
			@Result(name = "error", location = "/Pages/Pos/Login.jsp") })
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		supliergroups = ss.createQuery("from Supliergroup").list();
		ss.close();
		return "success";
	}

	public List<Supliergroup> getSupliergroups() {
		return supliergroups;
	}

	public void setSupliergroups(List<Supliergroup> supliergroups) {
		this.supliergroups = supliergroups;
	}

	@Override
	public Supliergroup getModel() {
		// TODO Auto-generated method stub
		return supliergroup;
	}
}
