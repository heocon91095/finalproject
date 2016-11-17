package pos.sell.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;

import Model.Billdetail;
import pos.common.action.FactorySessionGet;
@ParentPackage("json-default")
public class listdetail extends ActionSupport {
	List<Billdetail> billdetail;
	String billid;

	public List<Billdetail> getBilldetail() {
		return billdetail;
	}
	public void setBilldetail(List<Billdetail> billdetail) {
		this.billdetail = billdetail;
	}
	public String getBillid() {
		return billid;
	}
	public void setBillid(String billid) {
		this.billid = billid;
	}
	
	@Action(value="/getbilldetail",results={@Result(name="success",type="json")})
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		billdetail = ss.createQuery("from Billdetail where billid =:id").setParameter("id", billid).list();
		ss.flush();
		ss.close();
		return "success";
	}
}
