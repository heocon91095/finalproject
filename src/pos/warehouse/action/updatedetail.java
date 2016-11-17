package pos.warehouse.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Model.Billdetail;
import Model.BilldetailId;
import Model.Warehousedetail;
import Model.WarehousedetailId;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class updatedetail extends ActionSupport {
	Warehousedetail WHdetail;
	int wid;
	String productid;
	String productname;
	int number;
	int unitprice;
	int totalprice;

	@Action(value = "/updatewhdetail", results = { @Result(name = "success", type = "json"),
			@Result(name = "error", location = "/Pages/Pos/Login.jsp") })
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		WarehousedetailId wdid = new WarehousedetailId(wid, productid);
		WHdetail = new Warehousedetail(wdid, productname, number, unitprice, totalprice);
		ss.saveOrUpdate(WHdetail);
		ss.flush();
		ss.close();
		return "success";
	}

	public String getProductid() {
		return productid;
	}

	public void setProductid(String productid) {
		this.productid = productid;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public int getUnitprice() {
		return unitprice;
	}

	public void setUnitprice(int unitprice) {
		this.unitprice = unitprice;
	}

	public int getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}

	public Warehousedetail getWHdetail() {
		return WHdetail;
	}

	public void setWHdetail(Warehousedetail wHdetail) {
		WHdetail = wHdetail;
	}

	public int getWid() {
		return wid;
	}

	public void setWid(int wid) {
		this.wid = wid;
	}

}
