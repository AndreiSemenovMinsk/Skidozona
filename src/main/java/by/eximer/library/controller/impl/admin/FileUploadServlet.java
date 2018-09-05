package by.eximer.library.controller.impl.admin;

import by.eximer.library.domain.User;
import by.eximer.library.service.AdminService;
import by.eximer.library.service.ServiceFactory;
import by.eximer.library.service.SessionIdFactory;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
/*
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
*/
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/**
 * A Java servlet that handles file upload from client.
 *
 * @author Андрей Семёнов
 */
public class FileUploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
     
    ServiceFactory factory = ServiceFactory.getInstance();
	AdminService userService = factory.getAdminService();	
	User user = null; 
    // location to store file uploaded
    private static final String UPLOAD_DIRECTORY = "c:/Users/andrei/eclipse-workspace/Eximer/src/main/webapp/shops/";
    //private static final String UPLOAD_DIRECTORY = "";//src/main/webapp/shops/
    
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 4; // 4MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 5; // 5MB
 
    final Logger log = LoggerFactory.getLogger(FileUploadServlet.class); //
    /**
     * Upon receiving file upload submission, parses the request to read
     * upload data and saves the file on disk.
     */
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // checks if the request actually contains upload file
        if (!ServletFileUpload.isMultipartContent(request)) {
            // if not, we stop here
            PrintWriter writer = response.getWriter();
            writer.println("Error: Form must has enctype=multipart/form-data.");
            writer.flush();
            return;
        }
 
        // configures upload settings
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // sets memory threshold - beyond which files are stored in disk
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        // sets temporary location to store files
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
 
        ServletFileUpload upload = new ServletFileUpload(factory);
         
        // sets maximum size of upload file
        upload.setFileSizeMax(MAX_FILE_SIZE);
         
        // sets maximum size of request (include file + form data)
        upload.setSizeMax(MAX_REQUEST_SIZE);
 
        try {
        	String sessionId = SessionIdFactory.getSessionId();
            
        	int shopId;
        	String idProduct = null;
        	
            List<FileItem> formItems = upload.parseRequest(request);
 
            if (formItems != null && formItems.size() > 0) {
                
                for (FileItem item : formItems) {
                    
                    	switch (item.getFieldName()) {
                    	
                    	case "id_product": 
                    		idProduct = item.getString();
                        break;
                    	}           
                }
                
                for (FileItem item : formItems) {
	                if (!item.isFormField()) {
	                	
	                	System.out.println(item.getFieldName());
	                	
	                    String fileName = new File(item.getName()).getName();
	                    
	                    String[] arr = fileName.split("\\.");
	                    
	                    user = userService.fileUpload(Integer.parseInt(sessionId), Integer.parseInt(idProduct), arr[arr.length-1]);
	                    
	                    shopId = user.getIdShop();
	                    
	                    System.out.println(shopId+"&"+idProduct);
	                    String uploadPath = UPLOAD_DIRECTORY +shopId;
	                    
	                    System.out.println("uploadPath"+uploadPath);
	                    
	                    File uploadDir = new File(uploadPath);
	                    
	                    System.out.println(uploadDir.exists());
	                    System.out.println(uploadDir.getAbsolutePath());
	                    System.out.println(uploadDir.getCanonicalPath());
	                    System.out.println(uploadDir.getPath());
	                    
	                    
	                    if (!uploadDir.exists()) {
	                        uploadDir.mkdir();
	                    }
	                    
	                    String filePath = uploadPath + File.separator+ idProduct+ "." + arr[1]; //
	                    System.out.println(filePath);
	                    
	                    File storeFile = new File(filePath);
	
	                    System.out.println("filePath"+filePath);
	                    
	                    
	                    item.write(storeFile);
	                    
	            		
	            		if (user.getSuccess()) {
	            			response.getWriter().print("0");
	            		}	else {
	            			response.getWriter().print("1");
	            		}
	                    request.setAttribute("message",
	                        "FileUploadServlet has been done successfully!");
	                } 
                }
            }
        } catch (Exception ex) {
        	
        	System.out.println("catch");
        	
            request.setAttribute("message",
                    "There was an error: " + ex.getMessage());
        }
        // redirects client to message page
        getServletContext().getRequestDispatcher("/message.jsp").forward(
                request, response);
    }
}
