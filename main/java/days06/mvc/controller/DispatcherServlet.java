package days06.mvc.controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import days06.mvc.command.CommandHandler;


//@WebServlet("/DispatcherServlet")
public class DispatcherServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	
    public DispatcherServlet() {
        super();
    }
    	//키 : 요청url
    	//값 : interface => new ListHandler;
    public Map<String, CommandHandler> commandHandlerMap = new HashMap<>();
    
	@Override
	public void init() throws ServletException {
		super.init();
		//System.out.println("> DispatcherServlet.init()");
		// web.xml <servlet><init-param><param-name>path</servlet>
		String path = this.getInitParameter("path");
						// jsp의 application객체와 동일한 메서드 getServletContext()								
		String realPath = this.getServletContext().getRealPath(path);
		//System.out.println(realPath);
		
		Properties prop = new Properties();
		try (FileReader reader = new FileReader(realPath)) {
			prop.load(reader);
		} catch (Exception e) {
			throw new ServletException();
		}
		// prop의 key는 Map에 key로 넣고, value값은 Map에서 객체로 만들어서 넣는다.
		// prop 컬렉션을 반복처리 -> <key, value>  ->   Map<key, prop를 통해 들어온 문자열을 객체로 만든것>
		
		Set<Entry<Object, Object>> set = prop.entrySet();
		Iterator<Entry<Object, Object>> ir = set.iterator();
		while (ir.hasNext()) {
			Entry entry =  ir.next();
			String url = (String)entry.getKey();
			
			// days06.mvc.command.ListHandler
			String className = (String)entry.getValue();
			
			Class<?> commandHandlerClass = null;
			try {
				commandHandlerClass = Class.forName(className);
				// 실제 객체를 생성
				CommandHandler handler = (CommandHandler)commandHandlerClass.newInstance();
				this.commandHandlerMap.put(url, handler); // map에 추가
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
			
			
		}
		
	}

	@Override
	public void destroy() {
		super.destroy();
		//System.out.println("> DispatcherServlet.destroy()");
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request.getRequestURI();
//		String requestURL = request.getRequestURL().toString();
//		System.out.println(requestURL);
		
		// 					/jspPro/board/list.do
		String requestURI = request.getRequestURI();
//		System.out.println(requestURI);
		
		//  				 /jspPro
		String contextPath = request.getContextPath();
		int contextLength = contextPath.length();
		
		
		
		//			/board/list.do
		requestURI = requestURI.substring(contextLength);
		
		CommandHandler handler = this.commandHandlerMap.get(requestURI);
		
		String view = null; // view 페이지
		
		
		try {
			view = handler.process(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 만약 핸들러에서 리다이렉트가 되면 view는 null이 들어가지고 포워딩 작업 하지 않는다.
		if( view != null ) {
			// 포워딩
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
