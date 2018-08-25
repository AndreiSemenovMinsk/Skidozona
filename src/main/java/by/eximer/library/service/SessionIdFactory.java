package by.eximer.library.service;


public class SessionIdFactory {

		private SessionIdFactory() {}
		
		private static String sessionId = null;
		
		public static String getSessionId()
		{
			return sessionId;
		}
		
		public static void setSessionId(String id) {			
			sessionId = id;		
		}
}
