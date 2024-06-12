<%@page import="a.b.c.news.vo.NewsVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.log4j.LogManager" %>  
<%@ page import="org.apache.log4j.Logger" %> 
<% request.setCharacterEncoding("UTF-8");%> 
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("newsSelect.jsp >>> : ");
%>
<%	
	Object obj = request.getAttribute("listS");
	if (obj == null) return;

	List<NewsVO> list = (List<NewsVO>)obj;
	int nCnt = list.size();
	NewsVO nvo = list.get(0);
	String nnum = nvo.getNnum();
	String nname = nvo.getNname();
	String ntitle = nvo.getNtitle();
	String nphoto = nvo.getNphoto();
	String ncontent = nvo.getNcontent();	
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//  U
		$(document).on("click", "#U", function(){
			
			 $("#newsUpdateForm").attr({ "method":"GET"
				                    ,"action":"newsUpdate.t"}).submit();
		});
		
		//  D
		$(document).on("click", "#D", function(){
			
			$("#newsUpdateForm").attr({ "method":"GET"
				                   ,"action":"newsDelete.t"}).submit();
		});
	});
</script>
<style type="text/css">
	table {
		background-color: white;
	}	
	
	div {		 
		margin: 0 auto; 		
		border:1px solid #6d82f3;
		display:table;
	}			

	td, th {
		 padding: 5px;
	}

	h3 {
		text-align: center;
	}	
	
	table, th, td {
  		border: 1px solid black;  		
	}
	.photo {
		border:1px solid red;		
		width: 180px;
		height: 180px;		
		display: block;
		/*
			margin-reft: auto;
			margin-rigth; auto;
		*/		
		border-radius: 50%;
	}
	
	.tt {
		color: red;
	}
</style>
</head>
<body>
<h3 style="color: white;">기사정보</h3>
<hr>
<div>
<form name="newsUpdateForm" id="newsUpdateForm">
<table border="1">
	<tr>
		<td colspan="2" align="center">
		<font size="4" style="color:red;">수정 && 삭제</font>
		</td>
	</tr>
	<tr>
		<td>번호</td>
		<td>
			<input type="text" name="nnum" id="nnum" value="<%= nvo.getNnum() %>" readonly/>
		</td>
	</tr>
	<tr>
		<td>작성자</td>
		<td>
			<input type="text" name="nname" id="nname" value="<%= nvo.getNname() %>" readonly/>
		</td>
	</tr>
	<tr>
		<td>제목</td>
		<td>
		<textarea rows="1" cols="80" name="ntitle" id="ntitle" style=" resize: none;"><%= nvo.getNtitle() %></textarea>
		</td>
	</tr>
	<tr>
		<td>사진</td>
		<td>
			<img alt="image" src="/semi-project/fileupload/news/<%= nvo.getNphoto() %>" height="180">
		</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
			<textarea rows="10" cols="80" name="ncontent" id="ncontent"><%= nvo.getNcontent() %></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" value="글수정" id="U">
			<input type="button" value="글삭제" id="D">
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>