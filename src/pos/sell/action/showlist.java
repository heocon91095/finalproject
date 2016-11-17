package pos.sell.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionSupport;

@ParentPackage("tiles-default")
public class showlist extends ActionSupport {
	@Action(value = "/billlist", results = { @Result(name = "success", type = "tiles", location="pos.billlist"),
			@Result(name = "error", location = "/Pages/Pos/Login.jsp") })
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return "success";
	}
}
