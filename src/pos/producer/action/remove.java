package pos.producer.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;

import Model.Producer;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class remove extends ActionSupport {
	int producerid;

	public int getProducerid() {
		return producerid;
	}

	public void setProducerid(int producerid) {
		this.producerid = producerid;
	}

	@Action(value = "/removeproducer", results = { @Result(name = "success", type = "json"),
			@Result(name = "error", location = "/Pages/Pos/Login.jsp") })
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		Query qr = ss.createQuery("delete Producer where producerid = :id");
		qr.setParameter("id", producerid);
		qr.executeUpdate();
		ss.flush();
		ss.close();
		return "success";
	}
}
