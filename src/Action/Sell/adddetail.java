package Action.Sell;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Action.FactorySessionGet;
import Model.Billdetail;
import Model.BilldetailId;

public class adddetail extends ActionSupport {
	Billdetail billdetail;
	int billid;
	String productid;
	String productname;
	int number;
	int unitprice;
	int totalprice;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		System.out.println(productname);
		BilldetailId bdid = new BilldetailId(billid,productid);
		billdetail = new Billdetail(bdid, productname, number, unitprice, totalprice);
		ss.save(billdetail);
		ss.flush();
		ss.close();
		return "success";
	}

	public int getBillid() {
		return billid;
	}

	public void setBillid(int billid) {
		this.billid = billid;
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

	public Billdetail getBilldetail() {
		return billdetail;
	}

	public void setBilldetail(Billdetail billdetail) {
		this.billdetail = billdetail;
	}

}
