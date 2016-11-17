package pos.info.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;

import Model.Info;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class list extends ActionSupport {
	List<Info> infos;

	public List<Info> getInfos() {
		return infos;
	}

	public void setInfos(List<Info> infos) {
		this.infos = infos;
	}

	@Action(value = "/listinfo", results = { @Result(name = "success", type = "json") })
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		infos = ss.createQuery("from Info order by date").list();
		ss.flush();
		ss.close();
		return super.execute();
	}
}
