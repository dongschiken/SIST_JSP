package days04.board.domain;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class PageDTO {
	
	public PageDTO(
	           int currentPage
	         , int numberPerPage
	         , int numberOfPageBlock
	         , int totalPages) { 
	      this.currentPage = currentPage;
	      this.numberPerPage = numberPerPage;
	      this.numberOfPageBlock = numberOfPageBlock;
	      this.totalPages = totalPages;
	      
	      // 시작 번호, 끝 번호
	      start = (currentPage -1) /numberOfPageBlock * numberOfPageBlock +1 ;         
	      end= start + numberOfPageBlock -1;               
	      end =   end > totalPages ? totalPages : end;   
	      // 이전버튼, 다음버튼
	      if( start != 1 )      prev = true;   
	      if( end != totalPages ) next = true;
	   }
		
	private int currentPage = 1;
	private int numberPerPage = 10;
	private int numberOfPageBlock = 10;
	private int totalPages;
	
	private int start;
	private int end;
	
	private boolean prev;
	private boolean next;
	
}
