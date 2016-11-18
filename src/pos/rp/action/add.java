package pos.rp.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Model.Customer;
import Model.Receiptandpayment;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class add extends ActionSupport implements ModelDriven<Receiptandpayment> {
	Receiptandpayment receiptandpayment;

	@Action(value = "/addrp", results = { @Result(name = "success", type = "json"),
			@Result(name = "error", location = "/Pages/Pos/Login.jsp") })
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
