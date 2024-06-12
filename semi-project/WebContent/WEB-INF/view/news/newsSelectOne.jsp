<%@page import="a.b.c.news.vo.NewsVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.log4j.LogManager" %>  
<%@ page import="org.apache.log4j.Logger" %> 
<% request.setCharacterEncoding("UTF-8");%> 
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("newsSelectOne.jsp >>> : ");
%>
<%	
	Object obj = request.getAttribute("listO");
	if (obj == null) return;
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
				                    ,"action":"newsSelect.t"}).submit();
		});
	});
</script>
<style type="text/css">
	table {
		color: white;
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
	body {
			background-image: url('/semi-project/img/img_main/sonphoto.jpg');
			background-size: cover;
			background-repeat: no-repeat;
			text-align: center; /* 텍스트를 가운데 정렬합니다 */
		}
		
		/* 입력 창을 투명하게 만듭니다 */
		input[type="text"], input[type="password"], input[type="file"], input[name="ncontent""]{
			background-color: transparent;
			border: 1px solid #000; /* 아래 테두리를 추가하여 입력 창을 보다 명확하게 나타냅니다 */
			text-align: center; 
		}
</style>
</head>
<body>
<h3 style="color: white;">기사정보</h3>
<hr>
<div>
<form name="newsUpdateForm" id="newsUpdateForm">
<%
	List<NewsVO> list = (List<NewsVO>)obj;
	int nCnt = list.size();
	NewsVO nvo = list.get(0);
	logger.info(nvo.getNtitle());
	logger.info(nvo.getNphoto());
%>
<table border="1">
	<tr>
		<td>글번호</td>
		<td>
			<input type="text" name="nnum" id="nnum" value="<%= nvo.getNnum() %>" readonly>
		</td>
	</tr>
	<tr>
		<td>제목</td>
		<td>
		<textarea rows="1" cols="80" name="ntitle" id="ntitle" readonly style=" resize: none;"><%= nvo.getNtitle() %></textarea>
		</td>
	</tr>
	<tr>
		<td>작성자</td>
		<td>
			<input type="text" name="nname" id="nname" value="<%= nvo.getNname() %>" readonly/>
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
			<textarea rows="10" cols="80" name="ncontent" id="ncontent" readonly style=" resize: none;"><%= nvo.getNcontent() %></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" value="수정하기" id="U">
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>