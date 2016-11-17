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
public class add extends ActionSupport implements ModelDriven<Productdetail>,ServletRequestAware{
Productdetail productdetail;
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
@Action(value = "/addproductdetail", results = { @Result(name = "success", type = "json"),
		@Result(name = "error", location = "/Pages/Pos/Login.jsp") })
@Override
	public String execute() throws Exception {
	try{
		File desFile = new File(request.getServletContext().getRealPath("/img/product")+"/"+productdetail.getImage());
		System.out.println(fileencode);
		byte[] arrbyte = Base64.decodeBase64(fileencode) ;
		FileUtils.writeByteArrayToFile(desFile, arrbyte);
		System.out.println(desFile.getAbsolutePath());
	}
	catch(IOException e)
	{
		System.out.println("No File");
	}
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
@Override
public void setServletRequest(HttpServletRequest request) {
	// TODO Auto-generated method stub
	this.request = request;
}

}
