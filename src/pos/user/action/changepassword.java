package pos.user.action;

import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import Model.User;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class changepassword extends ActionSupport {
	String oldpass;
	String newpass;
	String renewpass;

	public String getOldpass() {
		return oldpass;
	}

	public void setOldpass(String oldpass) {
		this.oldpass = oldpass;
	}

	public String getNewpass() {
		return newpass;
	}

	public void setNewpass(String newpass) {
		this.newpass = newpass;
	}

	public String getRenewpass() {
		return renewpass;
	}

	public void setRenewpass(String renewpass) {
		this.renewpass = renewpass;
	}
	@Action(value = "/changepassword", results = { @Result(name = "success", type = "json"),
			@Result(name = "error", location = "/Pages/Pos/Login.jsp") })
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		Map websession = ActionContext.getContext().getSession();
		String user = (String) websession.get("username");
		User usert = (User) ss.createQuery("from User where username=:user").setParameter("user", user)
				.uniqueResult();
		if (usert.getPassword().equals(oldpass)) {
			usert.setPassword(newpass);
		}
		ss.update(usert);
		ss.flush();
		ss.close();
		return "success";
	}
}
