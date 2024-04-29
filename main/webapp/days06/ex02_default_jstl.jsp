<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/inc/session_auth.jspf" %>

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
     [ ex02_default.jsp ]      
     
     EL 연산자 == eq       
     empty도 EL 연산자   
  </xmp>  
  <c:choose>
  	<c:when test="${ empty logonID }">

	  <div id="logon">
	    <form action="ex02_logon.jsp">
	       아이디 : <input type="text" name="id" value="admin" /><br>
	       비밀번호 : <input type="password" name="password" value="1234" /><br>
	       <input type="submit" value="로그인" />
	       <input type="button" value="회원가입" />
	       <span style="color:red; display: none">로그인 실패했습니다.</span> 
	   </form>
	  </div>  
  	</c:when>
  	<c:otherwise>
	  <div id="logout">
	    [ <%= logonID %> ]님 환영합니다<br>
	    <a href="ex02_logout.jsp">로그아웃</a>
	  </div>      
  	<br>
  	</c:otherwise>
  </c:choose>
	<a href="/jspPro/cstvsboard/list.htm">게시판</a>
	<!-- 로그인 O -->
	<!-- EL 연산자 ne, !, not -->
	<c:if test="${ ! empty logonID }">
		<a href="#">자료실</a>
		<a href="#">일정관리</a>
	</c:if>
	
	<!-- && == and 연산자  만약  EL에서 쌍따옴표를 써야하면 바깥에 있는 쌍따옴표를 홑따옴표로 고친다. -->
	<c:if test='${ ! empty logonID and logonID eq "admin" }'>
		<a href="#">급여관리</a>
		<a href="#">인사관리</a>	
	</c:if>	
</div>
<script>

if( ${ param.logon eq "fail"} ){
   $("#logon span")
      .fadeIn()
      .fadeOut(3000);
}        
</script>
</body>
</html>