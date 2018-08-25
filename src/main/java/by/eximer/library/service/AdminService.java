package by.eximer.library.service;

import by.eximer.library.dao.exception.DAOException;
import by.eximer.library.domain.User;
import by.eximer.library.service.exeption.ServiceException;


public interface AdminService {
	
	
	User addActions(int sessionId, int idProductBuyer, int idShop, String exp, String text, String categories)
			throws ServiceException;
	
	User updateProduct(int sessionId, String nazva, String text, String bigText, int idTovar, String rest,
			String kategorii, String tipy) throws ServiceException;

	User sound(int sessionId) throws ServiceException;
	
	User addProduct(int sessionId) throws ServiceException;
	
	User addActions(int sessionId) throws ServiceException;
	
	User admin(int parseInt) throws ServiceException;

	User adminShop(int sessionId) throws ServiceException;

	User productTypes(int sessionId, int idProduct) throws ServiceException;

	User productActions(int sessionId, int idProduct) throws ServiceException;

	User addProductAction(int sessionId, int idProduct, int idAction) throws ServiceException;

	User addProductType(int sessionId, int idProduct, int idType) throws ServiceException;
	
}
