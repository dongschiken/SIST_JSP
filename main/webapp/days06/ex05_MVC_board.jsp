<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://localhost/jspPro/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/jspPro/resources/cdn-main/example.css">
<script src="/jspPro/resources/cdn-main/example.js"></script>
<style>
 span.material-symbols-outlined{
    vertical-align: text-bottom;
 }
</style>
</head>
<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">kenik HOme</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<h3>
  <span class="material-symbols-outlined">view_list</span> jsp days00
</h3>
<div>
  <xmp class="code">
     1. 모델 2 구조의 MVC 패턴     
     	- 모델 1 구조
     		클라이언트[list.jsp] -> 요청 -> list.jsp -> 응답 -> 클라이언트
     	- 모델 2 구조
     	    클라이언트[list.htm] -> 요청 -> [서버](로직처리 담당자 == 서블릿) (request.setAttribute("list".list))
     	    -> 출력담당자(jsp) list.jsp / request.getAttribute("list") -> 응답 -> 클라이언트 화면
     	- 여러가지 모델 구조중에 mvc 패턴    
     2. MVC 패턴??
     	
        - Model : 각각의 요청마다 로직을 처리 ( 비즈니스 영역 )
        - View  : 사용자가 보게될 화면 출력 담당 ( 프리젠테이션 영역 )
        
        - Controller : 모든 요청 -> 응답 흐름 제어  ( 서블릿 )
  		
  		- 사용자 list.htm -> 요청 -> 
  	 3. 실습	게시판 구현 -> MVC 패턴으로 수정
  	 	1) days04 > board 폴더 ===> view
  	 	
  	 	2) days04.board 패키지				- 서블릿 List.java
  	 	   days04.board.domain 패키지 		- VO, DTO
  	 	   days04.board.persistance 패키지	- DAO
  		   
  		   days06.mvc.domain 패키지
  		   days06.mvc.persistance 패키지
  		   days06.mvc.command 패키지 ===> model
  		   days06.mvc.service 패키지 추가
  		   days06.mvc.controller 패키지 추가  ===> controller
  		   
  		3) 모든 요청 -> 흐름 제어 Controller
  		   ㄱ. 서블릿
  		      url-pattern: 4가지
  		      	- /	모든 요청
  		      	- [*.do(확장자)] 처리
  		   ㄴ. /board/list.do, /board/write.do, /borad.edit.do, /board.delete.do
  		   	  WEB-INF 폴더안에 파일 생성 commandHandler.properties
  		   	  /board/list.do => 요청 => model
  		   	  /board/write.do => 요청 => model
  		   ㄷ. 컨트롤러 역할 ( DispatcherServlet )
  		   모든 요청 -> list.do, write.do 등등
  		   			  1. url 얻어와서 context뒤에 잘라서 요청 url을 파악 ( list.do 인지 / write.do 인지 ??...)
  		   			  2. commandHandler.properties 찾아서
  		   			  	 list.do=[모델객체]
  		   			  	 요청 처리할 모델객체 얻어와서
  		   			  	 모든 ~ 핸들러 마다 똑같은 메서드 만들기 위해 CommandHandler.java 인터페이스 생성 => process()메서드 선언
  		   			  	 모든 핸들러는 CommandHandler를 implements;
  		   			  	 CommandHandler command = ListHandler.java;
  		   			  	 							process() r.s()
  		   			  	 list.jsp + 포워딩/리다이렉팅 = command.process(); 로 작업 처리
  		4) web_days05.xml
  		   web.xml
  		5) Model
  		   ㄱ. CommandHandler 인터페이스 선언
  		   		String lis.jsp / write.jsp 
  		   		process()	 r.s 저장
  		   ㄴ. 글목록 [M]VC  ListHandler.java == list.java  	  
  		6) DS.java
  		   CommandHandler. String process(r,r)
  		   CommandHandlerMap<url, Obj>
  		   init(){
  		   	String path = request.getInitParameter("path");
  		   	realPath ==> this.getServletContext().getRealPath(path);
  		   }
  		   Destroy()
  		   WI > ch.properties
  		   		list.do=ListHandler
  		   web.xml
  		   	Ser
  		   	i-p
  		   		path
  		   		p
  		   	SM 	
  </xmp>  		
  <a href="/jspPro/board/list.do">board/list.do</a>
</div>

<script>
</script>
</body>
</html>