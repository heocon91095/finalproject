package pos.sell.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;

import Model.Bill;
import Model.Customer;
import ecom.mail.action.send;
import pos.common.action.FactorySessionGet;
@ParentPackage("json-default")
public class changestatus extends ActionSupport {
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

	@Action(value = "/changestatus", results = { @Result(name = "success", type="json") })
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
		String mailcontent = "Đơn hàng số #"+billid+" của quý khách đã thay đổi tình trạng thành: "+status+"\n\n Cảm ơn quý khách đã mua hàng tại MobileStore";
		int id = bill.getCustomerid();
		Customer cus = (Customer) ss.createQuery("from Customer where customerid =:id").setParameter("id", id).uniqueResult();
		ss.flush();
		ss.close();
		if(cus.getMail() != null)
		{
			new send().sendemail(cus.getMail(), mailcontent);
		}
		return "success";
	}
}
