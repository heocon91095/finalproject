package pos.sell.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Model.Bill;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class getbill extends ActionSupport implements ModelDriven<Bill> {
	Bill bill;
	int billid;

	public Bill getBill() {
		return bill;
	}

	public void setBill(Bill bill) {
		this.bill = bill;
	}

	public int getBillid() {
		return billid;
	}

	public void setBillid(int billid) {
		this.billid = billid;
	}

	@Action(value = "/getbill", results = { @Result(name = "success", type = "json") })
	public String execute() {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		bill = (Bill) ss.createQuery("from Bill where billid = :id").setParameter("id", billid).uniqueResult();
		ss.flush();
		ss.close();
		return "success";
	}

	@Override
	public Bill getModel() {
		// TODO Auto-generated method stub
		return bill;
	}
}
