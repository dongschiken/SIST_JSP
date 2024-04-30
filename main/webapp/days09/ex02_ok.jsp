<%@page import="java.util.Enumeration"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
                     
  </xmp>  
  <% 
  	// [ J ]
  	String saveDir = pageContext.getServletContext().getRealPath("/days09/upload");
  	System.out.println(saveDir);
   	File f = new File(saveDir);
  	if( !f.exists() ) f.mkdirs();
  	
  	// [ X ]
  	int maxPostSize = 5 * 1024 * 1024; // 5MB
  	
  	
  	// [ Y ]
  	String encoding = "UTF-8";
  	
  	// a.txt 파일을 업로드 -> upload 폴더 안에 a.txt저장
  	// 업로드 파일이 중복될때 어떻게 처리할 지??
  	FileRenamePolicy policy = new DefaultFileRenamePolicy();
  	
  	MultipartRequest multipartRequest = new MultipartRequest(
  			request, 
  			saveDir, 
  			maxPostSize, 
  			encoding, 
  			policy);
  	// 벌써 파일은 업로드 폴더에 저장완료된 상태이다. ( 저장코딩 x )
  %>
  > 전송된 메시지 : <%= multipartRequest.getParameter("msg") %>
  <br>
  <br>
  <%
  Enumeration en = multipartRequest.getFileNames();
  while(en.hasMoreElements()){
	  String inputNameAttr = (String)en.nextElement(); // file1 / file2 / file3
	  File attachFile = multipartRequest.getFile(inputNameAttr);
	  if( attachFile != null ){ // 첨부파일이 있는 경우
		  String fileName = attachFile.getName();
	  	  // 고객이 업로드 할때의 원래 파일명
	  	  String originalFileName = multipartRequest.getOriginalFileName(inputNameAttr);
	  	  // 실제 upload 폴더에 저장된 파일명
	  	  String fileSystemName = multipartRequest.getFilesystemName(inputNameAttr);
	  
  %>
	> 첨부된 파일 명 <%= fileName %><br>
	> 첨부된 파일 명 <%= attachFile.length() %>byte<br>
	> 업로드 파일 명 <%= originalFileName %><br>
	> 실제 upload폴더에 저장된 파일 명 <%= fileSystemName %><br>
  <%
	  } // if
  } // while
  %>
</div>

<script>
</script>
</body>
</html>