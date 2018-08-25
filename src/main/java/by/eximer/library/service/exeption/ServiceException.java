package by.eximer.library.service.exeption;

public class ServiceException extends Exception{
	
	private static final long serialVersionUID = -6403791657788547395L;

	public ServiceException() {
		super();
	}

	public ServiceException(String msg) {
		super(msg);
	}

	public ServiceException(Exception e) {
		super(e);
	}
	
	public ServiceException(String msg, Exception e) {
		super(msg, e);
	}
}
