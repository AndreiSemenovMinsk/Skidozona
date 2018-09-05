package by.eximer.library.service;

import by.eximer.library.dao.exception.DAOException;
import by.eximer.library.domain.User;
import by.eximer.library.service.exeption.ServiceException;


public interface AdminService {
	
	/** 
     * добавление акций к товару
     * @param categories - строка id акций с разделителем "," 
     */
	User addActions(int sessionId, int idProductBuyer, int idShop, String exp, String text, String actions)
			throws ServiceException;
	
	User sound(int sessionId) throws ServiceException;
	/** 
     * уведомление о новой заявке 
     */
	User addProduct(int sessionId) throws ServiceException;
	/** 
     * загрузка списка типов при первоначальной загрузке панели администратора 
     * @param sessionId - id клиента 
     */
	User admin(int sessionId) throws ServiceException;
	/** 
     * загрузка списка всех товаров 
     * @param sessionId - id клиента  
     */
	User adminShop(int sessionId) throws ServiceException;
	/** 
     * загрузка списка типов для конкретного товара
     * @param sessionId - id клиента  
     * @param idProduct - id продукта  
     */
	User productTypes(int sessionId, int idProduct) throws ServiceException;

	User productActions(int sessionId, int idProduct) throws ServiceException;

	User addProductAction(int sessionId, int idProduct, String idAction) throws ServiceException;

	User addProductType(int sessionId, int idProduct, String idType) throws ServiceException;

	User updateProduct(int sessionId, String name, String text, String bigText, int idProduct, String cana) throws ServiceException;

	User fileUpload(int sessionId, int productId, String rest) throws ServiceException;

	User deleteProduct(int sessionId, int idProduct) throws ServiceException;
	
}
