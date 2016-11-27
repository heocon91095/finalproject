package ecom.mail.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;

import Model.Infomail;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class list extends ActionSupport{
	List<Infomail> mails;
	public List<Infomail> getMails() {
		return mails;
	}
	public void setMails(List<Infomail> mails) {
		this.mails = mails;
	}
	@Action(value="/maillist",results={@Result(name="success",type="json")})
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		mails = ss.createQuery("from Infomail").list();
		ss.flush();
		ss.close();
		return super.execute();
	}
}
