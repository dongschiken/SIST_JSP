package days06;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import days05.MemberInfo;


@WebServlet("/days06/session.htm")
public class SessionTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


    public SessionTest() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 서블릿 doGet() / doPost() 세션 사용
		//request.getSession();	- 세션이 존재하면 존재하는 세션객체를 반환
		//					 	- 세션이 존재하지 않으면 세션객체를 새로 생성해서 반환
		//request.getSession() == request.getSession(true);
		//request.getSession(false) - 세션이 존재하면 세션 객체를 반환
		//							- 세션이 존재하지 않으면 null을 반환
		
		// false를 넣어서 사용하면 세션이 없을때 null이 되어서 if 조건에 걸린다.(이런식으로 만들어야한다.)
//		HttpSession session = request.getSession(false);
//		if( session == null ) {
//			
//		}
		
		// [가정] 로그인 인증 회원 정보를 세션 저장.
		MemberInfo member = new MemberInfo();
		member.setId("admin");
		member.setName("홍길동");
		member.setPassword("1234");
		member.setEmail("admin@naver.com");
		member.setRegisterDate(new Date());
		
		HttpSession session = request.getSession();
		session.setAttribute("auth" , member);
		
		MemberInfo authMember = (MemberInfo)session.getAttribute("auth");
		if( authMember != null ) {
			String logonID = authMember.getId(); 
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	

}
