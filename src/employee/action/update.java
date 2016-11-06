package employee.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Model.Employee;
import common.action.FactorySessionGet;
@ParentPackage("json-default")
public class update extends ActionSupport implements ModelDriven<Employee> {
	Employee employee;
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	@Action(value = "/updateemployee", results = { @Result(name = "success", type = "json"),
			@Result(name = "error", location = "/Pages/Pos/Login.jsp") })
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		System.out.println(employee);
		ss.update(employee);
		ss.flush();
		ss.close();
		return "success";
	}
	@Override
	public Employee getModel() {
		// TODO Auto-generated method stub
		return employee;
	}
	
}
