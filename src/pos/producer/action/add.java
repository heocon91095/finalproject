package pos.producer.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Model.Customer;
import Model.Producer;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class add extends ActionSupport{
	String producerid;
	String producername;
	public String getProducerid() {
		return producerid;
	}

	public void setProducerid(String producerid) {
		this.producerid = producerid;
	}

	public String getProducername() {
		return producername;
	}

	public void setProducername(String producername) {
		this.producername = producername;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getProducergroup() {
		return producergroup;
	}

	public void setProducergroup(String producergroup) {
		this.producergroup = producergroup;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	String phone;
	String address;
	String producergroup;
	String mail;

	@Action(value = "/addproducer", results = { @Result(name = "success", type = "json"),
			@Result(name = "error", location = "/Pages/Pos/Login.jsp") })
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		Producer producer = new Producer(producername, phone, address,producergroup, mail);
		ss.save(producer);
		ss.flush();
		ss.close();
		return "success";
	}
}
