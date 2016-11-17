package pos.sell.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;

import Model.Billdetail;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class removedetail extends ActionSupport {
	int billid;
	@Action(value="/removebilldetail",results={@Result(name="success",type="json")})
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		List<Billdetail> bds = ss.createQuery("from Billdetail where billid = :id").setParameter("id", billid).list();
		for (Billdetail bd : bds) {
			ss.delete(bd);
		}
		ss.flush();
		ss.close();
		return "success";
	}
}
