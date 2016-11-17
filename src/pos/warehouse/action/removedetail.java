package pos.warehouse.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;

import Model.Warehousedetail;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class removedetail extends ActionSupport {
	int wid;

	public int getWid() {
		return wid;
	}

	public void setWid(int wid) {
		this.wid = wid;
	}

	@Action(value = "/removewarehousedetail", results = { @Result(name = "success", type = "json") })
	@Override
	public String execute() throws Exception {
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		List<Warehousedetail> lwh = ss.createQuery("from Warehousedetail where wid=:id").setParameter("id", wid).list();
		try {
			for (Warehousedetail item : lwh) {
				ss.delete(item);
			}
		} catch (Exception e) {
			System.out.println("Nothing to delete");
		}
		ss.flush();
		ss.close();
		return "success";
	}
}
