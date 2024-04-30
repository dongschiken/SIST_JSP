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
	<a href="/jspPro/days09/list.ss">자료실 목록 보기</a>

  <xmp class="code">
     파일 업로드 자료실만들기
     파일 첨부 1개만 + 게시글 -> 자료실
     			   제목        
     			   
     create table filetest(          
     num number not null primary key  
     , subject varchar2(50) not null     
     
     , filesystemname varchar2(100) -- 실제 저장되는 파일명       a1.txt
     , originalfilename varchar2(100) -- 저장할 때 파일명             a.txt
     , filelength number  -- 파일크기
    );
    
   create sequence seq_filetest;1. 테이블 , 시퀀스 생성   
   
   MVC 비슷하게 개념
   실습) days09 패키지
   			- FileTestDTO.java
   			- FileTestDAO.java
   			- FileTestServlet.java
   		days09 폴더
   			- ex04_list.jsp
   			- ex04_write.jsp
   			- ex04_update.jsp     
   		
  </xmp>  
  
</div>

<script>
</script>
</body>
</html>