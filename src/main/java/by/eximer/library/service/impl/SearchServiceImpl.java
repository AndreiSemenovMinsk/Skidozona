package by.eximer.library.service.impl;

import by.eximer.library.service.exeption.ServiceException;
import by.eximer.library.dao.DAOFactory;
import by.eximer.library.dao.SearchDAO;
import by.eximer.library.dao.exception.DAOException;
import by.eximer.library.domain.User;
import by.eximer.library.service.SearchService;

public class SearchServiceImpl implements SearchService{

	
	@Override
	public User like(String searchString) throws ServiceException {
		User user = null;
		
		DAOFactory factory = DAOFactory.getInstance();
		SearchDAO dao = factory.getSearchDAO();
		
		try {
			user = dao.like(searchString);
		} catch (DAOException e) {
			// TODO Auto-generated catch block
			throw new ServiceException("message change!!!");
		}
		
		return user;
	}

	@Override
	public User search(String searchString, String max, String min, String sort_price, int start, int size) throws ServiceException {
			User user = null;
		
		DAOFactory factory = DAOFactory.getInstance();
		SearchDAO dao = factory.getSearchDAO();
		
		try {
			user = dao.search(searchString, max, min, sort_price, start, size);
		} catch (DAOException e) {
			// TODO Auto-generated catch block
			throw new ServiceException("message change!!!");
		}
		
		return user;
	}
	
	@Override
	public User searchCategories(String searchString, String tip, String max, String min, String sort_price)  throws ServiceException {
			User user = null;
		
		DAOFactory factory = DAOFactory.getInstance();
		SearchDAO dao = factory.getSearchDAO();
		
		try {
			user = dao.searchCategories(searchString, tip, max, min, sort_price);
		} catch (DAOException e) {
			// TODO Auto-generated catch block
			throw new ServiceException("message change!!!");
		}
	
	return user;
	}

	@Override
	public User menu(String tip, String max, String min, String sort_price) throws ServiceException {
				User user = null;
			
			DAOFactory factory = DAOFactory.getInstance();
			SearchDAO dao = factory.getSearchDAO();
			
			try {
				user = dao.menu(tip, max, min, sort_price);
			} catch (DAOException e) {
				// TODO Auto-generated catch block
				throw new ServiceException("message change!!!");
			}
			
			return user;
	}
	
}