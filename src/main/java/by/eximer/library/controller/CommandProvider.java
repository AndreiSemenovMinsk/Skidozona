package by.eximer.library.controller;

import java.util.HashMap;
import java.util.Map;

import by.eximer.library.controller.impl.MainPage;
import by.eximer.library.controller.impl.admin.AddActions;
import by.eximer.library.controller.impl.admin.AddProduct;
import by.eximer.library.controller.impl.admin.AddProductAction;
import by.eximer.library.controller.impl.admin.AddProductType;
import by.eximer.library.controller.impl.admin.Admin;
import by.eximer.library.controller.impl.admin.AdminShop;
import by.eximer.library.controller.impl.admin.DeleteProduct;
import by.eximer.library.controller.impl.admin.ProductActions;
import by.eximer.library.controller.impl.admin.ProductTypes;
import by.eximer.library.controller.impl.admin.Sound;
import by.eximer.library.controller.impl.admin.UpdateProduct;
import by.eximer.library.controller.impl.deal.Approve;
import by.eximer.library.controller.impl.deal.Approved;
import by.eximer.library.controller.impl.deal.Refuse;
import by.eximer.library.controller.impl.search.Like;
import by.eximer.library.controller.impl.search.Menu;
import by.eximer.library.controller.impl.search.Search;
import by.eximer.library.controller.impl.search.SearchCategories;
import by.eximer.library.controller.impl.side.ActionsAll;
import by.eximer.library.controller.impl.side.ActionsRadius;
import by.eximer.library.controller.impl.side.BasketAll;
import by.eximer.library.controller.impl.side.BookmarksAll;
import by.eximer.library.controller.impl.side.BookmarksRadius;
import by.eximer.library.controller.impl.side.InBasket;
import by.eximer.library.controller.impl.side.InBookmarks;
import by.eximer.library.controller.impl.user.Register;
import by.eximer.library.controller.impl.user.RegisterNoLogin;
import by.eximer.library.controller.impl.user.SarafanLogin;
import by.eximer.library.controller.impl.user.SignIn;
import by.eximer.library.controller.impl.user.TestLogin;
import by.eximer.library.controller.impl.user.UpdateUserQR;
import by.eximer.library.controller.impl.LocalLeng;

class CommandProvider {

	private Map<CommandName, Command> commands = new HashMap<>();
	
	public CommandProvider() {
		
		commands.put(CommandName.MAIN_PAGE, new MainPage());
		
		//UserServiceImpl
		commands.put(CommandName.SIGN_IN, new SignIn());
		commands.put(CommandName.REGISTER, new Register());
		commands.put(CommandName.REGISTER_NO_LOGIN, new RegisterNoLogin());
		commands.put(CommandName.UUQ, new UpdateUserQR());
		commands.put(CommandName.TEST_LOGIN, new TestLogin());
		
		//SearchServiceImpl
		commands.put(CommandName.LIKE, new Like());
		commands.put(CommandName.SEARCH, new Search());
		commands.put(CommandName.SEARCH_CATEGORIES, new SearchCategories());
		commands.put(CommandName.MENU, new Menu());
		
		//SideServiceImpl
		commands.put(CommandName.BASKET_ALL, new BasketAll());
		commands.put(CommandName.BOOKMARKS_ALL, new BookmarksAll());
		commands.put(CommandName.ACTIONS_ALL, new ActionsAll());
		commands.put(CommandName.IN_BASKET, new InBasket());
		commands.put(CommandName.IN_BOOKMARKS, new InBookmarks());
		commands.put(CommandName.ACTIONS_RADIUS, new ActionsRadius());
		commands.put(CommandName.BOOKMARKS_RADIUS, new BookmarksRadius());
		
		//DealServiceImpl
		commands.put(CommandName.APPROVE, new Approve());
		commands.put(CommandName.APPROVED, new Approved());
		commands.put(CommandName.REFUSE, new Refuse());
		
		//AdminServiceImpl
		commands.put(CommandName.ADD_PRODUCT, new AddProduct());
		commands.put(CommandName.ADD_ACTIONS, new AddActions());
		commands.put(CommandName.ADD_PRODUCT_ACTION, new AddProductAction());
		commands.put(CommandName.ADD_PRODUCT_TYPE, new AddProductType());
		commands.put(CommandName.DELETE_PRODUCT, new DeleteProduct());
		commands.put(CommandName.ADMIN_SHOP, new AdminShop());
		commands.put(CommandName.ADMIN, new Admin());
		commands.put(CommandName.SOUND, new Sound());
		commands.put(CommandName.PRODUCT_ACTIONS, new ProductActions());
		commands.put(CommandName.PRODUCT_TYPES, new ProductTypes());
		commands.put(CommandName.UPDATE_PRODUCT, new UpdateProduct());
		
		commands.put(CommandName.LOCAL_LENG, new LocalLeng());
		commands.put(CommandName.SARAFAN_LOGIN, new SarafanLogin());		
	}
	
	Command getCommand(String commandName) {
		System.out.println("commandName"+commandName);
		Command command;
		command = commands.get(CommandName.valueOf(commandName.toUpperCase()));//main_page
		return command;
	}
}
