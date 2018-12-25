package Project.Adddatausers;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Model.Datausers;
import Project.Showuser.ShowuserManager;

@Controller
public class InsertdatauserController {
	
	@RequestMapping(value = "/uploaddatauser", method = RequestMethod.POST)
	public String uploaddatauser(HttpServletRequest request, HttpSession session ,HttpServletResponse response) throws Exception {
		
		 FileItemFactory itemfactory = new DiskFileItemFactory();
		   ServletFileUpload upload = new ServletFileUpload(itemfactory);
		   upload.setHeaderEncoding("UTF-8");
		   List<FileItem> items = upload.parseRequest(request);
		
		
		
		
		   String UPLOAD_DIRECTORY = "WebContent/WEB-INF/img";
//		  Set<String> img = new HashSet<String>();
		  
		    String name = new File(items.get(2).getName()).getName();
		    System.out.println("/UploadedFiles/" + items.get(2).getName());
		    items.get(2).write(new File(UPLOAD_DIRECTORY + File.separator + name));
//		    img.add(items.get(2).getName());
		   
		
//		
//		  for (int i = 5; i <= 9; i++) {
//			   if (!items.get(i).getName().equals("")) {
//			    String name = new File(items.get(i).getName()).getName();
//			    System.out.println("/UploadedFiles/" + items.get(i).getName());
//			    items.get(i).write(new File(UPLOAD_DIRECTORY + File.separator + name));
//			    img.add(items.get(i).getName());
//			   }
//			  }
		
		
	//	request.setCharacterEncoding("UTF-8");

		  String assdress = items.get(0).getString("UTF-8");
		  String image = items.get(2).getString("UTF-8");
		  int iduser = Integer.parseInt(items.get(1).getString("UTF-8"));
		  Date date = new Date();
		  DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		  
		
		  
		  Datausers datausers = new Datausers();
		  datausers.setAddress(assdress);
		  datausers.setId_user(iduser);
		  datausers.setImg(image);
		  datausers.setDate(dateFormat.parse(dateFormat.format(date)));
		
		  
		  
		  InsertdatauserManager insertdatauserManager = new InsertdatauserManager();
		  insertdatauserManager.doHibernateAddProductdatauser(datausers);
		  
		  
		  ShowuserManager show = new ShowuserManager();
		  
			 List userlist = show.getshopfromapi();
			  
			 session.setAttribute("userlist", userlist); 
		
		
		return "inserintofrom";
	}
	
//	
//	
//	   PrintWriter out = response.getWriter();
//	   if (!ServletFileUpload.isMultipartContent(request)) {
//	    out.println("Nothing to upload");
//	   }
//	   FileItemFactory itemfactory = new DiskFileItemFactory();
//	   ServletFileUpload upload = new ServletFileUpload(itemfactory);
//	   upload.setHeaderEncoding("UTF-8");
//	   List<FileItem> items = upload.parseRequest(request);
//	   
//	   EditProductShopManager editProMng = new EditProductShopManager();
//	   editProMng.isEditProduct(items,shops,productedit);
//	   
//	   ListProductShopController listProCon = new ListProductShopController();
//	   listProCon.loadListProductPages(request, session);
//	   
//	   return "manageProductShop" ;
//	 }
//	
	

}
