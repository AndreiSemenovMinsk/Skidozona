package by.eximer.library.service;

import by.eximer.library.dao.exception.DAOException;
import by.eximer.library.domain.User;
import by.eximer.library.service.exeption.ServiceException;


public interface SideService {
	
	User actionsAll(int sessionId) throws ServiceException;

	User basketAll(int sessionId)  throws ServiceException;

	User bookmarksAll(int sessionId)  throws ServiceException;

	User inBasket(int sessionId, int idProduct, String text) throws ServiceException;

	User inBookmarks(int sessionId, int idProduct, String text) throws ServiceException;

}
