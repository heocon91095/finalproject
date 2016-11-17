package pos.info.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;

import Model.Info;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class add extends ActionSupport {
	String head;
	String body;
	String time;
	String labelimg;

	public String getLabelimg() {
		return labelimg;
	}

	public void setLabelimg(String labelimg) {
		this.labelimg = labelimg;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getHead() {
		return head;
	}

	public void setHead(String head) {
		this.head = head;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	@Action(value = "/addinfo", results = { @Result(name = "success", type = "json") })
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		Info info = new Info(head, body, time,labelimg);
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		ss.save(info);
		ss.flush();
		ss.close();
		return "success";
	}
}
