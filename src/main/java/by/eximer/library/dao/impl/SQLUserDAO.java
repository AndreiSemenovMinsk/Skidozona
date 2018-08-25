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

//import by.eximer.library.controller.impl.BasketAll;
//import by.eximer.library.controller.impl.UpdateUserQR;
import by.eximer.library.dao.UserDAO;
import by.eximer.library.dao.exception.DAOException;
import by.eximer.library.domain.User;
//import by.eximer.library.service.exeption.ServiceException;

import by.eximer.library.dao.impl.ConnectionPool;

public class SQLUserDAO implements UserDAO {

	final Logger log = LoggerFactory.getLogger(SQLUserDAO.class); //final Logger log = LogManager.getLogger(BasketAll.class.getName());
	
	@Override
	public User checkUser(String login, String password) throws DAOException {
		
		User user = null;
        ConnectionPool conPool = ConnectionPool.getInstance();   //ConnectionPool jdbc = new ConnectionPool();
        try (Connection connection = conPool.takeConnection()) {   
            
			System.out.println("sql0st login "+login+ " password " + password);
			
			try (PreparedStatement statement = connection
					.prepareStatement("select access, session_id from passwords where login=? and password=?"))
			{
			statement.setString(1, login);
			statement.setString(2, password);

			System.out.println("sql1");
			
				try (ResultSet rs = statement.executeQuery())
				{
				
				System.out.println("sql2");
	
					if (rs.next()) {
						user = new User();
						user.setAccess(rs.getString(1));				
						user.setSessionId(rs.getString(2));				
					}
	
				}
			}
		} catch (InterruptedException | SQLException e) {
			log.error("SQLUserDAO checkUser:"+e);
			throw new DAOException("message foe change", e);			
		} catch(Exception e) {
			log.error("SQLUserDAO checkUser:"+e);
            e.printStackTrace();
        } 
		return user;
	}
	/*
	 * @param String login, String password, String name, String phone
	 */
	@Override
	public User register(String login, String password, String name, String phone) throws DAOException {
		
		User user = null;
        ConnectionPool conPool = ConnectionPool.getInstance();   //ConnectionPool jdbc = new ConnectionPool();
        int rand = (int) Math.floor( Math.random()*100000000);
        
        try (Connection connection = conPool.takeConnection()) {   
            
			
			System.out.println("sql0st login "+login+ " password " + password);
			try (PreparedStatement statement = connection
					.prepareStatement("SELECT MAX(user_id) FROM passwords"))
			{
				try (ResultSet rs = statement.executeQuery())
				{
				
				if(rs.next()) {
				int maxId = rs.getInt(1) + 1;
				
				System.out.println("INSERT INTO passwords SET user_id="+maxId+", access=0, session_id="+rand+", login='"+login+"', password='"+password+"'");
				
					try (PreparedStatement st2 = connection
							.prepareStatement("INSERT INTO passwords (user_id, password, login, access, session_id, address, id_shop) VALUES( ?, ?, ?, 0, ?, 'no', 0, ?, ?)"))
					{
					st2.setInt(1, maxId);
					st2.setString(2, password);
					st2.setString(3, login);
					st2.setInt(4, rand);
					st2.setString(5, name);
					st2.setString(6, phone);
					st2.execute();	
					}
				} else {	
					throw new DAOException("SQLUserDAO register: NO SELECT MAX(user_id) FROM passwords");
				}
				
				user = new User();
				user.setSessionId("" +rand);
	
				}
			}
		} catch (InterruptedException | SQLException e) {
			log.error("SQLUserDAO register:"+e);
			throw new DAOException("message foe change", e);			
		} catch(Exception e) {
			log.error("SQLUserDAO register:"+e); 
        } 
		return user;
	}
	

	@Override
	public User updateUserQR(String sessionId, String sessionIdComp) throws DAOException {
		
		User user = null;
        ConnectionPool conPool = ConnectionPool.getInstance();   //ConnectionPool jdbc = new ConnectionPool();
       	
        try (Connection connection = conPool.takeConnection()) 
        {   
        	
            connection.setAutoCommit(false);
            
            try (PreparedStatement statement = connection
					.prepareStatement("UPDATE product_buyer SET id_buyer=(SELECT user_id FROM passwords WHERE session_id=?) "+
			"WHERE id_buyer=(SELECT user_id FROM passwords WHERE session_id=?)"))
            {
			statement.setString(1, sessionId);
			statement.setString(2, sessionIdComp);
			int res = statement.executeUpdate();
			System.out.println("UPDATE product_buyer"+res);
            }
            
            try (PreparedStatement st2 = connection
					.prepareStatement("UPDATE bookmarks SET id_buyer=(SELECT user_id FROM passwords WHERE session_id=?) "+
			"WHERE id_buyer=(SELECT user_id FROM passwords WHERE session_id=?)"))
            {
			st2.setString(1, sessionId);
			st2.setString(2, sessionIdComp);
			int res = st2.executeUpdate();
			System.out.println("UPDATE bookmarks"+res);
            }
			
			
            try (PreparedStatement st4 = connection
					.prepareStatement("SELECT user_id FROM passwords WHERE session_id=?"))
            {
			st4.setString(1, sessionId);
				try (ResultSet rs4 = st4.executeQuery())
				{
				
					if(rs4.next()) {
						try (PreparedStatement st5 = connection
							.prepareStatement("UPDATE passwords SET user_id=? WHERE session_id=?"))
						{
						st5.setInt(1, rs4.getInt(1));
						st5.setString(2, sessionIdComp);
						int res = st5.executeUpdate();
						}
					} else {	
						throw new DAOException("SQLUserDAO updateUserQR: NO SELECT user_id FROM passwords WHERE session_id");
					}
				}
			} 
        	
			user = new User();
			user.setSuccess(true);//user.setSessionId(sessionId);

			
			connection.commit();
			connection.setAutoCommit(true);
        	
		} catch (InterruptedException | SQLException e) {
			
			log.error("SQLUserDAO updateUserQR:"+e);
			throw new DAOException("message foe change", e);			
		} catch(Exception e) {
			log.error("SQLUserDAO updateUserQR:"+e);
            e.printStackTrace();
        } 
		return user;
	}
	
	@Override
	public User testLogin(String login) throws DAOException {
		
		User user = null;
        ConnectionPool conPool = ConnectionPool.getInstance();   //ConnectionPool jdbc = new ConnectionPool();
        try (Connection connection = conPool.takeConnection()) {   
 
        	try (PreparedStatement statement = connection.prepareStatement("SELECT EXISTS(SELECT login FROM passwords WHERE login=?)"))
        	{
        		statement.setString(1, login);
	            try (ResultSet rs = statement.executeQuery())
	            {
		            if (rs.next()) {
		            	user = new User();
						user.setTestLogin(rs.getString(1));
		            }
	        	}
        	}
                      
        } catch (InterruptedException | SQLException e ) {
			user = new User();
			user.setSuccess(false);
			throw new DAOException("message foe change", e);		
		} catch(Exception sqlException) {
            sqlException.printStackTrace();
        } 
        return user;
    }
	
}
