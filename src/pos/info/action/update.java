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
public class update extends ActionSupport {
	int infoid;
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

	public int getInfoid() {
		return infoid;
	}

	public void setInfoid(int infoid) {
		this.infoid = infoid;
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

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	@Action(value = "/updateinfo", results = { @Result(name = "success", type = "json") })
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		Info info = (Info) ss.createQuery("from Info where infoid = :id").setParameter("id", infoid).uniqueResult();
		info.setDate(time);
		info.setInfobody(body);
		info.setInfohead(head);
		info.setLabelimg(labelimg);
		ss.update(info);
		ss.flush();
		ss.close();
		return "success";
	}
}
