package days06.mvc.command;

import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;

import days06.mvc.domain.BoardDTO;
import days06.mvc.persistance.BoardDAOImpl;


// view 상세보기 => Model
public class DeleteHandler implements CommandHandler {


	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
				// 검색 기능 + 페이징 처리
				// 글 목록보기에서 제목을 클릭해서 상세보기 seq= 일때는 조회수 증가
				// 수정하기에서 들어오면 seq= & edit= 일때는 조회수 증가 x
				// view.htm?seq=154
		String method = request.getMethod();
		if( method.equals("GET")) {
			long pseq = Long.parseLong(request.getParameter("seq"));
			// [ 해당 글번호의 내용 가져오기 ]
			Connection conn = ConnectionProvider.getConnection();
			BoardDAOImpl daoImpl = new BoardDAOImpl(conn);
			BoardDTO dto = null;
			
			try {
				dto = daoImpl.view(pseq);
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println(" > Delete.doGet()에서 예외 발생 ");
			}
			
			conn.close();
			
			// 1. 리스트값으로 전달
			request.setAttribute("dto", dto);
		
			return "/days06/board/view.jsp"; // list.jsp;
			
		}else{
			request.setCharacterEncoding("UTF-8");
			Long pseq = Long.parseLong(request.getParameter("seq"));
			String ppwd = request.getParameter("pwd");
			//System.out.print(request.getParameter("pwd"));
			String origin_pwd;
			Connection conn = ConnectionProvider.getConnection();
			BoardDAOImpl daoImpl = new BoardDAOImpl(conn);
			BoardDTO dto = new BoardDTO();
			String location = "/jspPro/board";
			origin_pwd = dto.getPwd();
					
			String currentPage = request.getParameter("currentpage");
			String searchCondition = request.getParameter("searchCondition");
			String searchWord = request.getParameter("searchWord");
			
			if(searchWord == null) searchWord = "";
			//fn = URLEncoder.enco de(file_name, "utf-8");
			// 게시글 삭제하다가 비밀번호 3번 틀리면 게시글 접근 못하게 막기
			try {
				origin_pwd = daoImpl.getOriginalPwd(pseq);
				if( origin_pwd.equals(ppwd)) {
					int rowCount = daoImpl.delete(pseq);
					location +="/list.do?&currentpage="+currentPage+"&searchCondition="+searchCondition+"&searchWord="+URLEncoder.encode(searchWord, "UTF-8");
					location +="&delete=success";
				}else if( !origin_pwd.equals(ppwd)){
//					location +="/delete.htm?seq="+pseq + "&delete=fail";
					location += "/view.do?seq="+pseq + "&delete=fail";
				}
			} catch (SQLException e) {
				System.out.println(" > DeleteHandler.doPost() 예외 발생");
				e.printStackTrace();
			}
			
			conn.close();
			// 리 다이렉팅
			// 리 다이렉팅 할때는 컨텍스트 패스부터 준다.
			response.sendRedirect(location);
		}
		return null;
		
	}


}
