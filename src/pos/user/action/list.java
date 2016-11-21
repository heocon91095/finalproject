package pos.user.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;

import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class list extends ActionSupport {
	List<Object> user;
public List<Object> getUser() {
		return user;
	}
	public void setUser(List<Object> user) {
		this.user = user;
	}
@Action(value="/userlist",results={@Result(name="success",type="json")})
	@Override
public String execute() throws Exception {
	// TODO Auto-generated method stub
	SessionFactory sf = new FactorySessionGet().get();
	Session ss = sf.openSession();
	user = ss.createQuery("from User p , Employee t where p.username = t.username").list();
	ss.close();
	return super.execute();
}
}
