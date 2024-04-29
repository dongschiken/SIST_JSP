<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
       웹 처리 과정
       		 상태 관리
       클라이언트 -> 요청 -> 서버
       클라이언트 <- 응답 
       1. 쿠키 - 클라이언트 + 텍스트 파일형식
          - js(클라이언트) + jsp(서버)
          - 쿠키를 사용하는 인증처리
       2. 세션(session)
          처음으로 웹페이지를 요청
          
          다른 / 다른 / 다른 웹 페이지 이동 - 라운드 트립
          12:00 마지막 요청 대충 20분 후 세션 종료       
          
          jsp scope 4가지
          page
          request
          session	=> setAttribute() , getAttribute()
          application      
  </xmp>  
  <%
  	String sid = session.getId();
  	long ls = session.getCreationTime();
  	String pattern = "yyyy-MM-dd HH:mm:ss";
  	SimpleDateFormat sdf = new SimpleDateFormat(pattern);
  	
  	Date d = new Date();
  	d.setTime(ls);	
  %>
  
   세션 ID = <%= sid %><br>
   세션 생성 날짜 = <%= sdf.format(d) %><br>
   
   
   <%
   	long last = session.getLastAccessedTime();
    d.setTime(last);
   %>
   
   세션 마지막 접속 날짜 = <%= sdf.format(d) %>
</div>

<script>
</script>
</body>
</html>