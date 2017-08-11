package cryptography;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import org.junit.Test;

import com.sapient.cryptography.loader.RequestExecutor;

public class RequestExecutorTest {
	
	@Test
	public  void execute() {
		
		try {
			assertTrue(RequestExecutor.execute());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			 fail(e.getMessage());
		}
		
	}

}
