package pos.productgroup.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Model.Productgroup;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class list extends ActionSupport implements ModelDriven<Productgroup> {
	Productgroup pg;
	List<Productgroup> pgs;

	public List<Productgroup> getPgs() {
		return pgs;
	}

	public void setPgs(List<Productgroup> pgs) {
		this.pgs = pgs;
	}

	public Productgroup getPg() {
		return pg;
	}

	public void setPg(Productgroup pg) {
		this.pg = pg;
	}

	@Action(value = "/pgrouplist", results = { @Result(name = "success", type = "json"),
			@Result(name = "error", location = "/Pages/Pos/Login.jsp") })
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		pgs = ss.createQuery("from Productgroup").list();
		return "success";
	}

	@Override
	public Productgroup getModel() {
		// TODO Auto-generated method stub
		return pg;
	}

}
