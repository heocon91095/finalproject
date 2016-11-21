package pos.common.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;

import Model.Billtemplate;

@ParentPackage("json-default")
public class getbilltemplate extends ActionSupport{
	Billtemplate template;
	
public Billtemplate getTemplate() {
		return template;
	}

	public void setTemplate(Billtemplate template) {
		this.template = template;
	}
@Action(value="/gettemplate",results={@Result(name="success",type="json")})
@Override
public String execute() throws Exception {
	// TODO Auto-generated method stub
	SessionFactory sf = new FactorySessionGet().get();
	Session ss = sf.openSession();
	template = (Billtemplate) ss.createQuery("from Billtemplate").uniqueResult();
	ss.close();
	return super.execute();
}
}
