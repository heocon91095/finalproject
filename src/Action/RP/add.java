package Action.RP;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Action.FactorySessionGet;
import Model.Customer;
import Model.Receiptandpayment;

public class add extends ActionSupport implements ModelDriven<Receiptandpayment> {
	Receiptandpayment receiptandpayment;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		ss.save(receiptandpayment);
		ss.flush();
		ss.close();
		return "success";
	}


	public Receiptandpayment getReceiptandpayment() {
		return receiptandpayment;
	}


	public void setReceiptandpayment(Receiptandpayment receiptandpayment) {
		this.receiptandpayment = receiptandpayment;
	}


	@Override
	public Receiptandpayment getModel() {
		// TODO Auto-generated method stub
		return receiptandpayment;
	}
}
