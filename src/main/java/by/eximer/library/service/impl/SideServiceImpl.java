package by.eximer.library.service.impl;

import by.eximer.library.service.exeption.ServiceException;
import by.eximer.library.dao.DAOFactory;
import by.eximer.library.dao.SideDAO;
import by.eximer.library.dao.exception.DAOException;
import by.eximer.library.domain.User;
import by.eximer.library.service.SideService;

public class SideServiceImpl implements SideService{

	DAOFactory factory = DAOFactory.getInstance();
	SideDAO dao = factory.getSideDAO();
	
	@Override
	public User inBasket(int sessionId, int idProduct, String text) throws ServiceException {
		User user = null;
		
		try {
			user = dao.inBasket(sessionId, idProduct, text);
		} catch (DAOException e) {
			throw new ServiceException("message change!!!");
		}
		
		return user;
	}
	
	@Override
	public User inBookmarks(int sessionId, int idProduct, String text) throws ServiceException {
		User user = null;
		
		try {
			user = dao.inBookmarks(sessionId, idProduct, text);
		} catch (DAOException e) {
			throw new ServiceException("message change!!!");
		}
		
		return user;
	}

	@Override
	public User bookmarksAll(int sessionId) throws ServiceException {
		User user = null;
		
		try {
			user = dao.bookmarksAll(sessionId);
		} catch (DAOException e) {
			throw new ServiceException("message change!!!");
		}
		
		return user;
	}

	@Override
	public User actionsAll(int sessionId) throws ServiceException {
		User user = null;
		
		try {
			user = dao.actionsAll(sessionId);
		} catch (DAOException e) {
			throw new ServiceException("message change!!!");
		}
		
		return user;
	}

	@Override
	public User basketAll(int sessionId) throws ServiceException {
		User user = null;
		
		try {
			user = dao.basketAll(sessionId);
		} catch (DAOException e) {
			throw new ServiceException("message change!!!");
		}
		
		return user;
	}

}