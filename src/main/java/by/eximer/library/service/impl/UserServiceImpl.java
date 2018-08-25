package by.eximer.library.service.impl;

import by.eximer.library.service.exeption.ServiceException;
import by.eximer.library.dao.DAOFactory;
import by.eximer.library.dao.UserDAO;
import by.eximer.library.dao.exception.DAOException;
import by.eximer.library.domain.User;
import by.eximer.library.service.UserService;

public class UserServiceImpl implements UserService{

	
	@Override
	public User signin(String login, String password) throws ServiceException {
		User user = null;
		
		DAOFactory factory = DAOFactory.getInstance();
		UserDAO dao = factory.getUserDAO();
		
		try {
			user = dao.checkUser(login, password);
		} catch (DAOException e) {
			// TODO Auto-generated catch block
			throw new ServiceException("message change!!!");
		}
		
		return user;
	}
	
	/*
	 * @param String login, String password, String name, String phone
	 */
	@Override
	public User register(String login, String password, String name, String phone) throws ServiceException {
		User user = null;/*new User();
		user.setName("Vasja");*/
		
		DAOFactory factory = DAOFactory.getInstance();
		UserDAO dao = factory.getUserDAO();
		
		try {
			user = dao.register(login, password, name, phone);
		} catch (DAOException e) {
			// TODO Auto-generated catch block
			throw new ServiceException("message change!!!");
		}
		
		return user;
	}
	
	@Override
	public User updateUserQR(String sessionId, String sessionIdComp) throws ServiceException {
		User user = null;
		DAOFactory factory = DAOFactory.getInstance();
		UserDAO dao = factory.getUserDAO();
		
		try {
			user = dao.updateUserQR(sessionId, sessionIdComp);
		} catch (DAOException e) {
			// TODO Auto-generated catch block
			throw new ServiceException("message change!!!");
		}
		
		return user;
	}
	
	@Override
	public User testlogin(String login) throws ServiceException {
		User user = null;/*new User();
		user.setName("Vasja");*/
		
		DAOFactory factory = DAOFactory.getInstance();
		UserDAO dao = factory.getUserDAO();
		
		try {
			user = dao.testLogin(login);
		} catch (DAOException e) {
			// TODO Auto-generated catch block
			throw new ServiceException("message change!!!");
		}
		
		return user;
	}
}