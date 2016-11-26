package pos.setting.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionSupport;

@ParentPackage("tiles-default")
public class showgroup extends ActionSupport{
	@Action(value="/groupsetting",results={@Result(name="success",type="tiles",location="pos.settinggroup")})
 @Override
public String execute() throws Exception {
	// TODO Auto-generated method stub
	return super.execute();
}
}
