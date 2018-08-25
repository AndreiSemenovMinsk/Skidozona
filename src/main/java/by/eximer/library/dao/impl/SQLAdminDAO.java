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

import by.eximer.library.dao.AdminDAO;
//import by.eximer.library.controller.impl.BasketAll;
//import by.eximer.library.controller.impl.UpdateUserQR;
import by.eximer.library.dao.UserDAO;
import by.eximer.library.dao.exception.DAOException;
import by.eximer.library.domain.User;
//import by.eximer.library.service.exeption.ServiceException;

import by.eximer.library.dao.impl.ConnectionPool;
//import by.eximer.library.dao.impl.DBResourceManager;

public class SQLAdminDAO implements AdminDAO {

	final Logger log = LoggerFactory.getLogger(SQLAdminDAO.class); //final Logger log = LogManager.getLogger(BasketAll.class.getName());
	
	
	@Override
	public User telReq(String idShop, String name, String tel) throws DAOException {
		
		User user = null;
		ConnectionPool conPool = ConnectionPool.getInstance();   //ConnectionPool jdbc = new ConnectionPool();
        int rand = (int) Math.floor( Math.random()*100000000);
        try (Connection connection = conPool.takeConnection()) {   
            
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yy/MM/dd HH:mm:ss");
			LocalDateTime now = LocalDateTime.now();
			
			
			try (PreparedStatement statement = connection
					.prepareStatement("INSERT INTO day_req SET id_shop=?, name=?, tel=?, day_req=?"))
			{
			statement.setString(1, idShop);
			statement.setString(2, name);
			statement.setString(3, tel);
			statement.setString(4, dtf.format(now));
			statement.execute();	//executeUpdate() executeQuery();
			
			System.out.println("sql2 ");
			user = new User();
			user.setSessionId("" +rand);
			}
		} catch (InterruptedException | SQLException e) {
			log.error("SQLUserDAO telReq:"+e);
			throw new DAOException("message foe change", e);			
		} catch(Exception e) {
			log.error("SQLUserDAO telReq:"+e);
            e.printStackTrace();
        } 
		return user;
	}
	
	@Override
	public User addProduct(int sessionId, int idShop, 
								String tipy, String name, String text, String bigText, String rest, String kategorii) throws DAOException {
		
		User user = null;
        ConnectionPool conPool = ConnectionPool.getInstance();   //ConnectionPool jdbc = new ConnectionPool();
        try (Connection connection = conPool.takeConnection()) {   
            //connection = conPool.takeConnection();//DataSource dataSource = jdbc.setUpPool();
			//connection = dataSource.getConnection();		
			
			user = new User();
			try (PreparedStatement statement = connection
					.prepareStatement("SELECT access FROM passwords WHERE session_id=?"))
			{
			statement.setInt(1, sessionId);
			
				try (ResultSet rs = statement.executeQuery())
				{
				
				if (rs.next()) 
					{
					user = new User();
					if (rs.getInt(1)==5)
						{
							try (PreparedStatement st2 = connection
									.prepareStatement("INSERT INTO product SET id_shop=?, name=?, text=?, big_text=?, rest=?; SELECT LAST_INSERT_ID();"))
							{
								st2.setInt(1, idShop);
								st2.setString(2, tipy);
								st2.setString(3, name);
								st2.setString(4, text);
								st2.setString(5, bigText);
								st2.setString(6, rest);
								
								try (ResultSet  rs2 = st2.executeQuery())
								{
									int id_product = rs2.getInt(1);
									
									String[] kategorii_arr = kategorii.split("|");
									for (String kategorii_sub : kategorii_arr)
									{
										try (PreparedStatement st3 = connection
												.prepareStatement("INSERT INTO product_tipy SET id_product=?, id_tip=?"))
										{
										st3.setInt(1, id_product);
										st3.setString(2, kategorii_sub);
										}
									}
									
									System.out.println("addActions");
									user = new User();
									user.setSuccess(true);
								}
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
	
	@Override
	public User addActions(int sessionId, int idProductBuyer, int idShop, 
								String exp, String text, String kategorii) throws DAOException {
		
		User user = null;
        ConnectionPool conPool = ConnectionPool.getInstance();   //ConnectionPool jdbc = new ConnectionPool();
        try (Connection connection = conPool.takeConnection()) {   
            
			user = new User();
			try (PreparedStatement statement = connection
					.prepareStatement("SELECT access FROM passwords WHERE session_id=?"))
			{
			statement.setInt(1, sessionId);		
				try (ResultSet rs = statement.executeQuery())
				{
					if (rs.next()) {
						user = new User();
						if (rs.getInt(1)==5){
							
							DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yy/MM/dd HH:mm:ss");
							LocalDateTime now = LocalDateTime.now();
							
							try (PreparedStatement st2 = connection
									.prepareStatement("INSERT INTO actions SET id_shop=?, data_expiration=?, data_publ=?, text=?"))
							{
							
							st2.setInt(1, idProductBuyer);
							st2.setInt(2, idShop);
							st2.setString(3, exp);
							st2.setString(4, dtf.format(now));
							st2.setString(5, text);
							st2.execute();
							
							System.out.println("addActions");
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

	@Override
	public User addProductAction(int sessionId, int idProduct, int idActions) throws DAOException {
		
		User user = null;
        ConnectionPool conPool = ConnectionPool.getInstance();   //ConnectionPool jdbc = new ConnectionPool();
        try (Connection connection = conPool.takeConnection()) {   
            
			user = new User();
			try (PreparedStatement statement = connection
					.prepareStatement("SELECT access FROM passwords WHERE session_id=? "))
			{
				statement.setInt(1, sessionId);
				
				try (ResultSet rs = statement.executeQuery())
				{
					if (rs.next()) {
						user = new User();
						if (rs.getInt(1)==1){
							
							try (PreparedStatement st2 = connection
									.prepareStatement("INSERT INTO product_actions SET  "+
							"id_actions=(SELECT id FROM actions LEFT JOIN passwords ON (actions.id_shop=passwords.id_shop) WHERE session_id=? AND actions.id=?), "+
							"id_product=(SELECT id FROM product LEFT JOIN passwords ON (product.id_shop=passwords.id_shop) WHERE session_id=? AND product.id=?) "))
							{
						    st2.setInt(1, sessionId);	
							st2.setInt(2, idActions);
							st2.setInt(3, sessionId);
							st2.setInt(4, idProduct);
							st2.execute();
							
							System.out.println("addProductActions");
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

	@Override
	public User addProductType(int sessionId, int idProduct, int idType) throws DAOException {
		
		User user = null;
        ConnectionPool conPool = ConnectionPool.getInstance();   //ConnectionPool jdbc = new ConnectionPool();
        try (Connection connection = conPool.takeConnection()) {   
            
			user = new User();
			try (PreparedStatement statement = connection
					.prepareStatement("SELECT access FROM passwords WHERE session_id=? "))
			{
				statement.setInt(1, sessionId);
				
				try (ResultSet rs = statement.executeQuery())
				{
					if (rs.next()) {
						user = new User();
						if (rs.getInt(1)==1){
							
							try (PreparedStatement st2 = connection
									.prepareStatement("INSERT INTO product_tipy SET  id_tip=?, "+
							"id_product=(SELECT id FROM product LEFT JOIN passwords ON (product.id_shop=passwords.id_shop) WHERE session_id=? AND product.id=?) "))
							{
							st2.setInt(1, idType);
							st2.setInt(2, sessionId);
							st2.setInt(3, idProduct);
							st2.execute();
							
							System.out.println("addProductType");
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
		
	@Override
	public User admin(int sessionId) throws DAOException {
		
		User user = null;
        ConnectionPool conPool = ConnectionPool.getInstance();   //ConnectionPool jdbc = new ConnectionPool();
        try (Connection connection = conPool.takeConnection()) {   
            //connection = conPool.takeConnection();//DataSource dataSource = jdbc.setUpPool();
			//connection = dataSource.getConnection();		
			user = new User();
			try (PreparedStatement statement = connection
					.prepareStatement("SELECT access, id_shop FROM passwords WHERE session_id=?"))
			{
			statement.setInt(1, sessionId);
			
			System.out.println("sessionId"+sessionId);
			
				try (ResultSet rs = statement.executeQuery())
				{
				System.out.println("admin executeQuery");
				
				if (rs.next()) {
					System.out.println("rs.getInt(1)"+rs.getInt(1));
					if (rs.getInt(1)==5){
							
							/*st2 = connection
									.prepareStatement("SELECT actions.text, actions.id FROM actions LEFT JOIN passwords ON "+
							"(passwords.id_shop=actions.id_shop) WHERE passwords.session_id=?");
							st2.setInt(1, sessionId);
							
							rs2 = st2.executeQuery();
							
							while (rs2.next()) {
								ArrayList<String> stringList = new ArrayList<String>();
								stringList.add(rs2.getString(1));
								stringList.add(rs2.getString(2));
								user.setActions(stringList);						 
							}*/
							
							try (PreparedStatement st3 = connection
									.prepareStatement("SELECT name, id FROM tipy"))
							{
								try (ResultSet rs3 = st3.executeQuery())
								{
							
									while (rs3.next()) {
										ArrayList<String> stringList = new ArrayList<String>();
										stringList.add(rs3.getString(1));
										stringList.add(rs3.getString(2));
										user.setTypes(stringList);						 
									}
								}
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
	
	@Override
	public User productActions(int sessionId, int productId) throws DAOException {
		
		User user = null;
        ConnectionPool conPool = ConnectionPool.getInstance();   //ConnectionPool jdbc = new ConnectionPool();
        try (Connection connection = conPool.takeConnection()) {   
            
			user = new User();
			//the selection is possible only to the products, available to the admin of the shop
							try (PreparedStatement st2 = connection
							.prepareStatement("SELECT actions.text, actions.id FROM actions LEFT JOIN product_actions ON (product_actions.id_actions=actions.id) "+
											"LEFT JOIN product ON (product.id=product_actions.id_product) "+
											"LEFT JOIN passwords ON (product.id_shop=passwords.id_shop) "+
											"WHERE  passwords.session_id=? AND product.id=?"))
							{
								st2.setInt(1, sessionId);
								st2.setInt(2, productId);
								
								try (ResultSet rs2 = st2.executeQuery())
								{
										while (rs2.next()) {
											
											ArrayList<String> stringList = new ArrayList<String>();
											stringList.add(rs2.getString(1));	
											stringList.add(rs2.getString(2));	
											user.setActions(stringList);	
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
	
	@Override
	public User productTypes(int sessionId, int productId) throws DAOException {
		
		User user = null;
        ConnectionPool conPool = ConnectionPool.getInstance();   //ConnectionPool jdbc = new ConnectionPool();
        try (Connection connection = conPool.takeConnection()) {   
            
			user = new User();
			//the selection is possible only to the products, available to the admin of the shop
							try (PreparedStatement st2 = connection
							.prepareStatement("SELECT tipy.name, tipy.category, tipy.id FROM tipy LEFT JOIN product_tipy ON (product_tipy.id_tipy=tipy.id) "+
											"LEFT JOIN product ON (product.id=product_tipy.id_product) "+
											"LEFT JOIN passwords ON (product.id_shop=passwords.id_shop) "+
											"WHERE  passwords.session_id=? AND product.id=?"))
							{
								st2.setInt(1, sessionId);
								st2.setInt(2, productId);
								
								try (ResultSet rs2 = st2.executeQuery())
								{
										while (rs2.next()) {
											
											ArrayList<String> stringList = new ArrayList<String>();
											stringList.add(rs2.getString(1));	
											stringList.add(rs2.getString(2));	
											user.setTypes(stringList);	
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
	
	@Override
	public User adminShop(int sessionId) throws DAOException {
		
		User user = null;
        ConnectionPool conPool = ConnectionPool.getInstance();   //ConnectionPool jdbc = new ConnectionPool();
        try (Connection connection = conPool.takeConnection()) {   
            //connection = conPool.takeConnection();//DataSource dataSource = jdbc.setUpPool();
			//connection = dataSource.getConnection();		
			user = new User();
			try (PreparedStatement statement = connection
					.prepareStatement("SELECT access, id_shop FROM passwords WHERE session_id=?"))
			{
			statement.setInt(1, sessionId);
			System.out.println("sessionId"+sessionId);
				try (ResultSet rs = statement.executeQuery())
				{
				
					if (rs.next()) 
					{
						System.out.println("rs.getInt(1)"+rs.getInt(1));
						if (rs.getInt(1)==5)
						{
							try (PreparedStatement st3 = connection
									.prepareStatement("SELECT product.text, product.id, product.id_shop, product.rest, product.name, product.big_text FROM "+
									" product LEFT JOIN passwords ON (passwords.id_shop=product.id_shop) WHERE  session_id=?"))
							{
								st3.setInt(1, sessionId);
								
								try (ResultSet rs3 = st3.executeQuery())
								{
										while (rs3.next()) {
											
											ArrayList<String> stringList1 = new ArrayList<String>();
											stringList1.add(rs3.getString(1));	//product.text
											stringList1.add(rs3.getString(2));	//product.id
											stringList1.add(rs3.getString(3));	//product.id_shop
											stringList1.add(rs3.getString(4));	//product.rest
											stringList1.add(rs3.getString(5));	//product.name
											stringList1.add(rs3.getString(6));	//product.big_text
											user.setUpdateShopProduct(stringList1);
									}	
								}
							}	
							
							try (PreparedStatement 	st6 = connection
									.prepareStatement("SELECT actions.text, actions.id FROM actions LEFT JOIN passwords ON "+
							"(passwords.id_shop=actions.id_shop) WHERE passwords.session_id=?"))
							{
							st6.setInt(1, sessionId);
							
								try (ResultSet rs6 = st6.executeQuery())
								{
								System.out.println("st6.executeQuery");
								
									while (rs6.next()) {
										ArrayList<String> stringList = new ArrayList<String>();
										stringList.add(rs6.getString(1));
										stringList.add(rs6.getString(2));
										user.setActions(stringList);						 
									}
								}
							}
							
							try (PreparedStatement 	st7 = connection
									.prepareStatement("SELECT category, id FROM tipy"))
							{
								try (ResultSet rs7 = st7.executeQuery())
								{
									System.out.println("st7.executeQuery");
									
									while (rs7.next()) {
										ArrayList<String> stringList = new ArrayList<String>();
										stringList.add(rs7.getString(1));
										stringList.add(rs7.getString(2));
										user.setTypes(stringList);						 
									}
								}
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
	
	@Override
	public User updateProduct(int sessionId, String name, String text, String bigText, 
			int idProduct, String rest, String actions, String tipy) throws DAOException {
		
		User user = null;
        ConnectionPool conPool = ConnectionPool.getInstance();   //ConnectionPool jdbc = new ConnectionPool();
        try (Connection connection = conPool.takeConnection()) {   
            
			user = new User();
			try (PreparedStatement statement = connection
					.prepareStatement("SELECT access FROM passwords WHERE session_id=?"))
			{
			statement.setInt(1, sessionId);
			
				try (ResultSet rs = statement.executeQuery())
				{
				
					if (rs.next()) 
					{
						user = new User();
						if (rs.getInt(1)==5)
						{
							
							if (rest.equals(null))
							{
								try (PreparedStatement st2 = connection
									.prepareStatement("UPDATE product SET  name=?, text=?, big_text=?  WHERE id=?"))
								{
									st2.setString(1, name);
									st2.setString(2, text);
									st2.setString(3, bigText);
									st2.setInt(4, idProduct);
									
									st2.executeUpdate();
								}
							} else {
								try (PreparedStatement st2 = connection
									.prepareStatement("UPDATE product SET  name=?, text=?, big_text=?, rest=?  WHERE id=?"))
								{
									st2.setString(1, name);
									st2.setString(2, text);
									st2.setString(3, bigText);
									st2.setString(4, rest);
									st2.setInt(5, idProduct);
									
									st2.executeUpdate();
								}
							}	
							
							
							try (PreparedStatement st3 = connection
									.prepareStatement("DELETE FROM product_kategorii WHERE id_product=?"))
							{
									st3.setInt(1, idProduct);	
									int res3 = st3.executeUpdate();
							}	
									
										
							String[] kategorii_arr = actions.split("|");
							for (String kategorii_sub : kategorii_arr)
							{
								try (PreparedStatement st4 = connection
										.prepareStatement("INSERT INTO product_kategorii SET id_product=?, id_kategorii=?"))
								{
										
								st4.setInt(1, idProduct);
								st4.setString(2, kategorii_sub);
								st4.execute();
								}
							}							
									
							try (PreparedStatement st5 = connection
									.prepareStatement("DELETE FROM product_tipy WHERE id_product=?"))
							{
									st5.setInt(1, idProduct);	
									int res5 = st5.executeUpdate();
														
							}
							
							String[] tipy_arr = tipy.split("|");
							for (String tipy_sub : kategorii_arr)
							{
								try (PreparedStatement st6 = connection
										.prepareStatement("INSERT INTO product_tipy SET id_product=?, id_tip=?"))
								{
								
								st6.setInt(1, idProduct);
								st6.setString(1, tipy_sub);
								st6.execute();
								}
							}
													
							System.out.println("updateProduct");
							user = new User();
							user.setSuccess(true);
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
	
	@Override
	public User deleteProduct(int sessionId, int idProduct) throws DAOException {
		
		User user = null;
        ConnectionPool conPool = ConnectionPool.getInstance();   //ConnectionPool jdbc = new ConnectionPool();
        try (Connection connection = conPool.takeConnection()) 
        {   
            user = new User();
            try (PreparedStatement statement = connection
					.prepareStatement("SELECT access FROM passwords WHERE session_id=?"))
            {
			statement.setInt(1, sessionId);
			
				try (ResultSet rs = statement.executeQuery())
				{
				
					if (rs.next()) 
					{
						user = new User();
						if (rs.getInt(1)==5)
						{
							
							try (PreparedStatement st2 = connection
									.prepareStatement("DELETE FROM product WHERE id_product=?"))
							{
							statement.setInt(1, idProduct);	
							int res = statement.executeUpdate();
							
							System.out.println("addActions"+res);
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
	
	@Override
	public User myPlace(int sessionId, String latLeng) throws DAOException {
		
		User user = null;
        ConnectionPool conPool = ConnectionPool.getInstance();   //ConnectionPool jdbc = new ConnectionPool();
        try (Connection connection = conPool.takeConnection()) 
        {   
            user = new User();
            try (PreparedStatement statement = connection
					.prepareStatement("SELECT access, id_shop FROM passwords WHERE session_id=?"))
            {
				statement.setInt(1, sessionId);
				
				try (ResultSet rs = statement.executeQuery())
				{
				
					if (rs.next()) 
					{
						user = new User();
						if (rs.getString(1).equals("1"))
						{
							
							try (PreparedStatement st = connection
									.prepareStatement("UPDATE shop SET geo=?  WHERE id_shop=?"))
							{
							statement.setString(1, latLeng);	
							statement.setInt(2, rs.getInt(2));	
							int res = statement.executeUpdate();
							
							System.out.println("myPlace"+res);
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
	
	@Override
	public User sound(int sessionId) throws DAOException {
		
		User user = null;
        ConnectionPool conPool = ConnectionPool.getInstance();   //ConnectionPool jdbc = new ConnectionPool();
        try (Connection connection = conPool.takeConnection()) {   
            
			user = new User();
			try (PreparedStatement statement = connection
					.prepareStatement("SELECT access, id_shop FROM passwords WHERE session_id=?"))
			{
				statement.setInt(1, sessionId);
				
				try (ResultSet rs = statement.executeQuery())
				{
				
					if (rs.next()) 
					{
						user = new User();
						if (rs.getInt(1)==5)
						{
							
							/*st2 = connection
									.prepareStatement("SELECT tel, time_req, day_req FROM day_req  WHERE id_shop=?");			
							st2.setInt(1, rs.getInt(1));	
							rs2 = st2.executeQuery();
							
							while (rs2.next()) {
								ArrayList<String> stringList = new ArrayList<String>();
								stringList.add(rs2.getString(0));
								stringList.add(rs2.getString(1));
								stringList.add(rs2.getString(2));
								user.setSound(stringList);
								
								System.out.println("SQL setViewFree"); 
							}*/
							
							
							try (PreparedStatement st3 = connection
									.prepareStatement("SELECT product_buyer.text, product.text, product.cana, actions.text, product_buyer.id FROM actions  " + 
											"					 	LEFT JOIN product_actions ON (actions.id = product_actions.id_actions) " + 
											"					 	LEFT JOIN product ON (product_actions.id_product = product.id) " + 
											"					 	LEFT JOIN product_buyer ON (product.id=product_buyer.id_product) " + 
											"					 	WHERE product.id_shop=?")) //.' AND product_buyer.approved=3 AND product_buyer.oplaceno=false");	
							{
								st3.setInt(1, rs.getInt(1));	
								try (ResultSet rs3 = st3.executeQuery())
								{
								
									while (rs3.next()) {
										ArrayList<String> stringList = new ArrayList<String>();
										stringList.add(rs.getString(1));//product_buyer.text
										stringList.add(rs.getString(2));//product.text
										stringList.add(rs.getString(3));//product.cana
										stringList.add(rs.getString(4));//actions.text
										stringList.add(rs.getString(5));//product_buyer.id
										
										user.setSoundProduct(stringList);
										
										System.out.println("SQL setViewFree"); 
									}
								}
								System.out.println("sound");
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
	
	@Override
	public User removeSound(int sessionId, String tel) throws DAOException {
		
		User user = null;
        ConnectionPool conPool = ConnectionPool.getInstance();   //ConnectionPool jdbc = new ConnectionPool();
        try (Connection connection = conPool.takeConnection()) {   
            user = new User();
            try (PreparedStatement statement = connection
					.prepareStatement("SELECT access, id_shop FROM passwords WHERE session_id=?"))
            {
			statement.setInt(1, sessionId);
			
				try (ResultSet rs = statement.executeQuery())
				{
				
					if (rs.next()) 
					{
						user = new User();
						if (rs.getString(0).equals("1"))
						{
							
							try (PreparedStatement st2 = connection
									.prepareStatement("DELETE FROM day_req  WHERE id_shop=? AND tel=?"))
							{
							st2.setInt(1, rs.getInt(1));	
							st2.setString(2, tel);	
							int res3 = st2.executeUpdate();
							
							user = new User();
							user.setSuccess(true);
							
							System.out.println("removeSound");
							}
						}
					}
				}
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
	
	
}
