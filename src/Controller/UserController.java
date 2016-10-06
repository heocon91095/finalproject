package Controller;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import Model.DatabaseConnect;
import Model.UserModel;

public class UserController extends DatabaseConnect{
	public UserModel select() throws ClassNotFoundException, SQLException
	{
		UserModel us = new UserModel();
		super.connect();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from User");
		while(rs.next())
		{
			us.setUsername(rs.getString(1));
			us.setPassword(rs.getString(2));
		}
		return us;
	}
}
