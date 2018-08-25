package by.eximer.library.service;

import by.eximer.library.dao.exception.DAOException;
import by.eximer.library.domain.User;
import by.eximer.library.service.exeption.ServiceException;


public interface DealService {
	
	////////////   DEAL 
	
	User approve(int sessionId) throws ServiceException;
	
	User approved(int sessionId) throws ServiceException;
	
	User refuse(int sessionId) throws ServiceException;
	
}
