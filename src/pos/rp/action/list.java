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
import Model.Receiptandpayment;
@ParentPackage("json-default")
public class list extends ActionSupport implements ModelDriven<Receiptandpayment> {
	Receiptandpayment receiptandpayment;
	List<Receiptandpayment> receiptandpayments;
	String group;
	String searchvalue;

	public Receiptandpayment getReceiptandpayment() {
		return receiptandpayment;
	}

	public void setReceiptandpayment(Receiptandpayment receiptandpayment) {
		this.receiptandpayment = receiptandpayment;
	}

	public List<Receiptandpayment> getReceiptandpayments() {
		return receiptandpayments;
	}

	public void setReceiptandpayments(List<Receiptandpayment> receiptandpayments) {
		this.receiptandpayments = receiptandpayments;
	}

	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}
	@Action(value = "/getrplist", results = { @Result(name = "success", type = "json"),
			@Result(name = "error", location = "/Pages/Pos/Login.jsp") })
	public String getList() {
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		System.out.println(searchvalue);
		if (searchvalue != null) {
			Query qr = ss.createQuery("from Receiptandpayment where receivername like :value");
			qr.setParameter("value", "%" + searchvalue + "%");
			receiptandpayments = qr.list();
			System.out.println("1");
		} else if (group != null) {
			Query qr = ss.createQuery("from Receiptandpayment where billtype =:group");
			qr.setParameter("group", group);
			receiptandpayments = qr.list();
			System.out.println("2");
		} else {
			receiptandpayments = ss.createQuery("from Receiptandpayment").list();
			System.out.println("3");
		}
		ss.close();
		if (receiptandpayments != null)
			return "success";
		else {
			return "error";
		}
	}

	public String getSearchvalue() {
		return searchvalue;
	}

	public void setSearchvalue(String searchvalue) {
		this.searchvalue = searchvalue;
	}


	@Override
	public Receiptandpayment getModel() {
		// TODO Auto-generated method stub
		return receiptandpayment;
	}
}
