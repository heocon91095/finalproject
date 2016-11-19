package pos.product.action;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.util.ServletContextAware;
import org.apache.tomcat.util.codec.binary.Base64;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Model.Product;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class add extends ActionSupport implements ModelDriven<Product>, ServletRequestAware {
	Product product;
	File fileupload;
	String fileUploadContentType;
	String fileencode;
	public HttpServletRequest request;

	public File getFileupload() {
		return fileupload;
	}

	public String getFileencode() {
		return fileencode;
	}

	public void setFileencode(String fileencode) {
		this.fileencode = fileencode;
	}

	public void setFileupload(File fileupload) {
		this.fileupload = fileupload;
	}

	public String getFileUploadContentType() {
		return fileUploadContentType;
	}

	public void setFileUploadContentType(String fileUploadContentType) {
		this.fileUploadContentType = fileUploadContentType;
	}

	@Action(value = "/addproduct", results = { @Result(name = "success", type = "json"),
			@Result(name = "error", location = "/Pages/Pos/Login.jsp") })
	public String addproduct() {
		try {
			File desFile = new File(
					request.getServletContext().getRealPath("/img/product") + "/" + product.getPrductimg());
			System.out.println(fileencode);
			byte[] arrbyte = Base64.decodeBase64(fileencode);
			FileUtils.writeByteArrayToFile(desFile, arrbyte);
			System.out.println(desFile.getAbsolutePath());
		} catch (IOException e) {
			System.out.println("No File");
		}
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		ss.save(product);
		ss.flush();
		ss.close();
		return "success";
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Override
	public Product getModel() {
		// TODO Auto-generated method stub
		return product;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request = request;

	}

}
