package ecom.info.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionSupport;

@ParentPackage("tiles-default")
public class show extends ActionSupport{
@Action(value="/einfo",results={@Result(name="success",type="tiles",location="ecom.einfo")})
	@Override
public String execute() throws Exception {
	// TODO Auto-generated method stub
	return super.execute();
}
}
