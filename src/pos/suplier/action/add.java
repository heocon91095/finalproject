package pos.suplier.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Model.Customer;
import Model.Suplier;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class add extends ActionSupport{
	String suplierid;
	String supliername;
	public String getSuplierid() {
		return suplierid;
	}

	public void setSuplierid(String suplierid) {
		this.suplierid = suplierid;
	}

	public String getSupliername() {
		return supliername;
	}

	public void setSupliername(String supliername) {
		this.supliername = supliername;
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

	public String getSupliergroup() {
		return supliergroup;
	}

	public void setSupliergroup(String supliergroup) {
		this.supliergroup = supliergroup;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	String phone;
	String address;
	String supliergroup;
	String mail;

	@Action(value = "/addsuplier", results = { @Result(name = "success", type = "json"),
			@Result(name = "error", location = "/Pages/Pos/Login.jsp") })
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		Suplier suplier = new Suplier(supliername, phone, address, mail);
		ss.save(suplier);
		ss.flush();
		ss.close();
		return "success";
	}
}
