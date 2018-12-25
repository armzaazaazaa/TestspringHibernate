package Project.login;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import Connection.HibernateConnection;
import Model.Users;

public class loginManager {
	

	@SuppressWarnings("unchecked")
	 public  Users  getlogin (Users user) {
	  List<Users> list = null;
	  Users usr = null;

	  try {
	   SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
	   Session session = sessionFactory.openSession();
	   session.beginTransaction();
	   list = session.createQuery("From Users Where email = '"+user.getEmail()+"' and passwort ='"+user.getPasswort()+"' ").list();
	   session.clear();
	   session.flush();
	   session.close();
	   sessionFactory.close();
	   
	  if (list != null) {	  
		  usr = list.get(0); 
	  }
	
	  } catch (Exception e) {
	   e.printStackTrace();

	  }
	  return usr ;
	 }
	

}
