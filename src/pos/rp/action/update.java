package pos.rp.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Model.Receiptandpayment;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class update extends ActionSupport implements ModelDriven<Receiptandpayment> {
	Receiptandpayment receiptandpayment;
	int billid;

	public Receiptandpayment getReceiptandpayment() {
		return receiptandpayment;
	}

	public void setReceiptandpayment(Receiptandpayment receiptandpayment) {
		this.receiptandpayment = receiptandpayment;
	}

	public int getBillid() {
		return billid;
	}

	public void setBillid(int billid) {
		this.billid = billid;
	}

	@Action(value = "/updaterp", results = { @Result(name = "success", type = "json"),
			@Result(name = "error", location = "/Pages/Pos/Login.jsp") })
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

	@Override
	public Receiptandpayment getModel() {
		// TODO Auto-generated method stub
		return null;
	}

}
