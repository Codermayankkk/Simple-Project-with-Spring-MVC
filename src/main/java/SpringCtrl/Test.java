package SpringCtrl;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import SpringDTO.TestDTO;
import SpringModel.TestModel;

@Controller
public class Test 
{
   @RequestMapping("/login")	
   public String login()
   {
	 return "login";  
   }
   
   @RequestMapping("/logout")
   public String logout(HttpSession session)
   {
      session.invalidate(); 
	  return "login"; 
   }
   
   @RequestMapping("/adminHome")
   public String admin()
   {
	  return "adminHome"; 
   }
   
   @RequestMapping("/register")
   public String register()
   {
	 return "register";   
   }
   
   @RequestMapping("/update")
   public String update()
   {
	 return "update";   
   }
   
   @RequestMapping("/delete")
   public String delete()
   {
	   return "delete";
   }
   
   @RequestMapping("/details")
   public String details()
   {
	  return "details"; 
   }
   
   @RequestMapping("/checkLogin")
   public ModelAndView checkLogin(@ModelAttribute("TestDTO") TestDTO tt, HttpSession session)
   {   
	   TestModel tm = new TestModel();
	   boolean check = tm.check(tt);
	   
	   ModelAndView mv = null;
	   
	   if(check)
	   {
		    mv = new ModelAndView("adminHome", "msg", "Login SuccessFully");
		    session.setAttribute("uname", tt.getUname());
	   }
	   else
	   {
		   mv = new ModelAndView("login", "msg", "Login Failed");
	   }
	   return mv;
   }
   
   @RequestMapping("/Registration")
   public ModelAndView Registration(@ModelAttribute("TestDTO") TestDTO tt)
   {   
	  TestModel tm = new TestModel();
	  boolean register = tm.insert(tt);
	  
	  ModelAndView mv = null;
	  
	  if(register)
	  {
		 mv = new ModelAndView("register", "msg", "Information registered successfully");
	  }
	  else
	  {
		mv = new ModelAndView("register", "nomsg", "Information not inserted");  
	  }
	  return mv; 
   }
   
   @RequestMapping("/updateInformation")
   public ModelAndView Updation(@ModelAttribute("TestDTO") TestDTO tt)
   {
	   TestModel tm = new TestModel();
	   boolean update  = tm.update(tt);
	   
	   ModelAndView mv = null;
	   
	   if(update)
	   {
		   mv = new ModelAndView("update", "msg", "Information Updated successfully");
	   }
	   else
	   {
		   mv = new ModelAndView("update", "nmsg", "Information not updated");
	   }
	   return mv;
   }
   
   @RequestMapping("/deleteInformation")
   public ModelAndView deleteInformation(@ModelAttribute("TestDTO") TestDTO tt, HttpSession session)
   {
	  TestModel tm = new TestModel();
	  boolean delete = tm.delete(tt);
	  
	  ModelAndView mv = null; 
	  
	  if(delete)
	  {
		 mv = new ModelAndView("login", "dmsg", "Account deleted"); 
		 session.invalidate();
	  }
	  else
	  {
		 mv = new ModelAndView("delete", "nmsg", "Server error");
	  }
	  return mv;
   }
}
