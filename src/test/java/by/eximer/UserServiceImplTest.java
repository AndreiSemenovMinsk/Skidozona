package by.eximer;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import by.eximer.library.controller.impl.side.BasketAll;
import by.eximer.library.dao.DAOFactory;
import by.eximer.library.dao.SideDAO;
import by.eximer.library.service.SideService;
import by.eximer.library.service.exeption.ServiceException;
import by.eximer.library.service.impl.SideServiceImpl;

class BasketAllImplTest {

  private static SideService sideService;
  private static SideDAO sideDao;

  @BeforeAll
  public static void setup() {
	  sideDao = Mockito.mock(SideDAO.class);
	  sideService = new SideServiceImpl();
	  
	  DAOFactory factory = DAOFactory.getInstance();
	  sideDao = factory.getSideDAO();
  }

  @AfterEach
  public void reset() {
    Mockito.reset(sideService);
  }

  @Test
  public void exceptionFlow() throws ServiceException {
    final String errorMessage = "unknown error";
    Mockito.doThrow(new RuntimeException(errorMessage)).when(sideService).basketAll(111);
    try {
    	sideService.basketAll(111);
      Assertions.fail("expected exception");
    } catch ( IllegalArgumentException e ) {
      Assertions.assertEquals(errorMessage, e.getMessage());
    }
  }

  @Test
  public void successfulFlow() throws ServiceException {
    //userService.deleteUserById(1L);
    Mockito.verify(sideService).basketAll(111);
  }

  @Test
  public void invalidFlow() {
    //userService.deleteUserById(0L);
    Mockito.verifyZeroInteractions(sideService);
  }
}
