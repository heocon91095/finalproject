package sell.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;

import Model.Bill;
import common.action.FactorySessionGet;

public class update extends ActionSupport {
	int billid;
	String status;

	public int getBillid() {
		return billid;
	}

	public void setBillid(int billid) {
		this.billid = billid;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Action(value = "/changestatus", results = { @Result(name = "success", location = "Login.jsp") })
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("gõ tiếng việt nè");
		System.out.println(status);
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		String y = ss.createQuery("from Bill where billid =:id").setParameter("id", billid).toString();
		System.out.println(status);
		Bill bill = (Bill) ss.createQuery("from Bill where billid =:id").setParameter("id", billid).list().get(0);
		System.out.println(bill);
		bill.setStatus(status);
		ss.update(bill);
		ss.flush();
		ss.close();
		return "success";
	}
}
