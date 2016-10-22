package Action.RP;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Action.FactorySessionGet;
import Model.Receiptandpayment;

public class update extends ActionSupport implements ModelDriven<Receiptandpayment> {
	Receiptandpayment receiptandpayment;
	String billid;


	public Receiptandpayment getReceiptandpayment() {
		return receiptandpayment;
	}
	public void setReceiptandpayment(Receiptandpayment receiptandpayment) {
		this.receiptandpayment = receiptandpayment;
	}

	
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
		System.out.println(receiptandpayment.getReceivername());
		System.out.println(billid);
		ss.update(receiptandpayment);
		ss.flush();
		ss.close();
		return "success";
	}
	public String getrpJson(){
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		Query qr = ss.createQuery("from Receiptandpayment where billid = :id");
		qr.setParameter("id", billid);
		receiptandpayment = (Receiptandpayment) qr.list().get(0);
		return "success";
	}
	@Override
	public Receiptandpayment getModel() {
		// TODO Auto-generated method stub
		return null;
	}

}
