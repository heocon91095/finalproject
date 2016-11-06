package sell.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;

import Model.Bill;
import common.action.FactorySessionGet;

@ParentPackage("json-default")
public class getsinglebill extends ActionSupport {
	List<Bill> bill;
	int billid;


	public List<Bill> getBill() {
		return bill;
	}

	public void setBill(List<Bill> bill) {
		this.bill = bill;
	}

	public int getBillid() {
		return billid;
	}

	public void setBillid(int billid) {
		this.billid = billid;
	}
	@Action(value="/getbill",results={@Result(name="success",type="json")})
	public String execute() {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		bill = ss.createQuery("from Bill where billid = :id").setParameter("id",billid).list();
		ss.flush();
		ss.close();
		return "success";
	}
}
