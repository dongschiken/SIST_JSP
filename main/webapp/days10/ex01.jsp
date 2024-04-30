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
     1. 계층형(답변형) 게시판 - MVC 패턴 작업
     2. days10
           ㄴ replyboard 폴더 추가
                ㄴ emoticon
                ㄴ images      
     *** 3. 로직 이해...*** 
     [DB]
     글번호 제목           작성자 ... 
     1      첫번째게시글   홍길동(새글)
     2      두번째게시글   서영학(새글)
     3      세번째게시글   정창기(새글)
     4      2-1 답글       정창기(답글)
     5      2-1-1 답글     홍길동(답글)
     6      네번째게시글   정창기(새글)
     7      6-1 답글       홍길동(답글)
     8      2-2 답글       정창기(답글)
     
     
     [화면출력] order by 글번호 desc  
     글번호 제목           작성자 ... 
     6      네번째게시글   정창기(새글)
     7        ㄴ6-1 답글       홍길동(답글)
     3      세번째게시글   정창기(새글)
     2      두번째게시글   서영학(새글)
     8        ㄴ 2-2 답글       정창기(답글)
     4        ㄴ 2-1 답글  정창기(답글) 
     5          ㄴ2-1-1 답글     홍길동(답글) 
     1      첫번째게시글   홍길동(새글)   
     
     
     *** 첫 번째 방법) 컬럼 3개 추가   *** 풀이
     글번호(PK) 제목 작성자  + 글그룹(REF) + 그룹 순번(STEP) + 깊이(DEPTH)
     
      3:05 수업시작~
     [DB]
     규칙1 새글이 작성되면 항상 글 그룹==글번호 / STEP = 1 DEPTH = 0
     규칙2 답글 작성
     	  항상 부모글 [2]  답글글그룹 == 부모글그룹 (REF) 
     	  				답글 REF 2  부모 REF 2
     	  						   부모글의 순서 + 1 이 본인의 순서
     	  						   부모글의 깊이 + 1 이 본인의 깊이
     규칙3 같은 그룹내의 부모순서보다 큰 순서는 1증가 (업데이트)
     글번호    제목         작성자 ... 		      REF    STEP    DEPTH
     1      첫번째게시글   홍길동(새글) 			글번호(1)   1등      0
     2      두번째게시글   서영학(새글)			글번호(2)   1등      0	
     3      세번째게시글   정창기(새글)			글번호(3)   1등      0	
     4      2-1 답글    정창기(답글)				글번호(2)	  3등      1
     5      4-1 답글    홍길동(답글)				글번호(2)	  4등      2
     6      2-2 답글    김길동(답글)				글번호(2)	  2등      1
     
     [화면출력] order by 글번호(REF) desc, 그룹랭킹(STEP) ASC  
     글번호 제목           작성자 ... 
     3      세번째게시글   정창기(새글)			글번호(3)   1등      0
     2      두번째게시글   서영학(새글)			글번호(2)   1등      0
	     6      2-2 답글    김길동(답글)				글번호(2)	  2등      1
	     4      2-1 답글    정창기(답글)				글번호(2)	  3등      1
	     	5      4-1 답글    홍길동(답글)				글번호(2)	  4등      2
     1      첫번째게시글   홍길동(새글) 			글번호(1)   1등      0
     
     
     
     두 번째 방법) 컬럼 2개 추가    
     [ DB ]
     글번호(PK)    제목         작성자  			순번(STEP)	깊이(DEPTH)
        1      첫번째게시글   홍길동(새글) 	      1000           0
        2      두번째게시글   서영학(새글) 	      2000           0
     	3      세번째게시글   김길동(새글) 	      3000           0
     	4      2-1답글     정창기(답글) 	      	  1998           1
     	5      4-1답글     김길동(답글) 	      	  1997           2
     	6      2-2답글     정창기(답글) 	      	  1999           1
     [ 화면 출력 ] 
     	3      세번째게시글   김길동(새글) 	      3000           0
     	2      두번째게시글   서영학(새글) 	      2000           0
     		6      2-2답글     정창기(답글) 	      	  1999           1
     		4      2-1답글     정창기(답글) 	      	  1998           1
     			5      4-1답글     김길동(답글) 	      	  1997           2
        1      첫번째게시글   홍길동(새글) 	      1000           0
        
  </xmp>  
</div>

<script>
</script>
</body>
</html>