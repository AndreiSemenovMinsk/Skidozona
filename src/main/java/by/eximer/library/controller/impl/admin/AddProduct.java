package by.eximer.library.controller.impl.admin;

import by.eximer.library.service.SessionIdFactory;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import by.eximer.library.controller.Command;

public class AddProduct implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String sessionId = SessionIdFactory.getSessionId();
	}

}
