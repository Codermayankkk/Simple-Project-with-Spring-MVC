package SpringModel;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import SpringDB.DBconnector;
import SpringDTO.TestDTO;

public class TestModel 
{
  public boolean check(TestDTO tt)
  {
	  String tablepassword = null;
	  try
	  {
		  Statement st = DBconnector.getStatement();
		  String q = "SELECT * FROM emp WHERE emp_name = '"+tt.getUname()+"'";
		  
		  ResultSet rs = st.executeQuery(q);
		  if(rs.next())
		  {
			 tablepassword = rs.getString("emp_password");
		  }	  
		  
		  if(!tt.getUname().equals("") && !tt.getUname().trim().equals("") && tt.getUpass().equals(tablepassword))
		  {
			 return true; 
		  }
	  }
	  catch(SQLException e)
	  {
		  System.out.println(e);
	  }
	  return false;
  }
  
  public boolean insert(TestDTO tt)
  {
	if(tt.getNpass().equals(tt.getUpass()) && !tt.getUname().trim().equals("") && !tt.getMailid().trim().equals("") && !tt.getContact().trim().equals(""))
	{
		try
		{	
		   Statement st = DBconnector.getStatement();
		   String q = "INSERT INTO emp(emp_name, emp_password, emp_mailid, emp_contact) VALUES('"+tt.getUname()+"', '"+tt.getUpass()+"', '"+tt.getMailid()+"', '"+tt.getContact()+"')";
			  
		   int i = st.executeUpdate(q);
		   if(i>0)
		   {
			  return true; 
		   }
		}
		catch(SQLException e)
	    {
		  System.out.println(e);
		}
	}
	  return false;
  }
  
  public boolean update(TestDTO tt)
  {
	  if(!tt.getUname().trim().equals("") && !tt.getMailid().trim().equals("") && !tt.getContact().trim().equals(""))
	  {
		  System.out.println(tt.getUname());
		 try
		 {
			 Statement st = DBconnector.getStatement();
			 String q = "UPDATE emp SET emp_name = '"+tt.getUname()+"', emp_mailid = '"+tt.getMailid()+"', emp_contact = '"+tt.getContact()+"' WHERE emp_name = '"+tt.getUname()+"'";
			 
			 int i = st.executeUpdate(q);
			 if(i > 0)
			 {
				return true; 
			 }
		 }
		 catch(SQLException e)
		 {
			 System.out.println(e);
		 }
	  }
	  return false;
  }
  
  public boolean delete(TestDTO tt)
  {
	  if(!tt.getUname().trim().equals(""))
	  {
		 try
		 {
			Statement st = DBconnector.getStatement();
			String q = "DELETE FROM emp WHERE emp_name = '"+tt.getUname()+"'";
			
			int i = st.executeUpdate(q);
			if(i > 0)
			{
			  return true;	
			}
		 }
		 catch(SQLException e)
		 {
			System.out.println(e); 
		 }
	  }
	  return false;
  }
}
