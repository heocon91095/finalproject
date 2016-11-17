package pos.warehouse.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;

import Model.Billdetail;
import Model.Warehousedetail;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class listdetail extends ActionSupport {
	List<Warehousedetail> WHdetail;
	int wid;

	public List<Warehousedetail> getWHdetail() {
		return WHdetail;
	}

	public void setWHdetail(List<Warehousedetail> wHdetail) {
		WHdetail = wHdetail;
	}

	public int getWid() {
		return wid;
	}

	public void setWid(int wid) {
		this.wid = wid;
	}

	@Action(value = "/getwarehousedetail", results = { @Result(name = "success", type = "json") })
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		WHdetail = ss.createQuery("from Warehousedetail where wid =:id").setParameter("id", wid).list();
		ss.flush();
		ss.close();
		return "success";
	}
}
