package pos.customer.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Model.Customer;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class add extends ActionSupport{
	int customerid ;
	String customername;
	String phone;
	String address;
	String mail;
	String group;
	public int getCustomerid() {
		return customerid;
	}

	public void setCustomerid(int customerid) {
		this.customerid = customerid;
	}

	@Action(value = "/addcustomer", results = { @Result(name = "success", type = "json"),
			@Result(name = "error", location = "/Pages/Pos/Login.jsp") })
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		try {
			Customer cus = (Customer) ss.createQuery("from Customer where phone = :phone")
					.setParameter("phone", phone).uniqueResult();
			cus.setAddress(address);
			cus.setCustomergroup(group);
			cus.setPhone(phone);
			cus.setMail(mail);
			cus.setCustomername(customername);
			ss.update(cus);
			ss.flush();
			ss.close();
			customerid = cus.getCustomerid();
		} catch (Exception e) {
			Customer cus = new Customer(customername,phone,address,group,mail);
			ss.save(cus);
			ss.flush();
			ss.close();
			customerid = cus.getCustomerid();
		}
		return "success";
	}

	public String getCustomername() {
		return customername;
	}

	public void setCustomername(String customername) {
		this.customername = customername;
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

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

}
