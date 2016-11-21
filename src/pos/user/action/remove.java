package pos.user.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;

import Model.Employee;
import Model.User;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class remove extends ActionSupport{
	int userid;
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getEmid() {
		return emid;
	}
	public void setEmid(int emid) {
		this.emid = emid;
	}
	int emid;
	@Action(value="/removeuser",results={@Result(name="success",type="json")})
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		User user = (User)ss.createQuery("from User where id = :id").setParameter("id", userid).uniqueResult();
		ss.delete(user);
		Employee em = (Employee) ss.createQuery("from Employee where employeeid = :id").setParameter("id", emid).uniqueResult();
		ss.delete(em);
		ss.flush();
		ss.close();
		return super.execute();
	}
}
