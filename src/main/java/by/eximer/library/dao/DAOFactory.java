package by.eximer.library.dao;

import by.eximer.library.dao.impl.SQLAdminDAO;
import by.eximer.library.dao.impl.SQLDealDAO;
import by.eximer.library.dao.impl.SQLSearchDAO;
import by.eximer.library.dao.impl.SQLSideDAO;
import by.eximer.library.dao.impl.SQLUserDAO;


public class DAOFactory {
	private static final DAOFactory instance = new DAOFactory();
	
	private final UserDAO 	userDAO 	= new SQLUserDAO();
	private final SearchDAO searchDAO 	= new SQLSearchDAO();
	private final SideDAO sideDAO 		= new SQLSideDAO();
	private final DealDAO dealDAO 		= new SQLDealDAO();
	private final AdminDAO adminDAO 	= new SQLAdminDAO();
	
	private DAOFactory(){}
	
	public static DAOFactory getInstance(){
		return instance;
	}

	public UserDAO getUserDAO() {
		return userDAO;
	}
	public SearchDAO getSearchDAO() {
		return searchDAO;
	}
	public SideDAO getSideDAO() {
		return sideDAO;
	}
	public DealDAO getDealDAO() {
		return dealDAO;
	}
	public AdminDAO getAdminDAO() {
		return adminDAO;
	}
}
