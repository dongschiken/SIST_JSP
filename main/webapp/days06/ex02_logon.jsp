<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	String location = "ex02_default.jsp";
	
	
	if( id.equals("admin") && password.equals("1234") ){
		// 관리자 로그인 성공
		// auth 세션 생성
		session.setAttribute("auth", id);
	}else if(id.equals("hong") && password.equals("1234")){
		// 일반회원 로그인 성공
		session.setAttribute("auth", id);
	}else if(id.equals("park") && password.equals("1234")) {
		// 일반회원 로그인 성공
		session.setAttribute("auth", id);
	}else{
		// 로그인 실패
		location += "?logon=fail";
	}
	response.sendRedirect(location);
%>