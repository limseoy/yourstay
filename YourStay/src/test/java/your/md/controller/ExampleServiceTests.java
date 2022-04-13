package your.md.controller;

import junit.framework.TestCase;
import yourstay.md.controller.ExampleService;

public class ExampleServiceTests extends TestCase {

	private ExampleService service = new ExampleService();
	
	public void testReadOnce() throws Exception {
		assertEquals("Hello world!", service.getMessage());
	}

}
