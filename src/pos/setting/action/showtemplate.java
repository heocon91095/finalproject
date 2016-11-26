package pos.setting.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.opensymphony.xwork2.ActionSupport;
@ParentPackage("tiles-default")
public class showtemplate extends ActionSupport {
	@Action(value="/settingtemplate",results = {@Result(name="success",type="tiles",location="pos.settingtemplate")})
@Override
public String execute() throws Exception {
	// TODO Auto-generated method stub
	
	return super.execute();
}
}
