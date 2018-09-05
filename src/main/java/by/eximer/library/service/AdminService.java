package by.eximer.library.service;

import by.eximer.library.dao.exception.DAOException;
import by.eximer.library.domain.User;
import by.eximer.library.service.exeption.ServiceException;


public interface AdminService {
	
	/** 
     * ���������� ����� � ������
     * @param categories - ������ id ����� � ������������ "," 
     */
	User addActions(int sessionId, int idProductBuyer, int idShop, String exp, String text, String actions)
			throws ServiceException;
	
	User sound(int sessionId) throws ServiceException;
	/** 
     * ����������� � ����� ������ 
     */
	User addProduct(int sessionId) throws ServiceException;
	/** 
     * �������� ������ ����� ��� �������������� �������� ������ �������������� 
     * @param sessionId - id ������� 
     */
	User admin(int sessionId) throws ServiceException;
	/** 
     * �������� ������ ���� ������� 
     * @param sessionId - id �������  
     */
	User adminShop(int sessionId) throws ServiceException;
	/** 
     * �������� ������ ����� ��� ����������� ������
     * @param sessionId - id �������  
     * @param idProduct - id ��������  
     */
	User productTypes(int sessionId, int idProduct) throws ServiceException;

	User productActions(int sessionId, int idProduct) throws ServiceException;

	User addProductAction(int sessionId, int idProduct, String idAction) throws ServiceException;

	User addProductType(int sessionId, int idProduct, String idType) throws ServiceException;

	User updateProduct(int sessionId, String name, String text, String bigText, int idProduct, String cana) throws ServiceException;

	User fileUpload(int sessionId, int productId, String rest) throws ServiceException;

	User deleteProduct(int sessionId, int idProduct) throws ServiceException;
	
}
