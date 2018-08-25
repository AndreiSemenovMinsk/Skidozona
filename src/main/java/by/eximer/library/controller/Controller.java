package by.eximer.library.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import java.util.*;
//import com.ibm.useful.http.*;


public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    private static final String COMMAND_PARAM_NAME = "command";
    
    
    private final CommandProvider provider = new CommandProvider();
	
    public Controller() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String commandName = request.getParameter(COMMAND_PARAM_NAME);
		
		Command command = provider.getCommand(commandName);
			
		//request.setCharacterEncoding("UTF-8");
		//response.setContentType("text/html; charset=windows-1251");
		command.execute(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 /*
		DiskFileItemFactory factory = new DiskFileItemFactory(10000000, "upload");
		// Set factory constraints
		factory.setSizeThreshold(yourMaxMemorySize);
		factory.setRepository(yourTempDirectory);

		// Create a new file upload handler
		ServletFileUpload upload = new ServletFileUpload(factory);

		// Set overall request size constraint
		upload.setSizeMax(yourMaxRequestSize);

		// Parse the request
		List<FileItem> items = upload.parseRequest(request);
		
		Iterator<FileItem> iter = items.iterator();
		while (iter.hasNext()) {
		    FileItem item = iter.next();

		    if (item.isFormField()) {
		        //processFormField(item);
		    	String name = item.getFieldName();
		        String value = item.getString();
		    } else {
		        //processUploadedFile(item);
		    	String fieldName = item.getFieldName();
		        String fileName = item.getName();
		        String contentType = item.getContentType();
		        boolean isInMemory = item.isInMemory();
		        long sizeInBytes = item.getSize();
		    }
		}
		*/
		doGet(request, response);
	}

}
