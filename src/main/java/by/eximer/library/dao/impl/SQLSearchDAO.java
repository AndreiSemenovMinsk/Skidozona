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

import by.eximer.library.dao.SearchDAO;
//import by.eximer.library.controller.impl.BasketAll;
//import by.eximer.library.controller.impl.UpdateUserQR;
import by.eximer.library.dao.UserDAO;
import by.eximer.library.dao.exception.DAOException;
import by.eximer.library.domain.User;
//import by.eximer.library.service.exeption.ServiceException;

import by.eximer.library.dao.impl.ConnectionPool;
//import by.eximer.library.dao.impl.DBResourceManager;

public class SQLSearchDAO implements SearchDAO {

	final Logger log = LoggerFactory.getLogger(SQLSearchDAO.class); //final Logger log = LogManager.getLogger(BasketAll.class.getName());
	
	private void statementClosing (PreparedStatement...statements)
	{
		for (PreparedStatement statement : statements)
		try {
		        if(statement != null) {
		        	statement.close();
		        }
		    } catch(Exception e) {
		    	log.error("SQLUserDAO like:"+e);
		    }
	}
	
	@Override
	public User like(String searchString) throws DAOException {
		
		User user = null;		
		ConnectionPool conPool = ConnectionPool.getInstance();   //ConnectionPool jdbc = new ConnectionPool();
        try (Connection connection = conPool.takeConnection()) {   
            //DataSource dataSource = jdbc.setUpPool();
			
			//connection = dataSource.getConnection();
			
			System.out.println(searchString);
			
			try (PreparedStatement statement = connection
					.prepareStatement("SELECT name , MATCH (category) AGAINST (? IN NATURAL LANGUAGE MODE) AS score "+
											"FROM tipy WHERE MATCH (category) AGAINST (? IN BOOLEAN MODE);"))
			{
			
			statement.setString(1, searchString);
			statement.setString(2, searchString);
			
			System.out.println("sql1");
			
				try (ResultSet rs = statement.executeQuery())
				{
				
				System.out.println("sql2");
				
				user = new User();
	
					while (rs.next()) {
						ArrayList<String> stringList = new ArrayList<String>();
						stringList.add(rs.getString(1));
						user.setSearchResult(stringList);
					}
				}
			
			System.out.println("sql3");
			}
		} catch (InterruptedException | SQLException e) {
			log.error("SQLUserDAO like:"+e);
			throw new DAOException("message foe change", e);
		} catch(Exception e) {
			log.error("SQLUserDAO like:"+e);
            e.printStackTrace();
        } 
        
		return user;
	}

	@Override
	public User search(String searchString, String max, String min, String sort_price, int start, int size) throws DAOException {
		
		User user = null;
		
        PreparedStatement statement = null;
        ConnectionPool conPool = ConnectionPool.getInstance();   //ConnectionPool jdbc = new ConnectionPool();
        try (Connection connection = conPool.takeConnection()) {   
            //connection = conPool.takeConnection();//DataSource dataSource = jdbc.setUpPool();
            
			System.out.println("sql search searchString"+searchString+" max"+max+" min"+min+" sort_price"+sort_price);
			
			if (min != null && max != null) {
				statement = connection
		.prepareStatement("SELECT  product.id, product.id_shop, product.text, product.name, product.cana, product.rest , shop.geo, shop.name, COUNT(product.id) ,"+
								" MATCH (product.name, product.text) AGAINST (? IN NATURAL LANGUAGE MODE) AS score , product.id  FROM shop LEFT JOIN product "+
								"ON (product.id_shop=shop.id)  WHERE MATCH (product.name, product.text) AGAINST (? IN BOOLEAN MODE) AND product.cana > ? "+
								"AND product.cana < ? ORDER BY cana DESC LIMIT ?,?;");
				statement.setString(3, min);
				statement.setString(4, max);
				statement.setInt(5, start);
				statement.setInt(6, size);
			} else if (min != null) {
				statement = connection
						.prepareStatement("SELECT product.id, product.id_shop, product.text, product.name, product.cana, product.rest , shop.geo, shop.name , "+
								"MATCH (product.name, product.text) AGAINST (? IN NATURAL LANGUAGE MODE) AS score , product.id  FROM shop LEFT JOIN product "+
								"ON (product.id_shop=shop.id)  WHERE MATCH (product.name, product.text) AGAINST (? IN BOOLEAN MODE) AND product.cana > ? "+
								"ORDER BY cana DESC LIMIT ?,?;");
				statement.setString(3, min);
				statement.setInt(4, start);
				statement.setInt(5, size);
			} else if (max != null) {
				statement = connection
						.prepareStatement("SELECT product.id, product.id_shop, product.text, product.name, product.cana, product.rest , shop.geo, shop.name , "+
								"MATCH (product.name, product.text) AGAINST (? IN NATURAL LANGUAGE MODE) AS score , product.id  FROM shop LEFT JOIN product "+
								"ON (product.id_shop=shop.id)  WHERE MATCH (product.name, product.text) AGAINST (? IN BOOLEAN MODE) AND product.cana < ? "+
								"ORDER BY cana DESC LIMIT ?,?;");
				statement.setString(3, max);
				statement.setInt(4, start);
				statement.setInt(5, size);
			} else {
					statement = connection
						.prepareStatement("SELECT product.id, product.id_shop, product.text, product.name, product.cana, product.rest , shop.geo, shop.name , "+
								"MATCH (product.name, product.text) AGAINST (? IN NATURAL LANGUAGE MODE) AS score , product.id  FROM shop LEFT JOIN product "+
								"ON (product.id_shop=shop.id)  WHERE MATCH (product.name, product.text) AGAINST (? IN BOOLEAN MODE) ORDER BY cana DESC LIMIT ?,?;");
					
					statement.setInt(3, start);
					statement.setInt(4, size);
			}		
					
				statement.setString(1, searchString);
				statement.setString(2, searchString);
				
				
				
			System.out.println("sql1");
			
			try (ResultSet rs = statement.executeQuery())
			{
			
				System.out.println("sql2");
				user = new User();
				String actions_sub = " ";
				
				while (rs.next()) 
				{				
					try (PreparedStatement st2 = connection
							.prepareStatement("SELECT actions.text FROM actions LEFT JOIN product_actions ON "+
					"(actions.id=product_actions.id_actions) WHERE product_actions.id_product=?"))
					{
						st2.setInt(1,rs.getInt(1)); 

						try (ResultSet rs_sub = st2.executeQuery())
						{
							while (rs_sub.next()) {
								actions_sub.concat( rs_sub.getString(1) +"|");
							}
						}
					} 
					
					if (actions_sub.length() > 1) {
					actions_sub = actions_sub.substring(0, actions_sub.length()-1);
					}

					ArrayList<String> stringList = new ArrayList<String>();
					stringList.add(rs.getString(1));//product.id
					stringList.add(rs.getString(2));//product.id_shop
					stringList.add(rs.getString(3));//product.text
					stringList.add(rs.getString(4));//product.name
					stringList.add(rs.getString(5));//product.cana
					stringList.add(rs.getString(6));//product.rest
					stringList.add(rs.getString(7));//shop.geo
					stringList.add(rs.getString(8));//shop.name
					stringList.add(actions_sub);//actions.text
					stringList.add(rs.getString(9));// COUNT
					user.setSearchResult(stringList);
					
					
					System.out.println(rs.getString(1)+"&"+rs.getString(2)+"&"+rs.getString(3)+"&"+rs.getString(4)
					+"&"+rs.getString(5)+"&"+rs.getString(6)+"&"+rs.getString(7) + "&"+rs.getString(8) + "&" +actions_sub);
				}
			}
		} catch (InterruptedException | SQLException e) {
			log.error("SQLUserDAO search:"+e);
			throw new DAOException("message foe change", e);			
		} catch(Exception e) {
			log.error("SQLUserDAO search:"+e);
            e.printStackTrace();
        } finally {
			statementClosing(statement);
		}
		return user;
	}

	@Override
	public User searchCategories(String searchString, String tip, String max, String min, String sort_price) throws DAOException {
		
		User user = null;
		PreparedStatement statement = null;
       
        ConnectionPool conPool = ConnectionPool.getInstance();   //ConnectionPool jdbc = new ConnectionPool();
        try (Connection connection = conPool.takeConnection()) {   
            //connection = conPool.takeConnection();//DataSource dataSource = jdbc.setUpPool();
            
			System.out.println("sql search searchString"+searchString+" max"+max+" min"+min+" sort_price"+sort_price);
			
			//connection = dataSource.getConnection();		

			if (min != null && max != null) {
				statement = connection
						
						.prepareStatement("SELECT product.id, product.id_shop, product.text, product.name, product.cana, product.rest , shop.geo, shop.name , "+
								"MATCH (product.name, product.text) AGAINST (? IN NATURAL LANGUAGE MODE) AS score , product.id  FROM shop LEFT JOIN product "+
								"ON (product.id_shop=shop.id)  LEFT JOIN product_tipy ON (product.id=product_tipy.id_product) "+
								" LEFT JOIN tipy ON (tipy.id=product_tipy.id_tip) WHERE MATCH (product.name, product.text) "+
								"AGAINST (? IN BOOLEAN MODE) AND tipy.name=? AND product.cana > ? AND product.cana < ? ORDER BY cana DESC;");	
				statement.setString(4, min);
				statement.setString(5, max);
				//statement.setString(5, sort_price);
			} else if (min != null) {
				statement = connection
						.prepareStatement("SELECT product.id, product.id_shop, product.text, product.name, product.cana, product.rest , shop.geo, shop.name , "+
								"MATCH (product.name, product.text) AGAINST (? IN NATURAL LANGUAGE MODE) AS score , product.id  FROM shop LEFT JOIN product "+
								"ON (product.id_shop=shop.id)  LEFT JOIN product_tipy ON (product.id=product_tipy.id_product) "+
								" LEFT JOIN tipy ON (tipy.id=product_tipy.id_tip) WHERE MATCH (product.name, product.text) "+
								"AGAINST (? IN BOOLEAN MODE) AND tipy.name=? AND product.cana > ? ORDER BY cana DESC;");		
				statement.setString(4, min);
				//statement.setString(4, sort_price);
			} else if (max != null) {
				statement = connection
						.prepareStatement("SELECT product.id, product.id_shop, product.text, product.name, product.cana, product.rest , shop.geo, shop.name , "+
								"MATCH (product.name, product.text) AGAINST (? IN NATURAL LANGUAGE MODE) AS score , product.id  FROM shop LEFT JOIN product "+
								"ON (product.id_shop=shop.id)  LEFT JOIN product_tipy ON (product.id=product_tipy.id_product) "+
								" LEFT JOIN tipy ON (tipy.id=product_tipy.id_tip) WHERE MATCH (product.name, product.text) "+
								"AGAINST (? IN BOOLEAN MODE) AND tipy.name=? AND product.cana < ? ORDER BY cana DESC;");	
				statement.setString(4, max);
				//statement.setString(4, sort_price);
			} else {
					statement = connection
						.prepareStatement("SELECT product.id, product.id_shop, product.text, product.name, product.cana, product.rest , shop.geo, shop.name , "+
								"MATCH (product.name, product.text) AGAINST (? IN NATURAL LANGUAGE MODE) AS score , product.id  FROM shop LEFT JOIN product "+
								"ON (product.id_shop=shop.id)  LEFT JOIN product_tipy ON (product.id=product_tipy.id_product) "+
								" LEFT JOIN tipy ON (tipy.id=product_tipy.id_tip) WHERE MATCH (product.name, product.text) "+
								"AGAINST (? IN BOOLEAN MODE) AND tipy.name=? ORDER BY cana DESC;");
			}		
				statement.setString(1, searchString);
				statement.setString(2, searchString);	
				statement.setString(3, tip);	
			
				
			System.out.println("sql1");
			
			try (ResultSet rs = statement.executeQuery())
			{
			
				System.out.println("sql2");
				user = new User();
				
				while (rs.next()) {
					
					System.out.println("sql21");
					
					try(PreparedStatement st2 = connection
							.prepareStatement("SELECT actions.text FROM actions LEFT JOIN product_actions "+
					"ON (actions.id=product_actions.id_actions) WHERE product_actions.id_product=?"))
					{
					
						System.out.println("sql22#"+rs.getInt(1));
						
						st2.setInt(1,rs.getInt(1)); 
						
						String actions_sub = " ";
						
						try (ResultSet rs_sub = st2.executeQuery())
						{
							while (rs_sub.next()) {
								actions_sub.concat( rs_sub.getString(1) +"|");
							}
						System.out.println(actions_sub);
						}
						actions_sub = actions_sub.substring(0, actions_sub.length()-1);
						
						System.out.println(actions_sub);
						ArrayList<String> stringList = new ArrayList<String>();
						stringList.add(rs.getString(1));//product.id
						stringList.add(rs.getString(2));//product.id_shop
						stringList.add(rs.getString(3));//product.text
						stringList.add(rs.getString(4));//product.name
						stringList.add(rs.getString(5));//product.cana
						stringList.add(rs.getString(6));//product.rest
						stringList.add(rs.getString(7));//shop.geo
						stringList.add(rs.getString(8));//shop.name
						stringList.add(actions_sub);//actions.text
						user.setSearchResult(stringList);
					}	
				}
			}

		} catch (InterruptedException | SQLException e) {
			log.error("SQLUserDAO searchCategories:"+e);
			throw new DAOException("message foe change", e);			
		} catch(Exception e) {
			log.error("SQLUserDAO searchCategories:"+e);
            e.printStackTrace();
        } finally {
        	statementClosing(statement);
		}
		return user;
	}

	@Override
	public User menu(String type, String max, String min, String sort_price) throws DAOException {
		
		User user = null;
		
        PreparedStatement statement = null;
        ConnectionPool conPool = ConnectionPool.getInstance();   //ConnectionPool jdbc = new ConnectionPool();
        try (Connection connection = conPool.takeConnection()) {   
            //connection = conPool.takeConnection();//DataSource dataSource = jdbc.setUpPool();
            
			System.out.println("sql search searchString"+type+" max"+max+" min"+min+" sort_price"+sort_price);
			
			if (min != null && max != null) {
				statement = connection
						
						.prepareStatement("SELECT product.id, product.id_shop, product.text, product.name, product.cana, product.rest , shop.geo, "+
						"shop.name, product.id  FROM shop LEFT JOIN product  ON (product.id_shop=shop.id)  LEFT JOIN product_tipy "+
						"ON (product.id=product_tipy.id_product)  LEFT JOIN tipy ON (tipy.id=product_tipy.id_tip) WHERE tipy.name=? "+
						"AND product.cana > ? AND product.cana < ? ORDER BY cana DESC");	
				statement.setString(2, min);
				statement.setString(3, max);
				
			} else if (min != null) {
				statement = connection
						.prepareStatement("SELECT product.id, product.id_shop, product.text, product.name, product.cana, product.rest , shop.geo, "+
								"shop.name, product.id  FROM shop LEFT JOIN product  ON (product.id_shop=shop.id)  LEFT JOIN product_tipy "+
								"ON (product.id=product_tipy.id_product)  LEFT JOIN tipy ON (tipy.id=product_tipy.id_tip) WHERE tipy.name=? "+
								"AND product.cana > ? ORDER BY cana DESC");		
				statement.setString(2, min);
				
			} else if (max != null) {
				statement = connection
						.prepareStatement("SELECT product.id, product.id_shop, product.text, product.name, product.cana, product.rest , shop.geo, "+
								"shop.name, product.id  FROM shop LEFT JOIN product  ON (product.id_shop=shop.id)  LEFT JOIN product_tipy "+
								"ON (product.id=product_tipy.id_product)  LEFT JOIN tipy ON (tipy.id=product_tipy.id_tip) WHERE tipy.name=? "+
								"AND product.cana < ? ORDER BY cana DESC");	
				statement.setString(2, max);
				
			} else {
					statement = connection
						.prepareStatement("SELECT product.id, product.id_shop, product.text, product.name, product.cana, product.rest , shop.geo, "+
								"shop.name, product.id  FROM shop LEFT JOIN product  ON (product.id_shop=shop.id)  LEFT JOIN product_tipy "+
								"ON (product.id=product_tipy.id_product)  LEFT JOIN tipy ON (tipy.id=product_tipy.id_tip) WHERE tipy.name=? "+
								" ORDER BY cana DESC");
			}		
				statement.setString(1, type);	
			
				
			System.out.println("sql1");
			
			try (ResultSet rs = statement.executeQuery())
			{
			
				System.out.println("sql2");
				user = new User();
				
				while (rs.next()) {
					
					System.out.println("sql21");
					String actions_sub = " ";
					
					try (PreparedStatement st2 = connection
							.prepareStatement("SELECT actions.text FROM actions LEFT JOIN product_actions ON "+
					"(actions.id=product_actions.id_actions) WHERE product_actions.id_product=?"))
					{
						st2.setInt(1,rs.getInt(1)); 
						
						try (ResultSet rs_sub = st2.executeQuery())
						{
							
							while (rs_sub.next()) {
								actions_sub.concat( rs_sub.getString(1) +"|");
							}
						}
					}
					System.out.println(actions_sub);
					
					actions_sub = actions_sub.substring(0, actions_sub.length()-1);
					
					System.out.println(actions_sub);
					ArrayList<String> stringList = new ArrayList<String>();
					stringList.add(rs.getString(1));//product.id
					stringList.add(rs.getString(2));//product.id_shop
					stringList.add(rs.getString(3));//product.text
					stringList.add(rs.getString(4));//product.name
					stringList.add(rs.getString(5));//product.cana
					stringList.add(rs.getString(6));//product.rest
					stringList.add(rs.getString(7));//shop.geo
					stringList.add(rs.getString(8));//shop.name
					stringList.add(actions_sub);//actions.text
					user.setSearchResult(stringList);
					
				}
			}
		} catch (InterruptedException | SQLException e) {
			log.error("SQLUserDAO searchCategories:"+e);
			throw new DAOException("message foe change", e);			
		} catch(Exception e) {
			log.error("SQLUserDAO searchCategories:"+e);
            e.printStackTrace();
        } finally {		
        	statementClosing(statement);
		}
		return user;
	}
	
	
	
	
}
