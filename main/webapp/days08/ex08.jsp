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
     프로젝트 사용할 실제 예제 : jquery ajax 처리     
     jquery ajax 함수 :
     	get 방식 - getJson(), getScript(), get()
     	post 방식 - post()
     	get/post 방식 - load()	[ $.ajax() ]
     id : [    ] [ID 중복체크 버튼] jquery ajax 처리	  
     ex08_idcheck.jsp         
  
  		{
   "emp":[
            {"empno":7839,"ename":"KING"},
            {"empno":7902,"ename":"FORD"},
            {"empno":7566,"ename":"JONES"},
            {"empno":7698,"ename":"BLAKE"},
            {"empno":7782,"ename":"CLARK"},
            {"empno":7499,"ename":"ALLEN"},
            {"empno":7844,"ename":"TURNER"},
            {"empno":7934,"ename":"MILLER"},
            {"empno":7654,"ename":"MARTIN"},
            {"empno":7521,"ename":"WARD"},
            {"empno":7900,"ename":"JAMES"},
            {"empno":7369,"ename":"SMITH"}
        ]
}  
  </xmp>  
  <h2>회원가입 페이지</h2>
  <form action="" method="get">
  	deptno : <input type="text" name="deptno" value="10" />
  	empno()  : <input type="text" name="empno" value="7369" />
  	<input type="button" id="btmEmpnoCheck" value="empno 중복체크 - jquery" />
  	<p id="notice"></p>
  	<br>
  	ename : <input type="text" name="ename" value="" />
  	job : <input type="text" name="job" value="" />
  	
  	<input type="submit" value="회원(emp) 가입" />
  </form>
</div>

<script>
	$(function (){
		$("#btmEmpnoCheck").on("click", function(){
			// ajax params = ?empno=입력받은사원번호(7369)
			let params = $("form").serialize();			
			//alert(params);
			$.ajax({
				 url:"ex08_idcheck.jsp"
				,dataType:"json" // text, json, xml, jsonp 등등
				,type:"GET"
				,data: params // 이 부분을 수정하여 params를 전달합니다.
				,cache:false // 매우 중요 = 캐시 임시버퍼를 사용하지 않겠다. false
				,success: function(data, textStatus, jqXHR){
					// {count:1}
					// jquery ajax 함수에서는 전달된 data JSON 데이터를 자동으로 js 객체로 변환한다.
					// JSON.parse()  json => js 로 변환할 필요가 없다. ( $.ajax가 자동으로 해줘서 )
					//alert(data.count);
					if( data.count == 1){
						$("#notice").css("color", "red").text("이미 사용중인 ID입니다.");
					}else{
						$("#notice").css("color", "red").text("사용 가능한 ID입니다.");
					}
				}
				,error: function(){
					alert(params);
				}
				
			});
			
		}); // click
	}); // function
</script>
</body>
</html>