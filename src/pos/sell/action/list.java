package pos.sell.action;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;

import Model.Bill;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class list extends ActionSupport {
	Bill bill;
	List<Object> billd;
	List<Bill> bills;
	String key;
	String datestart;
	String dateend;
	String group;

	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getDatestart() {
		return datestart;
	}

	public void setDatestart(String datestart) {
		this.datestart = datestart;
	}

	public String getDateend() {
		return dateend;
	}

	public void setDateend(String dateend) {
		this.dateend = dateend;
	}

	@Action(value = "/getbilllist", results = { @Result(name = "success", type = "json") })
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		if (group != null && !group.equals(""))
			billd = ss.createQuery("from Bill p ,Customer k where p.customerid = k.customerid AND p.status=:group")
					.setParameter("group", group).list();
		else
			billd = ss.createQuery("from Bill p ,Customer k where p.customerid = k.customerid").list();
		ss.flush();
		ss.close();
		return "success";
	}

	@Action(value = "/getbilllistbykey", results = { @Result(name = "success", type = "json") })
	public String excutebykey() throws ParseException {
		int keyid = 0;
		try {
			keyid = Integer.parseInt(key);
		} catch (Exception e) {
		}
		if (!datestart.equals("") && !dateend.equals("")) {
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date startdate = df.parse(datestart);
			Date enddate = df.parse(dateend);

			SessionFactory sf = new FactorySessionGet().get();
			Session ss = sf.openSession();
			if (!key.equals("")) {
				if (keyid != 0)
					billd = ss
							.createQuery(
									"from Bill p ,Customer k where p.customerid = k.customerid AND p.billid =:key AND (p.day Between :startdate AND :enddate)")
							.setParameter("key", keyid).setParameter("startdate", startdate)
							.setParameter("enddate", enddate).list();
				else
					billd = ss
							.createQuery(
									"from Bill p ,Customer k where p.customerid = k.customerid AND k.customername LIKE :name AND (p.day Between :startdate AND :enddate)")
							.setParameter("name", "%" + key + "%").setParameter("startdate", startdate)
							.setParameter("enddate", enddate).list();
			} else {
				billd = ss
						.createQuery(
								"from Bill p ,Customer k where p.customerid = k.customerid AND (p.day Between :startdate AND :enddate)")
						.setParameter("startdate", startdate).setParameter("enddate", enddate).list();
			}
			ss.flush();
			ss.close();
		} else {
			SessionFactory sf = new FactorySessionGet().get();
			System.out.println("noday");
			Session ss = sf.openSession();
			if (!key.equals("")) {
				if (keyid != 0)
					billd = ss
							.createQuery(
									"from Bill p ,Customer k where p.customerid = k.customerid AND p.billid =:key ")
							.setParameter("key", keyid).list();
				else
					billd = ss
							.createQuery(
									"from Bill p ,Customer k where p.customerid = k.customerid AND  k.customername LIKE :name ")
							.setParameter("name", "%" + key + "%").list();
				ss.flush();
				ss.close();
				System.out.println(billd);
			}
		}
		return "success";
	}

	public Bill getBill() {
		return bill;
	}

	public void setBill(Bill bill) {
		this.bill = bill;
	}

	public List<Object> getBilld() {
		return billd;
	}

	public void setBilld(List<Object> billd) {
		this.billd = billd;
	}

	public List<Bill> getBills() {
		return bills;
	}

	public void setBills(List<Bill> bills) {
		this.bills = bills;
	}

}
