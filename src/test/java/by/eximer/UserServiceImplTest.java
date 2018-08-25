package by.eximer;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import by.eximer.library.controller.impl.side.BasketAll;

class BasketAllImplTest {

  private static BasketAll basketAll;
  //private static UserDao userDao;

  @BeforeAll
  public static void setup() {
	  basketAll = Mockito.mock(BasketAll.class);
    //userService = new UserServiceImpl(userDao);
  }

  @AfterEach
  public void reset() {
    Mockito.reset(basketAll);
  }

  @Test
  public void exceptionFlow() {
    final String errorMessage = "unknown error";
    Mockito.doThrow(new RuntimeException(errorMessage)).when(basketAll).deleteUser(1L);
    try {
    	basketAll.deleteUserById(1L);
      Assertions.fail("expected exception");
    } catch ( IllegalArgumentException e ) {
      Assertions.assertEquals(errorMessage, e.getMessage());
    }
  }

  @Test
  public void successfulFlow() {
    //userService.deleteUserById(1L);
    Mockito.verify(basketAll).deleteUser(1L);
  }

  @Test
  public void invalidFlow() {
    //userService.deleteUserById(0L);
    Mockito.verifyZeroInteractions(basketAll);
  }
}
