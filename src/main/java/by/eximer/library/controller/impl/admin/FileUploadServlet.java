package by.eximer.library.controller.impl.admin;

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
 * @author www.codejava.net
 */
public class FileUploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
     
    // location to store file uploaded
    private static final String UPLOAD_DIRECTORY = "c:/Users/andrei/eclipse-workspace/Eximer/src/main/webapp/shops/";
 
    // upload settings
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 4; // 40MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 5; // 50MB
 
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
 
        // constructs the directory path to store upload file
        // this path is relative to application's directory
        /*String uploadPath = "d:/eclipse"+//"c:/Users/andrei/eclipse-workspace/Library/WebContent/shops"+			//getServletContext().getRealPath("")
                File.separator + UPLOAD_DIRECTORY;
        
         System.out.println("uploadPath"+uploadPath);
        */ 
        // creates the directory if it does not exist
        
        
 
        try {
        	String sessionId = SessionIdFactory.getSessionId();
            // parses the request's content to extract file data
        	
        	String shopId = null;
        	String productId = null;
        	
        	//String id = request.getParameter("id");
        	//System.out.println("id"+id);
        	//id = getValue(request.getPart("id"));
        	
            //@SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(request);
 
            if (formItems != null && formItems.size() > 0) {
                // iterates over form's fields
                for (FileItem item : formItems) {
                    // processes only fields that are not form fields
                   	
                    	switch (item.getFieldName()) {
                    	case "id_shop": 
                    		shopId = item.getString();
                        break;
                    	case "id_product": 
                    		productId = item.getString();
                        break;
                    	}           
                }
                
                for (FileItem item : formItems) {
	                if (!item.isFormField()) {
	                	
	                	System.out.println(item.getFieldName());
	                	
	                    String fileName = new File(item.getName()).getName();
	                    
	                    String[] arr = fileName.split("\\.");
	                    
	                    System.out.println(shopId+"&"+productId);
	                    String uploadPath = UPLOAD_DIRECTORY +shopId;
	                    
	                    System.out.println("uploadPath"+uploadPath);
	                    
	                    File uploadDir = new File(uploadPath);
	                    
	                    System.out.println(uploadDir.exists());
	                    
	                    if (!uploadDir.exists()) {
	                        uploadDir.mkdir();
	                    }
	                    
	                    
	                    String filePath = uploadPath + File.separator+ productId+ "." + arr[1]; //;
	                    System.out.println(filePath);
	                    
	                    File storeFile = new File(filePath);
	
	                    System.out.println("filePath"+filePath);
	                    
	                    // saves the file on disk
	                    item.write(storeFile);
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
