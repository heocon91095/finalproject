package pos.warehouse.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;

import Model.Warehouse;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class remove extends ActionSupport {
	int wid;

	public int getWid() {
		return wid;
	}

	public void setWid(int wid) {
		this.wid = wid;
	}

	@Action(value = "/removewarehouse", results = { @Result(name = "success", type = "json") })
	@Override
	public String execute() throws Exception {
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		Warehouse wh = (Warehouse) ss.createQuery("from Warehouse where wid=:id").setParameter("id", wid)
				.uniqueResult();
		ss.delete(wh);
		ss.flush();
		ss.close();
		return "success";
	}
}
