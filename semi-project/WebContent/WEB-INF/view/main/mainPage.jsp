<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="a.b.c.mem.vo.MemberVO"%>  
<%@page import="java.util.List"%> 


<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<% request.setCharacterEncoding("UTF-8"); %>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("MainPage.jsp 진입 >>> : ");		
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MAIN PAGE</title>
<meta name="viewport" content="width=device-width, initial-scale=1"> 

<script type="text/javascript" src="/semi-project/js/common.js"></script>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

</head>
<body>
<div id="contents">
	<h1>토트넘 팬 게시판</h1>
</div>


</body>
</html>