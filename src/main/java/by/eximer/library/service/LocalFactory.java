package by.eximer.library.service;

import java.util.Locale;


public class LocalFactory {

		private LocalFactory() {}
		
		private static Locale current = Locale.getDefault();
		
		public static Locale getCurrent()
		{
			return current;
		}
		
		public static void setCurrent(String leng) {
			
			switch (leng) {
			
			case "by" : current = new Locale("be", "BY");
				break;
			case "en" : current = new Locale("en", "US");
				break;
			case "ru" : current = new Locale("ru", "RU");
				break;
			default: 
				current = new Locale("ru", "RU");
				break;
			}
			
		}
}
