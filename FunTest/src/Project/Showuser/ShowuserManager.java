package Project.Showuser;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import Connection.HibernateConnection;
import Model.Users;

public class ShowuserManager {
	
	@SuppressWarnings("unchecked")
	 public  List<Users>  getshopfromapi () {
	  List<Users> list = null;

	  try {
	   SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
	   Session session = sessionFactory.openSession();
	   session.beginTransaction();
	   list = session.createQuery("From Users").list();
	   session.clear();
	   session.flush();
	   session.close();
	   sessionFactory.close();
	
	  } catch (Exception e) {
	   e.printStackTrace();

	  }
	  return list ;
	 }
	

}
