package pos.warehouse.action;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;

import Model.Customer;
import Model.Suplier;
import Model.Warehouse;
import Model.Warehousedetail;
import pos.common.action.FactorySessionGet;

public class printwh extends ActionSupport {
	int whid;
	Warehouse wh;
	Suplier suplier;
	List<Warehousedetail> whdetail;

	public int getWhid() {
		return whid;
	}

	public void setWhid(int whid) {
		this.whid = whid;
	}

	public Warehouse getWh() {
		return wh;
	}

	public void setWh(Warehouse wh) {
		this.wh = wh;
	}

	public Suplier getSuplier() {
		return suplier;
	}

	public void setSuplier(Suplier suplier) {
		this.suplier = suplier;
	}

	public List<Warehousedetail> getWhdetail() {
		return whdetail;
	}

	public void setWhdetail(List<Warehousedetail> whdetail) {
		this.whdetail = whdetail;
	}

	@Override
	public String execute() throws Exception {
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		wh = (Warehouse) ss.createQuery("from Warehouse where wid =:whid").setParameter("whid", whid).uniqueResult();
		whdetail = ss.createQuery("from Warehousedetail where wid =:whid").setParameter("whid", whid).list();
		suplier = (Suplier) ss.createQuery("from Customer where customerid =:id").setParameter("id", wh.getSupilerid())
				.uniqueResult();
		ss.close();
		return super.execute();
		// TODO Auto-generated method stub
	}
}
