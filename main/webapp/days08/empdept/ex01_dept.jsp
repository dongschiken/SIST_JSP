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
      1. 부서정보 select로 뿌리는 작업               
  </xmp> 
  	<form action="dept.jsp" method="get">
  		<input type="text" value="부서 셀렉트 태그에 담기" />
  		<input type="button" id="btn1" value="버튼"/>
  	</form>
  	
  	<select name="cmbdept" id="cmbdept"></select>
  	<table id="table1">
  		
  	</table>
</div>

<script>
	$(function(){
		$("#btn1").on("click", function(){
			$("#cmbdept").empty();
			let params = $("form").serialize();
			$.ajax({
				 url:"dept.jsp"
				,dataType:"json"
				,type:"GET"
				,data:params
				,cache:false
				,success: function(data, textStatus, jqXHR){
					$(data.dept).each( function(index, element){
						$("#cmbdept").append(`<option value=\${element.deptno}>\${element.dname}</option>`);		
					});
				}
				,error : function(){
					alert("error");
				}
			})
		})
	})
	
	$(function(){
		$("#cmbdept").on("change", function(){
			$("#table1").empty();
			let params = $("#cmbdept").serialize();  // cmbdept=30 // 이렇게 들고감
			$.ajax({
				 url:"emp.jsp"
				,dataType:"json"
				,type:"GET"
				,data:params
				,cache:false
				,success: function(data, textStatus, jqXHR){
					$(data.emp).each( function( index, element ){
						$("#table1").append("<tr>");
						$("#table1").append(`<td>\${element.empno}</td><td>\${element.ename}</td>
											 <td>\${element.job}</td><td>\${element.mgr}</td>
											 <td>\${element.hiredate}</td><td>\${element.sal}</td>
											 <td>\${element.comm}</td><td>\${element.deptno}</td>`);
						$("#table1").append("</tr>");
					})
				}
				,error: function(){
					alert("error");
				}
			})
			
		})
	})

</script>
</body>
</html>