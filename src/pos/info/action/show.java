package pos.info.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionSupport;

@ParentPackage("tiles-default")
public class show extends ActionSupport {
	@Action(value="/info",results={@Result(name="success",type="tiles",location="pos.info")})
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return super.execute();
	}
	
	@Action(value="/createinfo",results={@Result(name="success",type="tiles",location="pos.createinfo")})
	public String createinfo() throws Exception {
		// TODO Auto-generated method stub
		return super.execute();
	}
}
