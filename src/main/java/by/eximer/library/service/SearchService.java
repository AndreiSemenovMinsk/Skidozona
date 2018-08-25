package by.eximer.library.service;

import by.eximer.library.dao.exception.DAOException;
import by.eximer.library.domain.User;
import by.eximer.library.service.exeption.ServiceException;


public interface SearchService {
	
	//////////////SEARCH
	
	User like(String searchString) throws ServiceException;
	
	User search(String searchString, String max, String min, String sort_price, int start, int size) throws ServiceException;
	
	User searchCategories(String searchString, String tip, String max, String min, String sort_price) throws ServiceException;
	
	User menu(String tip, String max, String min, String sort_price)throws ServiceException;
}
