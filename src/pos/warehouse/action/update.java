package pos.warehouse.action;

import java.util.Date;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Model.Bill;
import Model.Warehouse;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class update extends ActionSupport {
	Warehouse wh;
	String supilerid;
	int wid;
	int total;
	int tax;
	int pay;
	int excess;
	String note;
	String status;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSupilerid() {
		return supilerid;
	}

	public void setSupilerid(String supilerid) {
		this.supilerid = supilerid;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getTax() {
		return tax;
	}

	public void setTax(int tax) {
		this.tax = tax;
	}

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public int getExcess() {
		return excess;
	}

	public void setExcess(int excess) {
		this.excess = excess;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Warehouse getWh() {
		return wh;
	}

	public void setWh(Warehouse wh) {
		this.wh = wh;
	}

	public int getWid() {
		return wid;
	}

	public void setWid(int wid) {
		this.wid = wid;
	}

	@Action(value = "/updatewh", results = { @Result(name = "success", type = "json"),
			@Result(name = "error", location = "/Pages/Pos/Login.jsp") })
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		System.out.println(supilerid);
		Date date = new Date();
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		wh = (Warehouse) ss.createQuery("from Warehouse where wid =:id").setParameter("id", wid).uniqueResult();
		wh.setSupilerid(supilerid);
		wh.setExcess(excess);
		wh.setNote(note);
		wh.setPay(pay);
		wh.setTotal(total);
		wh.setTax(tax);
		wh.setStatus(status);
		System.out.println(wh.getTotal());
		ss.update(wh);
		ss.flush();
		ss.close();
		return "success";
	}
}
