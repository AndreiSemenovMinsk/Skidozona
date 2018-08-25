package by.eximer.library.dao;

import by.eximer.library.dao.exception.DAOException;
import by.eximer.library.domain.User;


public interface UserDAO {
	
	User checkUser(String login, String password) throws DAOException;
	
	User register(String login, String password, String name, String phone) throws DAOException;
	
	User testLogin(String login) throws DAOException;
	
	User updateUserQR(String sessionId, String sessionIdComp) throws DAOException;
}
