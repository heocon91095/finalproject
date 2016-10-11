package Action;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.model.naming.ImplicitNamingStrategyJpaCompliantImpl;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.service.ServiceRegistry;

import Model.User;

public class FactorySessionGet {
public Session get(String mapfile){
	 ServiceRegistry registry = new StandardServiceRegistryBuilder().configure("Model/hibernate.cfg.xml").build();
	 Metadata metadata = new MetadataSources(registry).addAnnotatedClass(User.class)
			 .addResource("Model/"+mapfile +".hbm.xml")
			 .getMetadataBuilder()
			 .applyImplicitNamingStrategy(ImplicitNamingStrategyJpaCompliantImpl.INSTANCE)
			 .build();
	 SessionFactory sf = metadata.getSessionFactoryBuilder().build();
	 Session ss =  sf.openSession();
	 return ss;
}
}
