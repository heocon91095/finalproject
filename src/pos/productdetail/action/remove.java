package pos.productdetail.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;

import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class remove extends ActionSupport {
	int productid;

	public int getProductid() {
		return productid;
	}

	public void setProductid(int productid) {
		this.productid = productid;
	}

	@Action(value = "/removeproductdetail", results = { @Result(name = "success", type = "json"),
			@Result(name = "error", location = "/Pages/Pos/Login.jsp") })
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		Query qr = ss.createQuery("delete Productdetail where productid = :id");
		qr.setParameter("id", productid);
		qr.executeUpdate();
		ss.flush();
		ss.close();
		return "success";
	}
}
