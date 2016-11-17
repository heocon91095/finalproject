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

import Model.Customer;
import Model.Producer;
import pos.common.action.FactorySessionGet;
@ParentPackage("json-default")
public class list extends ActionSupport implements ModelDriven<Producer> {
	Producer producer;
	List<Producer> producers;
	String group;
	String searchvalue;

	public Producer getProducer() {
		return producer;
	}

	public void setProducer(Producer producer) {
		this.producer = producer;
	}

	public List<Producer> getProducers() {
		return producers;
	}

	public void setProducers(List<Producer> producers) {
		this.producers = producers;
	}

	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	@Action(value = "/getproducerlist", results = { @Result(name = "success", type = "json"),
			@Result(name = "error", location = "/Pages/Pos/Login.jsp") })
	public String getList() {
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		System.out.println(searchvalue);
		if (searchvalue != null) {
			Query qr = ss.createQuery("from Producer where producername like :value");
			qr.setParameter("value", "%" + searchvalue + "%");
			producers = qr.list();
			System.out.println("1");
		} else if (group != null) {
			Query qr = ss.createQuery("from Producer where producergroup =:group");
			qr.setParameter("group", group);
			producers = qr.list();
			System.out.println("2");
		} else {
			producers = ss.createQuery("from Producer").list();
			System.out.println("3");
		}
		ss.close();
		if (producers != null)
			return "success";
		else {
			return "error";
		}
	}

	public String getSearchvalue() {
		return searchvalue;
	}

	public void setSearchvalue(String searchvalue) {
		this.searchvalue = searchvalue;
	}


	@Override
	public Producer getModel() {
		// TODO Auto-generated method stub
		return producer;
	}
}
