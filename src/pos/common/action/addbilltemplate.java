package pos.common.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;

import Model.Billtemplate;

@ParentPackage("json-default")
public class addbilltemplate extends ActionSupport{
	String header;
	String footer;
	public String getHeader() {
		return header;
	}
	public void setHeader(String header) {
		this.header = header;
	}
	public String getFooter() {
		return footer;
	}
	public void setFooter(String footer) {
		this.footer = footer;
	}
	@Action(value="/addtemplate",results={@Result(name="success",type="json")})
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		System.out.println(header);
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		Billtemplate template = new Billtemplate(header,footer);
		ss.save(template);
		ss.flush();
		ss.close();
		return super.execute();
	}
}
