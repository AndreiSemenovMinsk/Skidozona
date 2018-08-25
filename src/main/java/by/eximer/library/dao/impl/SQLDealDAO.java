package by.eximer.library.dao.impl;

import java.sql.Connection;
import java.sql.Savepoint;
//import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

//import javax.sql.DataSource;

/*
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
*/
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import by.eximer.library.dao.DealDAO;
//import by.eximer.library.controller.impl.BasketAll;
//import by.eximer.library.controller.impl.UpdateUserQR;
import by.eximer.library.dao.UserDAO;
import by.eximer.library.dao.exception.DAOException;
import by.eximer.library.domain.User;
//import by.eximer.library.service.exeption.ServiceException;

import by.eximer.library.dao.impl.ConnectionPool;
//import by.eximer.library.dao.impl.DBResourceManager;

public class SQLDealDAO implements DealDAO {

	final Logger log = LoggerFactory.getLogger(SQLDealDAO.class); //final Logger log = LogManager.getLogger(BasketAll.class.getName());
	
	@Override
	public User approve(int sessionId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User approved(int sessionId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User refuse(int sessionId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
}
