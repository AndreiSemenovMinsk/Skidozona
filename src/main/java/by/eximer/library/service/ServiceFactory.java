package by.eximer.library.service;

import by.eximer.library.service.impl.AdminServiceImpl;
import by.eximer.library.service.impl.DealServiceImpl;
import by.eximer.library.service.impl.SearchServiceImpl;
import by.eximer.library.service.impl.SideServiceImpl;
import by.eximer.library.service.impl.UserServiceImpl;

public class ServiceFactory {

		private static final ServiceFactory instance = new ServiceFactory();
		
		private ServiceFactory() {}
		
		private final UserService userService 		= 	new UserServiceImpl();
		private final SearchService searchService 	= 	new SearchServiceImpl();
		private final SideService sideService 		= 	new SideServiceImpl();
		private final DealService dealService 		= 	new DealServiceImpl();
		private final AdminService adminService 	= 	new AdminServiceImpl();

		public static ServiceFactory getInstance() {
			return instance;
		}
		public UserService getUserService() {
			return userService;
		}
		public SearchService getSearchService() {
			return searchService;
		}
		public SideService getSideService() {
			return sideService;
		}
		public DealService getDealService() {
			return dealService;
		}
		public AdminService getAdminService() {
			return adminService;
		}

}
