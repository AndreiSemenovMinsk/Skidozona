package by.eximer.library.service.impl;

import by.eximer.library.service.exeption.ServiceException;
import by.eximer.library.dao.DAOFactory;
import by.eximer.library.dao.UserDAO;
import by.eximer.library.dao.exception.DAOException;
import by.eximer.library.domain.User;
import by.eximer.library.service.DealService;
import by.eximer.library.service.UserService;

public class DealServiceImpl implements DealService{

	
	@Override
	public User approve(int sessionId) throws ServiceException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User approved(int sessionId) throws ServiceException {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public User refuse(int sessionId) throws ServiceException {
		// TODO Auto-generated method stub
		return null;
	}
	
}