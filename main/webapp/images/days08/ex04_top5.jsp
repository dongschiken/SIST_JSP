<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%-- <%@ page trimDirectiveWhitespaces="true" contentType="text/html" %>  --%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Connection  conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "WITH temp AS( "
			   +" SELECT empno, ename, sal, RANK() OVER(ORDER BY sal DESC) r "
			   +" FROM emp ) "
			+ " SELECT * FROM temp "
			+ " WHERE r <= 5 " ;
	System.out.println(sql);
	String responseText = "";
	
	Calendar cal = Calendar.getInstance();
	
	String now = String.format("%tT", cal);
	
	responseText = "<h3>" + now + "</h3>";
	
	try{
		conn = ConnectionProvider.getConnection();
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			int rank = rs.getInt("r");
			int empno = rs.getInt("empno");
			String ename = rs.getString("ename");
			double sal = rs.getDouble("sal");
			responseText += String.format("<li>[%d] %d %s\t\t(%.2f)</li>", rank, empno, ename, sal);
		}
	}catch(Exception e){
		e.printStackTrace();
		
	}finally{
		rs.close();
		pstmt.close();
		conn.close();
	}
%>
<%=responseText %>