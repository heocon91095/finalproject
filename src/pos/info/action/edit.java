package pos.info.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;

import Model.Info;
import pos.common.action.FactorySessionGet;

@ParentPackage("tiles-default")
public class edit extends ActionSupport {
	Info info;
	int infoid;
	public Info getInfo() {
		return info;
	}
	public void setInfo(Info info) {
		this.info = info;
	}
	public int getInfoid() {
		return infoid;
	}
	public void setInfoid(int infoid) {
		this.infoid = infoid;
	}
	@Action(value = "/editinfo", results = { @Result(name = "success", type = "tiles",location="pos.editinfo") })
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		System.out.println(infoid);
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		info = (Info)ss.createQuery("from Info where infoid = :id").setParameter("id", infoid).uniqueResult();
		ss.flush();
		ss.close();
		return super.execute();
	}
}
