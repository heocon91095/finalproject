package Action;

import java.sql.SQLException;
import java.util.List;

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

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import Model.User;

public class LoginAction extends ActionSupport implements ModelDriven<User> {
	private User user;
	private List<User> users;

	public String execute() {
		/*
		 * ServiceRegistry registry = new
		 * StandardServiceRegistryBuilder().configure("Model/hibernate.cfg.xml")
		 * .build(); Metadata metadata = new
		 * MetadataSources(registry).addAnnotatedClass(User.class)
		 * .addResource("Model/User.hbm.xml") .getMetadataBuilder()
		 * .applyImplicitNamingStrategy(ImplicitNamingStrategyJpaCompliantImpl.
		 * INSTANCE) .build(); SessionFactory sf =
		 * metadata.getSessionFactoryBuilder().build();
		 */
		Session session = new FactorySessionGet().get("User");
		if (session.isConnected()) {
			System.out.println("Connection success");
		} else {
			System.out.println("Connection failed");
		}
		System.out.println(user.getUsername());
		Query query = session.createQuery("from User where username = :code");
		query.setParameter("code", user.getUsername());
		User s = (User) query.uniqueResult();
		if (user.getPassword().equals(s.getPassword())) {
			return "success";
		} else {
			addActionError(getText("error.login"));
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