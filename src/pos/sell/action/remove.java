package pos.sell.action;

import javax.xml.bind.annotation.XmlRegistry;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;

import Model.Bill;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class remove extends ActionSupport {
	int billid;

	public int getBillid() {
		return billid;
	}

	public void setBillid(int billid) {
		this.billid = billid;
	}

	@Action(value = "/removebill", results = { @Result(name = "success", type = "json") })
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = FactorySessionGet.get();
		Session ss = sf.openSession();
		Bill bill = (Bill) ss.createQuery("from Bill where billid = :id").setParameter("id", billid).uniqueResult();
		ss.delete(bill);
		ss.flush();
		ss.close();
		return "success";
	}
}
