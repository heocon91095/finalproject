package common.action;

import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import Model.Employee;
@ParentPackage("tiles-default")
public class posindex extends ActionSupport{
	Employee employee;
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	@Action(value = "/posindex", results = { @Result(name = "success", type = "tiles", location = "pos.dash"),
			@Result(name = "error", location = "/Pages/Pos/Login.jsp") })
	@Override
	public String execute(){
		Map websession = ActionContext.getContext().getSession();
		if(websession.get("username") == null)
		{
			addActionError(getText("Phát hiện nghi vấn hack"));
			return "error";
		}
		try{
		String user = (String) websession.get("username");
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		employee = (Employee)ss.createQuery("from Employee where username =:user").setParameter("user", user).uniqueResult();
		ss.flush();
		ss.close();
		return "success";
		}
		catch(Exception e)
		{
			addActionError(getText("Phát hiện nghi vấn hack"));
			return "error";
		}
	}
}
