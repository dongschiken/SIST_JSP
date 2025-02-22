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
      [ 표현 언어 ( Expression language == EL 3.0 )]      
      1. 값을 표현(출력)하는데 사용되는 스크립트 언어
      2. JSP의 스크립트 요소( 표현식 )을 보완하기 위한 것이다.
      3. 표현식보다 더 간결하고 편리하다. ( 장점 )
      4. JSP 2.0부터 EL 포함 ( JSP2.3 )
      5. EL의 기능
      	 1) JSP 4가지 기본 영역( scope )
      	 	page scope		   => pageContext
      	 	request scope	   => requestScope
      	 	session scope	   => sessionScope
      	 	application scope  => applicationScope
      	 2) EL 수치 연산, 관계 연산, 논리 연산자 제공한다.
      	 	== / eq
      	 	!= / ne
      	 	!  / not
      	 	empty
      	 	등등
      	 ***(중요) 3) 자바클래스의 메서드를 EL 안에서 호출 가능 
      	 4) 람다식 사용 가능 ( EL 3.0 )
      	 5) 쿠키
      	 	[jsp 기본 내장 객체]
      	 	1. param == request.getParameter()
      	 	 예) list.jsp?seq=10
      	 	 	String seq = request.getParameter("seq");
      	 	 	${ param.seq }
      	 	 	
      	 	 	list.jsp?age=10&age=20&age=30
      	 	 ( ==> jsp 객체)
      	 	 ( <== el  객체)
      	 	 	 ${ paramValues }  == String[] ageArr = request.getParameterValues() 
      	 	2. pageContext  == page 객체와 동일
      	 	3. pageScope, requestScope, sessionScope, applicationScope
      	 	4. header 		== request.getHeader()
      	 	   headerValues == request.getHeaders()
      	 	5. cookie
      	 	6. initParam 	== application.getInitParameter()
      	 	7.  	
      	 6) 스트림API, 정적 메서드 실행
      
      6. EL 사용 형식  ${ expression(표현식) }
      	 <%-- js 백X틱 : \${ }    |    EL 표현 : ${ } --%>
      	 
          
  </xmp>  
</div>

<script>
</script>
</body>
</html>