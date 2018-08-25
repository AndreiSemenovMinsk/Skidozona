package by.eximer.library.domain;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class User {
	private String name;
	private String access;
	private String sessionId;
	private String role;
	private String testLogin;
	private ArrayList<String> myBooks = new ArrayList <String>();
	private ArrayList<String> viewFree = new ArrayList <String>();
	private ArrayList<String> askBooks = new ArrayList <String>();
	private ArrayList<String> takeBooks = new ArrayList <String>();
	private boolean success;
	
	private ArrayList<ArrayList<String>> searchResult = new ArrayList <ArrayList<String>>();
	public ArrayList<ArrayList<String>> getSearchResult() {
		return searchResult;
	}
	
	public void setSearchResult(ArrayList<String> searchResult) {
		this.searchResult.add(searchResult);
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getAccess() {
		return access;
	}
	
	public void setAccess(String access) {
		this.access = access;
	}
	
	public String getSessionId() {
		return sessionId;
	}
	
	public void setSessionId(String access) {
		this.sessionId = access;
	}
	
	public String getRole() {
		return role;
	}
	
	public void setRole(String role) {
		this.role = role;
	}
	
	public void setTestLogin(String testLogin) {
		this.testLogin = testLogin;
	}
	
	public String getTestLogin() {
		return testLogin;
	}
	
	public void setSuccess(boolean success) {
		this.success = success;
	}
	
	public boolean getSuccess() {
		return success;
	}
	
	public void setViewFree(String title) {
		this.viewFree.add(title);// Iterator it = title.iterator(); while(it.hasNext())   it.next() 
	}
	
	public ArrayList<String> getViewFree() {
		return viewFree;
	}
	
	public void setMyBooks(String title) {
		
		this.myBooks.add(title);// Iterator it = title.iterator(); while(it.hasNext())   it.next() 
	}
	
	public ArrayList<String> getMyBooks() {
		return myBooks;
	}
	
	public void setViewAskBooks(String title) {
		System.out.println("title setViewAskBooks"+title);
		this.askBooks.add(title);// Iterator it = title.iterator(); while(it.hasNext())   it.next() 
	}
	
	public ArrayList<String> getViewAskBooks() {
		return askBooks;
	}
	
	public void setViewTakeBooks(String title) {
		System.out.println("title setViewTakeBooks"+title);
		this.takeBooks.add(title);// Iterator it = title.iterator(); while(it.hasNext())   it.next() 
	}
	
	public ArrayList<String> getViewTakeBooks() {
		return takeBooks;
	}
	
	private ArrayList<ArrayList<String>> sound = new ArrayList <ArrayList<String>>();
	public void setSound(ArrayList<String> string) {
		
		this.sound.add(string);
	}
	
	public ArrayList<ArrayList<String>> getSound() {
		return sound;
	}
	
	private ArrayList<ArrayList<String>> soundProduct  = new ArrayList <ArrayList<String>>();
	public void setSoundProduct(ArrayList<String> string) {
		this.soundProduct.add(string);
	}
	
	public ArrayList<ArrayList<String>> getSoundProduct() {
		return soundProduct;
	}
	
	private ArrayList<String> akciiName = new ArrayList<String>();
	public void setActionsName(String string) {
		this.akciiName.add(string);
	}
	
	public ArrayList<String> getActionsName() {
		return akciiName;
	}
	
	private ArrayList<ArrayList<ArrayList<String>>> updateShopActionsProduct = new ArrayList <ArrayList<ArrayList<String>>>();
	public void setUpdateShopActionsProduct(ArrayList<String> string, int index) {
		
		try {
			this.updateShopActionsProduct.get(index).add(string);
		} catch (IndexOutOfBoundsException e) {
			
			ArrayList<ArrayList<String>> empt = new ArrayList<ArrayList<String>>();
			this.updateShopActionsProduct.add(index, empt);
			this.updateShopActionsProduct.get(index).add(string);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<ArrayList<ArrayList<String>>> getUpdateShopActionsProduct() {
		return updateShopActionsProduct;
	}
	
	private ArrayList<ArrayList<String>> updateShopProduct = new ArrayList <ArrayList<String>>();
	public void setUpdateShopProduct(ArrayList<String> string1) {
		this.updateShopProduct.add(string1);
		
	}
	
	public ArrayList<ArrayList<String>> getUpdateShopProduct() {
		return updateShopProduct;
	}
	
	private ArrayList<ArrayList<String>> akcii = new ArrayList<ArrayList<String>>();
	public void setActions(ArrayList<String> string) {
		this.akcii.add(string);
	}
	
	public ArrayList<ArrayList<String>> getActions() {
		return akcii;
	}
	
	private ArrayList<ArrayList<String>> types = new ArrayList<ArrayList<String>>();
	public void setTypes(ArrayList<String> string) {
		this.types.add(string);
	}
	
	public ArrayList<ArrayList<String>> getTypes() {
		return types;
	}

	private ArrayList<ArrayList<ArrayList<String>>> updateActionsList = new ArrayList<ArrayList<ArrayList<String>>>();
	public void setUpdateActions(ArrayList<String> string, int index) {
		
		try {
			this.updateActionsList.get(index).add(string);
		} catch (IndexOutOfBoundsException e) {
			
			ArrayList<ArrayList<String>> empt = new ArrayList<ArrayList<String>>();
			this.updateActionsList.add(index, empt);
			this.updateActionsList.get(index).add(string);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<ArrayList<ArrayList<String>>> getUpdateActionsList() {
		return updateActionsList;
	}

	private ArrayList<String> shopName = new ArrayList<String>();
	public void setShopName(String string) {
		this.shopName.add(string);
	}
	
	public ArrayList<String> getShopName() {
		return shopName;
	}

	private ArrayList<ArrayList<ArrayList<String>>> basketAll = new ArrayList<ArrayList<ArrayList<String>>>();
	public void setBasketAll(ArrayList<String> string, int index) {
		
		try {
			this.basketAll.get(index).add(string);
		} catch (IndexOutOfBoundsException e) {
			
			ArrayList<ArrayList<String>> empt = new ArrayList<ArrayList<String>>();
			this.basketAll.add(index, empt);
			this.basketAll.get(index).add(string);
		} catch(Exception e) {
			e.printStackTrace();
		}			
	}

	public ArrayList<ArrayList<ArrayList<String>>> getBasketAll() {
		return basketAll;
	}
	
	private ArrayList<ArrayList<String>> bookmarks = new ArrayList<ArrayList<String>>();
	public void setBookmarks(ArrayList<String> string) {
		this.bookmarks.add(string);
	}

	public ArrayList<ArrayList<String>> getBookmarks() {
		return bookmarks;
	}

	private ArrayList<ArrayList<ArrayList<String>>> productActions = new ArrayList<ArrayList<ArrayList<String>>>();
	public void setProductActions(ArrayList<String> string, int index) {
		
		try {
			this.productActions.get(index).add(string);
		} catch (IndexOutOfBoundsException e) {
			
			ArrayList<ArrayList<String>> empt = new ArrayList<ArrayList<String>>();

			try {
			this.productActions.add(index, empt);				
			} catch (IndexOutOfBoundsException ee) {
				for (int i = 0; i < index; i++)
					this.productActions.add(new ArrayList<ArrayList<String>>());
				
				this.productActions.add(index, empt);	
			}
			
			this.productActions.get(index).add(string);
		} catch(Exception e) {
			e.printStackTrace();
		}	
	}
	public ArrayList<ArrayList<ArrayList<String>>> getProductActions() {
		return productActions;
	}

	private ArrayList<ArrayList<ArrayList<String>>> productTypes = new ArrayList<ArrayList<ArrayList<String>>>();
	public void setProductTypes(ArrayList<String> string, int index) {
		try {
			this.productTypes.get(index).add(string);
		} catch (IndexOutOfBoundsException e) {
			ArrayList<ArrayList<String>> empt = new ArrayList<ArrayList<String>>();
			
			try {
			this.productTypes.add(index, empt);				
			} catch (IndexOutOfBoundsException ee) {
				for (int i = 0; i < index; i++)
					this.productTypes.add(new ArrayList<ArrayList<String>>());
				
				this.productTypes.add(index, empt);	
			}
			
			this.productTypes.get(index).add(string);
		} catch(Exception e) {
			e.printStackTrace();
		}	
	}
	public ArrayList<ArrayList<ArrayList<String>>> getProductTypes() {
		return productTypes;
	}
}
