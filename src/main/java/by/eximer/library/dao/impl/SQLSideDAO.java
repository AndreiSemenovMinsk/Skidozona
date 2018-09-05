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

import by.eximer.library.dao.SideDAO;
//import by.eximer.library.controller.impl.BasketAll;
//import by.eximer.library.controller.impl.UpdateUserQR;
import by.eximer.library.dao.UserDAO;
import by.eximer.library.dao.exception.DAOException;
import by.eximer.library.domain.User;
//import by.eximer.library.service.exeption.ServiceException;

import by.eximer.library.dao.impl.ConnectionPool;
//import by.eximer.library.dao.impl.DBResourceManager;

public class SQLSideDAO implements SideDAO {

	final Logger log = LoggerFactory.getLogger(SQLSideDAO.class); //final Logger log = LogManager.getLogger(BasketAll.class.getName());
	
	
	@Override
	public User bookmarksRadius(int sessionId, String radius, String idRadius) throws DAOException {
		User user = null;
        ConnectionPool conPool = ConnectionPool.getInstance();   //ConnectionPool jdbc = new ConnectionPool();
        try (Connection connection = conPool.takeConnection()) {   
           
			try (PreparedStatement statement = connection
						.prepareStatement("UPDATE bookmarks SET bookmarks.radius=? WHERE bookmarks.id=? AND "+
			"id_buyer IN (SELECT passwords.user_id FROM passwords WHERE passwords.session_id=?) "))
			{
			statement.setString(1, radius);
			statement.setString(2, idRadius);
			statement.setInt(3, sessionId);

			statement.executeUpdate();
			
				user = new User();
				user.setSuccess(true);
			}
		} catch (InterruptedException | SQLException e) {
			user = new User();
			user.setSuccess(false);
			log.error("SQLUserDAO bookmarksRadius:"+e);
			throw new DAOException("message foe change", e);			
		} catch(Exception e) {
			log.error("SQLUserDAO bookmarksRadius:"+e);
            e.printStackTrace();
        } 
		return user;
	}
	
	@Override
	public User actionsRadius(int sessionId, String radius, String idRadius) throws DAOException {
		User user = null;
		
		
        ConnectionPool conPool = ConnectionPool.getInstance();   //ConnectionPool jdbc = new ConnectionPool();
        try (Connection connection = conPool.takeConnection()) {   
            
        	try (PreparedStatement statement = connection
						.prepareStatement("UPDATE product_buyer SET radius=? WHERE id=? AND"+
			" id_buyer IN (SELECT passwords.user_id FROM passwords WHERE passwords.session_id=?) "))
        	{
			statement.setString(1, radius);
			statement.setString(2, idRadius);
			statement.setInt(3, sessionId);
			
			statement.executeUpdate();
			System.out.println("synchronized askBook");
			}
			
			user = new User();
			user.setSuccess(true);
			
		} catch (InterruptedException | SQLException e) {
			user = new User();
			user.setSuccess(false);
			log.error("SQLUserDAO bookmarksRadius:"+e);
			throw new DAOException("message foe change", e);			
		} catch(Exception e) {
			log.error("SQLUserDAO bookmarksRadius:"+e);
            e.printStackTrace();
        } 

		return user;
	}
	
	@Override
	public User actionsAll(int sessionId) throws DAOException {
		User user = null;
		ConnectionPool conPool = ConnectionPool.getInstance();   
		
        try (Connection connection = conPool.takeConnection()) 
        {   
        	
		 try (PreparedStatement statement = connection
				.prepareStatement("SELECT product.id, product.nazva, product.cana, product.rest, product_buyer.text, "+
			"product_buyer.radius, actions.text, shop.geo, shop.nazva, shop.id, product_buyer.id "+
			"FROM shop LEFT JOIN actions ON (actions.id_shop=shop.id) "+
			"LEFT JOIN product_actions ON (actions.id=product_actions.id_actions) "+
			"LEFT JOIN product ON (product.id=product_actions.id_product) "+
			"LEFT JOIN product_buyer ON (product_buyer.id_product=product.id) "+
			"LEFT JOIN passwords  ON product_buyer.id_buyer=passwords.user_id "+
			"WHERE passwords.session_id=? AND product_buyer.approved=1"))
			 {
				statement.setInt(1, sessionId);
	
				try (ResultSet rs = statement.executeQuery())
				{
					user = new User();
						
					while (rs.next()) {
						
						int i = 0; 
						ArrayList<String> shopId = new ArrayList<String>();
						boolean cont = true;
						for (String name : shopId) {
							if (name == rs.getString(10))
							{
								cont = false;
								break;
							}
							i++;
						}
											
						if (cont) {			
							shopId.add(rs.getString(10));
							user.setShopName(rs.getString(9));
						}
						
						ArrayList<String> stringList = new ArrayList<String>();	
						stringList.add(rs.getString(1)); //product.id           0
						stringList.add(rs.getString(2)); //product.nazva 		1
						stringList.add(rs.getString(3)); //product.cana			2
						stringList.add(rs.getString(4)); //product.rest			3
						stringList.add(rs.getString(5)); //product_buyer.text	4
						stringList.add(rs.getString(6)); //product_buyer.radius	5
						stringList.add(rs.getString(7)); //actions.text			6
						stringList.add(rs.getString(8)); //shop.geo				7
						stringList.add(rs.getString(9)); //shop.nazva			8
						stringList.add(rs.getString(10)); //shop.id				9
						stringList.add(rs.getString(11)); //product_buyer.id	10
										
						user.setUpdateActions(stringList, i);
					}
				}
			}
		} catch (InterruptedException | SQLException e) {
			user = new User();
			user.setSuccess(false);
			log.error("SQLUserDAO updateActions:"+e);
			throw new DAOException("message foe change", e);			
		} catch(Exception e) {
			log.error("SQLUserDAO updateActions:"+e);
        } 
		return user;
	}
	
	@Override
	public User basketAll(int sessionId) throws DAOException {
		
		User user = null;	
        ConnectionPool conPool = ConnectionPool.getInstance();
        try (Connection connection = conPool.takeConnection()) {   
           
        	try (PreparedStatement statement = connection
					.prepareStatement("SELECT product.id, product.nazva,  product.cana, product.rest, product_buyer.text, "+
							"product_buyer.radius, actions.text, shop.geo, shop.nazva, shop.id "+
							"FROM shop LEFT JOIN actions ON (actions.id_shop=shop.id) "+
							"LEFT JOIN product_actions ON (actions.id=product_actions.id_actions) "+
							"LEFT JOIN product ON (product.id=product_actions.id_product) "+
							"LEFT JOIN product_buyer ON (product_buyer.id_product=product.id) "+
							"LEFT JOIN passwords  ON product_buyer.id_buyer=passwords.user_id "+
							"WHERE passwords.session_id=? AND product_buyer.approved=3"))
        	{
				statement.setInt(1, sessionId);
				
				try (ResultSet rs = statement.executeQuery())
				{
					user = new User();
						
					while (rs.next()) 
					{		
						int i = 0; 
						ArrayList<String> shopId = new ArrayList<String>();
						boolean cont = true;
						for (String name : shopId) {
							if (name == rs.getString(10))
							{
								cont = false;
								break;
							}
							i++;
						}
											
						if (cont) {			
							shopId.add(rs.getString(10));
							user.setShopName(rs.getString(9));
						}
						
						ArrayList<String> stringList = new ArrayList<String>();	
						stringList.add(rs.getString(1)); //product.id           0
						stringList.add(rs.getString(2)); //product.nazva 		1
						stringList.add(rs.getString(3)); //product.cana			2
						stringList.add(rs.getString(4)); //product.rest			3
						stringList.add(rs.getString(5)); //product_buyer.text	4
						stringList.add(rs.getString(6)); //product_buyer.radius	5
						stringList.add(rs.getString(7)); //actions.text			6
						stringList.add(rs.getString(8)); //shop.geo				7
						stringList.add(rs.getString(10)); //shop.id				8
						
						user.setBasketAll(stringList, i);
					}
				}
        	}
		} catch (InterruptedException | SQLException e) {
			log.error("SQLUserDAO basketAll:"+e);
			throw new DAOException("message foe change", e);			
		} catch(Exception e) {
			log.error("SQLUserDAO basketAll:"+e);
        } 
		return user;
	}
	

	@Override
	public User bookmarksAll(int sessionId) throws DAOException {
											
		User user = null;		
        ConnectionPool conPool = ConnectionPool.getInstance();   //ConnectionPool jdbc = new ConnectionPool();
        try (Connection connection = conPool.takeConnection()) {   
        	try (PreparedStatement statement = connection
					.prepareStatement("SELECT product.id, product.nazva, product.cana, product.rest, "+
					"bookmarks.id, bookmarks.radius, shop.geo, shop.nazva, shop.id "+
					"FROM shop LEFT JOIN product ON shop.id=product.id_shop LEFT JOIN bookmarks ON (product.id=bookmarks.id_product)"+
					" LEFT JOIN passwords ON (bookmarks.id_buyer=passwords.user_id) WHERE passwords.session_id=?"))
        	{
			
				statement.setInt(1, sessionId);
				try (ResultSet rs = statement.executeQuery())
				{
				user = new User();
	
					while (rs.next()) {
						System.out.println("bookmark "+rs.getString(1));
						ArrayList<String> stringList = new ArrayList<String>();
						
						stringList.add(rs.getString(1));//product.id		0
						stringList.add(rs.getString(2));//product.nazva		1
						stringList.add(rs.getString(3));//product.cana		2	
						stringList.add(rs.getString(4));//product.rest		3
						stringList.add(rs.getString(5));//bookmarks.id		4
						stringList.add(rs.getString(6));//bookmarks.radius	5
						stringList.add(rs.getString(7));//shop.geo			6
						stringList.add(rs.getString(8));//shop.nazva		7
						stringList.add(rs.getString(9));//shop.id			8
						
						user.setBookmarks(stringList);		
					}
				}
        	}
		} catch (InterruptedException | SQLException e) {
			log.error("SQLUserDAO bookmarks:"+e);
			throw new DAOException("message foe change", e);			
		} catch(Exception e) {
			log.error("SQLUserDAO bookmarks:"+e);
            e.printStackTrace();
        } 
		return user;
	}
	
	
	@Override
	public User inBasket(int sessionId, int idProduct, String text) throws DAOException {
		
		User user = null;
		
        ConnectionPool conPool = ConnectionPool.getInstance();   //ConnectionPool jdbc = new ConnectionPool();
        try (Connection connection = conPool.takeConnection()) {   
            //connection = conPool.takeConnection();//DataSource dataSource = jdbc.setUpPool();
			
			//synchronized(dataSource) {
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yy/MM/dd HH:mm:ss");
				LocalDateTime now = LocalDateTime.now();	
			//connection = dataSource.getConnection();
						
			System.out.println("INSERT INTO product_buyer SET id_buyer=(SELECT user_id FROM passwords WHERE session_id="+sessionId+"), id_product="+idProduct+"," + 
					" id_actions=0, text="+text+", data=?, approved=3, oplaceno=0");
					
			try (PreparedStatement statement = connection
					.prepareStatement("INSERT INTO product_buyer SET id_buyer=(SELECT user_id FROM passwords WHERE session_id=?), id_product=?," + 
					" id_actions=0, text=?, data=?, approved=3, oplaceno=0, radius=0"))
			{
					//id_actions=(SELECT id FROM product_actions LEFT JOIN actions ON actions.default=true LIMIT 1),
			statement.setInt(1, sessionId);
			statement.setInt(2, idProduct);
			statement.setString(3, text);
			statement.setString(4, dtf.format(now));
			
			statement.execute();	//executeUpdate() executeQuery();
			//}
			user = new User();
			user.setSuccess(true);
			}
		} catch (InterruptedException | SQLException e) {
			log.error("SQLUserDAO inBasket:"+e);
			throw new DAOException("message foe change", e);			
		} catch(Exception e) {
			log.error("SQLUserDAO inBasket:"+e);
            e.printStackTrace();
        } 
		return user;
	}
	
	@Override
	public User inBookmarks(int sessionId, int idProduct, String radius) throws DAOException {
		
		User user = null;
		
        ConnectionPool conPool = ConnectionPool.getInstance();   //ConnectionPool jdbc = new ConnectionPool();
        try (Connection connection = conPool.takeConnection()) {   
            
			System.out.println("INSERT INTO bookmarks SET id_buyer=(SELECT user_id FROM passwords WHERE session_id="+sessionId+
					"), id_product="+idProduct+", radius="+radius);
			
			try (PreparedStatement statement = connection
					.prepareStatement("INSERT INTO bookmarks SET id_buyer=(SELECT user_id FROM passwords WHERE session_id=?), id_product=?, radius=?"))
			{
			statement.setInt(1, sessionId);
			statement.setInt(2, idProduct);
			statement.setString(3, radius);
			statement.execute();	//executeUpdate() executeQuery();
			
			System.out.println("sql2 ");
			user = new User();
			user.setSuccess(true);
        	}
		} catch (InterruptedException | SQLException e) {
			log.error("SQLUserDAO inBookmarks:"+e);
			throw new DAOException("message foe change", e);			
		} catch(Exception e) {
			log.error("SQLUserDAO inBookmarks:"+e);
            e.printStackTrace();
        } 
		return user;
	}
	
	@Override
	public User deleteBookmarks(int sessionId, int idBookmarks) throws DAOException {
		
		User user = null;
        ConnectionPool conPool = ConnectionPool.getInstance();   //ConnectionPool jdbc = new ConnectionPool();
        try (Connection connection = conPool.takeConnection()) {   
            //connection = conPool.takeConnection();//DataSource dataSource = jdbc.setUpPool();
			//connection = dataSource.getConnection();		
			user = new User();
			try (PreparedStatement statement = connection
					.prepareStatement("SELECT access, user_id FROM passwords WHERE session_id=?"))
			{
			statement.setInt(1, sessionId);
			
				try (ResultSet rs = statement.executeQuery())
				{
				
					if (rs.next()) {
						user = new User();
						if (rs.getInt(1)==5){
							
							try (PreparedStatement st2 = connection
									.prepareStatement("DELETE FROM bookmarks WHERE id=? AND id_buyer=?"))
							{
							st2.setInt(1, idBookmarks);
							st2.setInt(2, rs.getInt(2));
							st2.executeUpdate();
							
							user = new User();
							user.setSuccess(true);
							}
						}
					}
				}
			}
		} catch (InterruptedException | SQLException e) {
			throw new DAOException("message foe change", e);			
		} catch(Exception sqlException) {
            sqlException.printStackTrace();
        } 
		return user;
	}

}
