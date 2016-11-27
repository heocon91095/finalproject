package ecom.mail.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;

import Model.Infomail;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class add extends ActionSupport {
	String mail;
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	@Action(value="/addmail",results={@Result(name="success",type="json")})
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		ss.save(new Infomail(mail));
		ss.flush();
		ss.close();
		return super.execute();
	}
}
