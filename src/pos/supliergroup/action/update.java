package pos.supliergroup.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Model.Supliergroup;
import pos.common.action.FactorySessionGet;
import com.opensymphony.xwork2.ActionSupport;

@ParentPackage("json-default")
public class update extends ActionSupport implements ModelDriven<Supliergroup> {
	Supliergroup supliergroup;

	public Supliergroup getSupliergroup() {
		return supliergroup;
	}

	public void setSupliergroup(Supliergroup supliergroup) {
		this.supliergroup = supliergroup;
	}

	@Action(value = "/updatesupliergroup", results = { @Result(name = "success", type = "json") })
	@Override
	public String execute() throws Exception {
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		ss.update(supliergroup);
		ss.flush();
		ss.close();
		// TODO Auto-generated method stub
		return super.execute();
	}

	@Override
	public Supliergroup getModel() {
		// TODO Auto-generated method stub
		return supliergroup;
	}
}
