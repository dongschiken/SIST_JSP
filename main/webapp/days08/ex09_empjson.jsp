<%@page import="com.util.JdbcUtil"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8"%>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select empno, ename, sal "
	           + " from emp "
	           + " order by sal desc";

	String jsonData = "{";
	jsonData += "\"emp\":[";
	try{
		conn = ConnectionProvider.getConnection();
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			int empno = rs.getInt("empno");
			String ename = rs.getString("ename");			
			jsonData += String.format("{\"empno\": %d, \"ename\": \"%s\"},", empno, ename);
		}
		
		jsonData = jsonData.substring(0, jsonData.length()-1);
		
		jsonData += "]";
		
		jsonData += "}";
		
	}catch(Exception e ){
		e.printStackTrace();
	}finally{
		JdbcUtil.close(conn);
		
	}
%>
<%= jsonData%>


<%--   		{
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
}   --%>
