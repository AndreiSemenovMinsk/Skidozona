package by.eximer.library.service.impl;

import by.eximer.library.service.exeption.ServiceException;
import by.eximer.library.dao.DAOFactory;
import by.eximer.library.dao.SideDAO;
import by.eximer.library.dao.AdminDAO;
import by.eximer.library.dao.exception.DAOException;
import by.eximer.library.domain.User;
import by.eximer.library.service.AdminService;
import by.eximer.library.service.UserService;

public class AdminServiceImpl implements AdminService{

	
	@Override
	public User addActions(int sessionId, int idProductBuyer, int idShop, 
			String exp, String text, String kategorii) throws  ServiceException {
		User user = null;
		
		DAOFactory factory = DAOFactory.getInstance();
		AdminDAO dao = factory.getAdminDAO();
		
		try {
			user = dao.addActions(sessionId, idProductBuyer, idShop, exp, text, kategorii);
		} catch (DAOException e) {
			// TODO Auto-generated catch block
			throw new ServiceException("message change!!!");
		}
		
		return user;
	}
	
	@Override
	public User updateProduct(int sessionId, String name, String text, String bigText, 
			int idProduct, String cana) throws  ServiceException {
		
		User user = null;
		DAOFactory factory = DAOFactory.getInstance();
		AdminDAO dao = factory.getAdminDAO();
		
		try {
			user = dao.updateProduct(sessionId, name, text, bigText, idProduct, cana);
		} catch (DAOException e) {
			// TODO Auto-generated catch block
			throw new ServiceException("message change!!!");
		}
		
		return user;
	}
	
	@Override
	public User sound(int sessionId) throws ServiceException {
		User user = null;
		DAOFactory factory = DAOFactory.getInstance();
		AdminDAO dao = factory.getAdminDAO();
		
		try {
			user = dao.sound(sessionId);
		} catch (DAOException e) {
			throw new ServiceException("message change!!!");
		}
		
		return user;
	}

	@Override
	public User adminShop(int sessionId) throws ServiceException {
		User user = null;
		DAOFactory factory = DAOFactory.getInstance();
		AdminDAO dao = factory.getAdminDAO();
		
		try {
			user = dao.adminShop(sessionId);
		} catch (DAOException e) {
			throw new ServiceException("message change!!!");
		}
		
		return user;
	}


	@Override
	public User admin(int sessionId) throws ServiceException {
		User user = null;
		DAOFactory factory = DAOFactory.getInstance();
		AdminDAO dao = factory.getAdminDAO();
		
		try {
			user = dao.admin(sessionId);
		} catch (DAOException e) {
			throw new ServiceException("message change!!!");
		}
		
		return user;
	}
	
	@Override
	public User addProduct(int sessionId) throws ServiceException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User addProductAction(int sessionId, int idProduct, String idAction) throws ServiceException {
		User user = null;
		DAOFactory factory = DAOFactory.getInstance();
		AdminDAO dao = factory.getAdminDAO();
		
		try {
			user = dao.addProductAction(sessionId, idProduct, idAction);
		} catch (DAOException e) {
			throw new ServiceException("message change!!!");
		}
		
		return user;
	}

	@Override
	public User addProductType(int sessionId, int idProduct, String idType) throws ServiceException {
		User user = null;
		DAOFactory factory = DAOFactory.getInstance();
		AdminDAO dao = factory.getAdminDAO();
		
		try {
			user = dao.addProductType(sessionId, idProduct, idType);
		} catch (DAOException e) {
			throw new ServiceException("message change!!!");
		}
		
		return user;
	}
	
	@Override
	public User productTypes(int sessionId, int idProduct) throws ServiceException {
		User user = null;
		DAOFactory factory = DAOFactory.getInstance();
		AdminDAO dao = factory.getAdminDAO();
		
		try {
			user = dao.productTypes(sessionId, idProduct);
		} catch (DAOException e) {
			throw new ServiceException("message change!!!");
		}
		
		return user;
	}

	@Override
	public User productActions(int sessionId, int idProduct) throws ServiceException {
		User user = null;
		DAOFactory factory = DAOFactory.getInstance();
		AdminDAO dao = factory.getAdminDAO();
		
		try {
			user = dao.productActions(sessionId, idProduct);
		} catch (DAOException e) {
			throw new ServiceException("message change!!!");
		}
		
		return user;
	}

	@Override
	public User fileUpload(int sessionId, int idProduct, String rest) throws ServiceException {

		User user = null;
		DAOFactory factory = DAOFactory.getInstance();
		AdminDAO dao = factory.getAdminDAO();
		
		try {
			user = dao.fileUpload(sessionId,  idProduct, rest);
		} catch (DAOException e) {
			// TODO Auto-generated catch block
			throw new ServiceException("message change!!!");
		}
		
		return user;
	}

	@Override
	public User deleteProduct(int sessionId, int idProduct) throws ServiceException {

		User user = null;
		DAOFactory factory = DAOFactory.getInstance();
		AdminDAO dao = factory.getAdminDAO();
		
		try {
			user = dao.deleteProduct(sessionId,  idProduct);
		} catch (DAOException e) {
			// TODO Auto-generated catch block
			throw new ServiceException("message change!!!");
		}
		
		return user;
	}

}