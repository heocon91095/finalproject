package user.action;

import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class logout extends ActionSupport {
	@Action(value = "/logout", results = { @Result(name = "success", location = "/Pages/Pos/Login.jsp") })
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		Map websession = ActionContext.getContext().getSession();
		websession.put("username", null);
		websession.put("role", null);
		return "success";
	}
}
