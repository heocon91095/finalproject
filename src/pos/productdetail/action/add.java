package pos.productdetail.action;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.tomcat.util.codec.binary.Base64;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Model.Productdetail;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class add extends ActionSupport implements ModelDriven<Productdetail> {
	Productdetail productdetail;

	@Action(value = "/addproductdetail", results = { @Result(name = "success", type = "json"),
			@Result(name = "error", location = "/Pages/Pos/Login.jsp") })
	@Override
	public String execute() throws Exception {

		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		System.out.println(productdetail.getProductid());
		ss.save(productdetail);
		ss.flush();
		ss.close();
		return "success";
	}

	public Productdetail getProductdetail() {
		return productdetail;
	}

	public void setProductdetail(Productdetail productdetail) {
		this.productdetail = productdetail;
	}

	@Override
	public Productdetail getModel() {
		// TODO Auto-generated method stub
		return productdetail;
	}

}
