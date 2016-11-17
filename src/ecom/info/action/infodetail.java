package ecom.info.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Model.Info;
import pos.common.action.FactorySessionGet;

@ParentPackage("tiles-default")
public class infodetail extends ActionSupport implements ModelDriven<Info>{
	int infoid;

	public int getInfoid() {
		return infoid;
	}

	public void setInfoid(int infoid) {
		this.infoid = infoid;
	}

	Info info;

	public Info getInfo() {
		return info;
	}

	public void setInfo(Info info) {
		this.info = info;
	}

	@Action(value="/infodetail",results={@Result(name="success",type="tiles",location="ecom.einfodetail")})
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss= sf.openSession();
		info = (Info)ss.createQuery("from Info where infoid = :id").setParameter("id", infoid).uniqueResult();
		ss.flush();
		ss.close();
		return super.execute();
	}

	@Override
	public Info getModel() {
		// TODO Auto-generated method stub
		return info;
	}
}
