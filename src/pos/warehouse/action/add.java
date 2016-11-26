package pos.warehouse.action;

import java.util.Date;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Model.Bill;
import Model.Warehouse;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class add extends ActionSupport {
	Warehouse warehouse;
	int supilerid;
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

	public int getSupilerid() {
		return supilerid;
	}

	public void setSupilerid(int supilerid) {
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

	public Warehouse getWarehouse() {
		return warehouse;
	}

	public void setWarehouse(Warehouse warehouse) {
		this.warehouse = warehouse;
	}

	@Action(value = "/addwarehouse", results = { @Result(name = "success", type = "json"),
			@Result(name = "error", location = "/Pages/Pos/Login.jsp") })
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		Map websession = ActionContext.getContext().getSession();
		String creator = (String) websession.get("username");
		Date date = new Date();
		warehouse = new Warehouse(supilerid, pay, total, date, creator, status, note, tax, excess);
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		ss.save(warehouse);
		ss.flush();
		ss.close();
		return "success";
	}
}
