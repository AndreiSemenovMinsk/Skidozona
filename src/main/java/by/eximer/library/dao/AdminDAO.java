package by.eximer.library.dao;

import by.eximer.library.dao.exception.DAOException;
import by.eximer.library.domain.User;


public interface AdminDAO {
	
	User addActions(int sessionId, int idProductBuyer, int idShop, String exp, String text, String kategorii) throws DAOException;
	
	User addProduct(int sessionId, int idShop, String tipy, String nazva, String text,
			String bigText, String rest, String kategorii) throws DAOException;

	User updateProduct(int sessionId, String name, String text, String bigText, int idProduct, String rest,
			String categories, String tipy) throws DAOException;

	User deleteProduct(int sessionId, int idProduct) throws DAOException;

	User myPlace(int sessionId, String latLeng) throws DAOException;

	User sound(int sessionId) throws DAOException;

	User removeSound(int sessionId, String tel) throws DAOException;

	User telReq(String idShop, String name, String tel) throws DAOException;

	User adminShop(int sessionId) throws DAOException;

	User admin(int sessionId) throws DAOException;

	User productActions(int sessionId, int productId) throws DAOException;

	User productTypes(int sessionId, int productId) throws DAOException;

	User addProductAction(int sessionId, int idProduct, int idActions) throws DAOException;
	
	User addProductType(int sessionId, int idProduct, int idType) throws DAOException;

}
