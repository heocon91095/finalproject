package pos.user.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;

import Model.Employee;
import Model.User;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class adduser extends ActionSupport {
	String username;
	String employeename;
	String role;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmployeename() {
		return employeename;
	}

	public void setEmployeename(String employeename) {
		this.employeename = employeename;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@Action(value = "/addduser", results = { @Result(name = "success", type = "json") })
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		User user = new User(username, "Password123", role);
		Employee employee = new Employee(employeename, username);
		ss.save(user);
		ss.save(employee);
		ss.flush();
		ss.close();
		return super.execute();
	}
}
