package Action.RP;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;

import Action.FactorySessionGet;
import Model.Receiptandpayment;

public class remove extends ActionSupport {
	String billid;
	
	public String getBillid() {
		return billid;
	}

	public void setBillid(String billid) {
		this.billid = billid;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		Query qr = ss.createQuery("delete Receiptandpayment where billid = :id");
		qr.setParameter("id", billid);
		qr.executeUpdate();
		ss.flush();
		ss.close();
		return "success";
	}
}
