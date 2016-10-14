package Action;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.model.naming.ImplicitNamingStrategyJpaCompliantImpl;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

import Model.User;

public class FactorySessionGet {
	private static final SessionFactory sessionfactory;
	static {
		try {
			Configuration cfg = new Configuration().configure("Model/hibernate.cfg.xml");
			sessionfactory = cfg.buildSessionFactory();
			/*
			 * ServiceRegistry registry = new
			 * StandardServiceRegistryBuilder().configure(
			 * "Model/hibernate.cfg.xml") .build(); Metadata metadata = new
			 * MetadataSources(registry).addAnnotatedClass(User.class)
			 * .addResource("Model/" + mapfile +
			 * ".hbm.xml").getMetadataBuilder() .applyImplicitNamingStrategy(
			 * ImplicitNamingStrategyJpaCompliantImpl.INSTANCE).build();
			 * sesionfactory = metadata.getSessionFactoryBuilder().build();
			 */
		} catch (Throwable exception) {
			throw new ExceptionInInitializerError(exception);
		}
	}

	public static SessionFactory get() {
		return sessionfactory;
	}
}
