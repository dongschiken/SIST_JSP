package java_days07.guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import java_days07.guestbook.domain.Message;
import java_days07.guestbook.persistence.MessageImpl;


// 싱글톤
public class GetMessageListService {
	
    private static GetMessageListService  instance = null;
	
	private GetMessageListService() {}
	
	public static GetMessageListService getInstance() {
		if(   instance == null ) {
			instance = new GetMessageListService();
		}
		return instance;
	}

	// 한 페이지에 출력할 방명록 수 
	private static final int MESSAGE_COUNT_PER_PAGE = 3;
	
	// MessageListView [방명록 목록 + 페이징 처리] 반환하는 메서드
	public  MessageListView getMessageList( int pageNumber ) {
		
		Connection conn = null;		
		int currentPageNumber = pageNumber;

		try {			 
			// DBCP   conn
			conn = ConnectionProvider.getConnection();			 
			// DAO
			MessageImpl messageDao = MessageImpl.getInstance();

			// 총 방명록 수
			int messageTotalCount = messageDao.selectCount(conn);

			List<Message> messageList = null;

			int firstRow = 0;
			int endRow = 0;

			if ( messageTotalCount > 0 ) {
				firstRow =	(pageNumber - 1) * MESSAGE_COUNT_PER_PAGE + 1;
				endRow   = firstRow + MESSAGE_COUNT_PER_PAGE - 1;
				//      dao.selectList()     해당 페이지의 방명록을 select
				messageList =			messageDao.selectList(conn, firstRow, endRow);
			} else {
				currentPageNumber = 0;
				messageList = Collections.emptyList();  // 
			}


			return new MessageListView(
					messageList,
					messageTotalCount
					, currentPageNumber,
					MESSAGE_COUNT_PER_PAGE
					, firstRow, endRow);

		} catch (SQLException | NamingException e) {
			throw new ServiceException("> 목록 구하기 실패: " + e.getMessage(), e);
		} finally {
			try {
				conn.close();  // 커넥션 풀 반환
			} catch (SQLException e) {
				e.printStackTrace();
			}  
		}
		
	} // getMessageList

	public Message getMessage(int messageId) {
		Connection  conn = null; 
		try {
			conn = ConnectionProvider.getConnection();
			MessageImpl messageDao = MessageImpl.getInstance();		
			
			return  messageDao.select(conn, messageId); // DI
			
		} catch (Exception e) {
			throw new ServiceException("메세지 구하기 실패 : " 
					+ e.getMessage(), e);
		}finally {
			JdbcUtil.close(conn);
		}
	}
	
} // class