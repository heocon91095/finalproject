package net.viralpatel.struts2;
import java.sql.SQLException;

import com.opensymphony.xwork2.ActionSupport;

import Controller.UserController;
import Model.UserModel;
public class LoginAction extends ActionSupport {
 private String username;
 private String password;
 private UserModel um;
 public String execute() throws ClassNotFoundException, SQLException {
	 UserController uc = new UserController();
	 UserModel um1 = new UserModel();
	 um1 = uc.select();
  if (this.username.equals(um1.getUsername()) && this.password.equals(um1.getPassword())) {  
   return "success";
  } else {
   addActionError(getText("error.login"));
   return "error";
  }
 }
 public String getUsername() {
  return username;
 }
 public void setUsername(String username) {
  this.username = username;
 }
 public String getPassword() {
  return password;
 }
 public void setPassword(String password) {
  this.password = password;
 }
}