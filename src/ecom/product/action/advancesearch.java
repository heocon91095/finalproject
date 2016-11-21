package ecom.product.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.opensymphony.xwork2.ActionSupport;

import Model.Product;
import Model.Productdetail;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class advancesearch extends ActionSupport {
	String producer;
	int pricestart;
	int priceend;
	String component;
	String componentinfo;
	String group;
	List<Product> products;

	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	public String getProducer() {
		return producer;
	}

	public void setProducer(String producer) {
		this.producer = producer;
	}

	public int getPricestart() {
		return pricestart;
	}

	public void setPricestart(int pricestart) {
		this.pricestart = pricestart;
	}

	public int getPriceend() {
		return priceend;
	}

	public void setPriceend(int priceend) {
		this.priceend = priceend;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public String getComponent() {
		return component;
	}

	public void setComponent(String component) {
		this.component = component;
	}

	public String getComponentinfo() {
		return componentinfo;
	}

	public void setComponentinfo(String componentinfo) {
		this.componentinfo = componentinfo;
	}

	@Action(value = "/advancesearch", results = { @Result(name = "success", type = "json") })
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		Criteria cr1 = ss.createCriteria(Productdetail.class);
		Criteria cr = ss.createCriteria(Product.class);
		cr.add(Restrictions.eqOrIsNull("groupid", group));
		if (!producer.equals("null"))
			cr.add(Restrictions.like("producer", "%" + producer + "%"));
		if (pricestart != -1)
			cr.add(Restrictions.between("priceout", pricestart, priceend));
		if (!component.equals("")) {
			cr1.add(Restrictions.like(component, "%" + componentinfo + "%"));
			cr1.setProjection(Projections.property("productid"));
			List<Integer> pid = cr1.list();
			cr.add(Restrictions.in("productid", pid));
		}
		products = cr.list();
		return "success";
	}
}
