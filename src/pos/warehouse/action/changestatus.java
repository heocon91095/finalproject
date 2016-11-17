package pos.warehouse.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;

import Model.Bill;
import Model.Warehouse;
import pos.common.action.FactorySessionGet;
@ParentPackage("json-default")
public class changestatus extends ActionSupport {
	int wid;
	String status;

	public int getWid() {
		return wid;
	}

	public void setWid(int wid) {
		this.wid = wid;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Action(value = "/changewarehousestatus", results = { @Result(name = "success", type="json") })
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		Warehouse wh = (Warehouse) ss.createQuery("from Warehouse where wid =:id").setParameter("id", wid).uniqueResult();
		wh.setStatus(status);
		ss.update(wh);
		ss.flush();
		ss.close();
		return "success";
	}
}
