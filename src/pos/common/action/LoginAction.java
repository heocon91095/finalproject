package pos.common.action;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.model.naming.ImplicitNamingStrategyJpaCompliantImpl;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Model.User;

@ParentPackage("struts-default")
public class LoginAction extends ActionSupport implements ModelDriven<User> {
	private User user;
	private List<User> users;

	@Action(value = "/login", results = { @Result(name = "success", type="chain", location = "posindex"),
			@Result(name = "error", location = "/Pages/Pos/Login.jsp") })
	public String execute() {
		HttpServletRequest request = ServletActionContext.getRequest();
		Map websession = ActionContext.getContext().getSession();
		if (request.getMethod().equals("POST")) {
			SessionFactory sf = new FactorySessionGet().get();
			Session session = sf.openSession();
			System.out.println(user.getUsername());
			User tuser = (User)session.createQuery("from User where username = :code").setParameter("code", user.getUsername()).uniqueResult();
			if (user.getPassword().equals(tuser.getPassword())) {
				websession.put("username", user.getUsername());
				websession.put("role", user.getRole());
				return "success";
			} else {
				addActionError("Sai Tài khoản hoặc Mật khẩu");
				return "error";
			}
		} else {
			addActionError("Sai Tài khoản hoặc Mật khẩu");
			return "error";
		}
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return user;
	}
}