package pos.info.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;

import Model.Info;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class remove extends ActionSupport {
	int infoid;
	public int getInfoid() {
		return infoid;
	}
	public void setInfoid(int infoid) {
		this.infoid = infoid;
	}
	@Action(value = "/removeinfo", results = { @Result(name = "success", type = "json") })
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		System.out.println(infoid);
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		Info info = (Info)ss.createQuery("from Info where infoid = :id").setParameter("id", infoid).uniqueResult();
		ss.delete(info);
		ss.flush();
		ss.close();
		return super.execute();
	}
}
