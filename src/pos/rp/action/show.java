package pos.rp.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionSupport;
@ParentPackage("tiles-default")
public class show extends ActionSupport {
	@Action(value = "/rp", results = { @Result(name = "success", type = "tiles", location="pos.RP"),
			@Result(name = "error", location = "/Pages/Pos/Login.jsp") })
	@Override
public String execute() throws Exception {
	// TODO Auto-generated method stub
	return super.execute();
}
}
