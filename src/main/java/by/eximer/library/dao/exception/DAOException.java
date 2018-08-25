package by.eximer.library.dao.exception;

public class DAOException extends Exception {
	private static final long serialVersionUID = 1L;

	public DAOException(){
		super();
	}
	
	public DAOException(String msg){
		super(msg);
	}
	
	public DAOException(Exception e){
		super(e);
	}
	
	public DAOException(String msg, Exception e){
		super(msg, e);
	}

}
