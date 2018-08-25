package by.eximer.library.dao;

import by.eximer.library.dao.exception.DAOException;
import by.eximer.library.domain.User;


public interface DealDAO {
	
	
	User approve(int sessionId);
	
	User approved(int sessionId);
	
	User refuse(int sessionId);
	
	
}
