<%@page import="java.util.Date"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="com.util.JdbcUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = " SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno "
				+" FROM emp "
				+" WHERE deptno = ? "
				+" ORDER BY sal DESC ";
	
	int cmbdept = Integer.parseInt(request.getParameter("cmbdept"));
	JSONObject empData = new JSONObject();
	JSONArray empArray = new JSONArray();
	
	try{
		conn = ConnectionProvider.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, cmbdept );
		rs = pstmt.executeQuery();
		
		while( rs.next() ){
			int empno = rs.getInt("empno");
			String ename = rs.getString("ename");
			String job = rs.getString("job");
			int mgr = rs.getInt("mgr");
			String hiredate = rs.getString("hiredate");
			double sal = rs.getDouble("sal");
			double comm = rs.getDouble("comm");
			int deptno = rs.getInt("deptno");
			JSONObject emp = new JSONObject();
			emp.put("empno", empno);
			emp.put("ename", ename);
			emp.put("job", job);
			emp.put("mgr", mgr);
			emp.put("hiredate", hiredate);
			emp.put("sal", sal);
			emp.put("comm", comm);
			emp.put("deptno", deptno);

			empArray.add(emp);
		}
		empData.put("emp", empArray);
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		JdbcUtil.close(rs);
		JdbcUtil.close(pstmt);
		JdbcUtil.close(conn);
	}
	
%>
<%= empData %>

