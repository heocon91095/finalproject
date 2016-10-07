package Action;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.SessionAware;

public class posindex implements SessionAware{
	private Map<String, Object> mss;
	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.mss = arg0;
	}
	public String execute(){
		mss.put("hihi", "ahihi");
		return "success";
	}
}
