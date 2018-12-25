package Project.Adddatausers;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import Connection.HibernateConnection;
import Model.Datausers;


public class InsertdatauserManager {
	
	public String doHibernateAddProductdatauser(Datausers datausers) {
		  try {
		   SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		   Session session = sessionFactory.openSession();
		   session.beginTransaction();
		   session.saveOrUpdate(datausers);
		 //  session.delete(users);
		   session.getTransaction().commit();
		   session.clear();
		   session.flush();
		   session.close();
		   sessionFactory.close();
		   return "Add New Product Successfully...";
		  } catch (Exception e) {
		   e.printStackTrace();
		   return "Product is already there with this";
		  }
		 }

}
