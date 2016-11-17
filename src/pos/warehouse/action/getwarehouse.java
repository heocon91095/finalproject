package pos.warehouse.action;

import java.util.List;

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
public class getwarehouse extends ActionSupport {
	Warehouse wh;
	int wid;


	public Warehouse getWh() {
		return wh;
	}

	public void setWh(Warehouse wh) {
		this.wh = wh;
	}

	
	public int getWid() {
		return wid;
	}

	public void setWid(int wid) {
		this.wid = wid;
	}

	@Action(value="/getwh",results={@Result(name="success",type="json")})
	public String execute() {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		wh = (Warehouse)ss.createQuery("from Warehouse where wid = :id").setParameter("id",wid).uniqueResult();
		ss.flush();
		ss.close();
		return "success";
	}
}
