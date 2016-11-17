package pos.producer.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Model.Producer;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class update extends ActionSupport implements ModelDriven<Producer> {
	Producer producer;
	int producerid;

	public Producer getProducer() {
		return producer;
	}

	public void setProducer(Producer producer) {
		this.producer = producer;
	}

	public int getProducerid() {
		return producerid;
	}

	public void setProducerid(int producerid) {
		this.producerid = producerid;
	}

	@Action(value = "/updateproducer", results = { @Result(name = "success", type = "json"),
			@Result(name = "error", location = "/Pages/Pos/Login.jsp") })
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		System.out.println(producer.getProducername());
		System.out.println(producerid);
		ss.update(producer);
		ss.flush();
		ss.close();
		return "success";
	}

	@Override
	public Producer getModel() {
		// TODO Auto-generated method stub
		return producer;
	}

}
