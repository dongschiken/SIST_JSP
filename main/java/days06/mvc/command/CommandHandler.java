package days06.mvc.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandHandler {
	
	// 리턴 => list.jsp / write.jsp 등등
	String process(HttpServletRequest request, HttpServletResponse response) throws Exception ;
	
	
}
