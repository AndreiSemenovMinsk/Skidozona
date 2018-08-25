package by.eximer.library.service;

import by.eximer.library.dao.exception.DAOException;
import by.eximer.library.domain.User;
import by.eximer.library.service.exeption.ServiceException;


public interface UserService {
	
	
	/////////USER
	User signin(String login, String password) throws ServiceException;
		
	User register(String login, String password, String name, String phone) throws ServiceException;
	
	User updateUserQR(String login, String password) throws ServiceException;

	User testlogin(String login) throws ServiceException;
	
}
