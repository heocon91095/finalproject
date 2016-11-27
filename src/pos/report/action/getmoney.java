package pos.report.action;

import java.text.SimpleDateFormat;
import java.util.Date;
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

import Model.Bill;
import Model.Billdetail;
import pos.common.action.FactorySessionGet;

@ParentPackage("json-default")
public class getmoney extends ActionSupport {
	String startdate;
	String enddate;
	List<Object> data;

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public List<Object> getData() {
		return data;
	}

	public void setData(List<Object> data) {
		this.data = data;
	}

	@Action(value = "/getdatareportmoney", results = { @Result(name = "success", type = "json") })
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		SessionFactory sf = new FactorySessionGet().get();
		Session ss = sf.openSession();
		Criteria cr1 = ss.createCriteria(Bill.class);
		if (!startdate.equals("") && !enddate.equals("")) {
			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
			Date start = sd.parse(startdate);
			Date end = sd.parse(enddate);
			cr1.add(Restrictions.between("day", start, end));
		}
		cr1.setProjection(Projections.projectionList().add(Projections.groupProperty("day"))
				.add(Projections.sum("total")));
		data = cr1.list();
		ss.close();
		return super.execute();
	}
}
