package by.eximer.library.dao;

import by.eximer.library.dao.exception.DAOException;
import by.eximer.library.domain.User;


public interface SearchDAO {
	
	User search(String searchString, String max, String min, String sort_price, int start, int size) throws DAOException;
	
	User like(String searchString) throws DAOException;

	User menu(String tip, String max, String min, String sort_price) throws DAOException;

	User searchCategories(String searchString, String tip, String max, String min, String sort_price) throws DAOException;
}
