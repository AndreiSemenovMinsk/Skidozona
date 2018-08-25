package by.eximer.library.dao;

import by.eximer.library.dao.exception.DAOException;
import by.eximer.library.domain.User;


public interface SideDAO {
	
	User actionsAll(int sessionId) throws DAOException;

	User basketAll(int sessionId) throws DAOException;
 
	User bookmarksAll(int sessionId) throws DAOException;
	
	User inBasket(int sessionId, int idProduct, String text) throws DAOException;
	
	User inBookmarks(int sessionId, int idProduct, String text) throws DAOException;
	
	User actionsRadius(int sessionId, String radius, String idRadius) throws DAOException;

	User bookmarksRadius(int sessionId, String radius, String idRadius) throws DAOException;

	User deleteBookmarks(int sessionId, int idProduct) throws DAOException;

}
