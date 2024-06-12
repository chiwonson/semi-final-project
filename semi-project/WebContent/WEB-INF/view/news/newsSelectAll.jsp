<%@page import="a.b.c.news.vo.NewsVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%> 
<%@ page import="org.apache.log4j.LogManager" %>  
<%@ page import="org.apache.log4j.Logger" %>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("newsSelectAll.jsp >>> : ");
%>
<% request.setCharacterEncoding("UTF-8");%> 
<%
	Object obj = request.getAttribute("listAll");
	if (obj == null) return;
	

	NewsVO search_kvo = (NewsVO)request.getAttribute("search_nvo");
	
	ArrayList<NewsVO> aList = (ArrayList<NewsVO>)obj;
	int nCnt = aList.size();
	System.out.println("조회건수 nCnt >>> : " + nCnt);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>토트넘 뉴스</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function(){	
		alert("jQuery ready() 함수 블럭 진입 >>> : ");
		
		$(document).on("click", "#nnum", function(){
					
			if($(this).prop('checked')){			 
				//$('input[type="checkbox"][name="nnum"]').prop('checked',false);
				$('.nnum').prop('checked',false);
				$(this).prop('checked',true);
			}
		});
			
		//  I
		$(document).on("click", "#I", function(){
			//alert("I >>> : ");
			location.href="newsInsertForm.t";
		});
		
		// SALL
		$(document).on("click", "#SALL", function(){			
			location.href="newsSelectAll.t";		
		});
		
		$(document).on("click", "#main", function(){			
			location.href="index.jsp";		
		});
	});
</script>

<style>
	body {
			background-image: url('/semi-project/img/img_main/sonphoto.jpg');
			background-size: cover;
			background-repeat: no-repeat;
			text-align: center; /* 텍스트를 가운데 정렬합니다 */
		}
		
		/* 입력 창을 투명하게 만듭니다 */
		input[type="text"], input[type="password"], input[type="file"] {
			background-color: transparent;
			border: 1px solid #000; /* 아래 테두리를 추가하여 입력 창을 보다 명확하게 나타냅니다 */
			text-align: center; 
		}
</style>
</head>
<body>
<h3 style="color: white;">Tottenham News</h3>
<hr>
<div>
<form name="newsFormAll" id="newsFormAll">
<table border="1" style="color: white;">
<thead>
<tr>
	<th>글번호</th>
	<th>작성자</th>
	<th>제목</th>
	<th>사진</th>
	<th>입력일</th>
	<th>수정일</th>
</tr>
</thead>
<%
	for(int i=0; i<nCnt; i++){
		NewsVO nvo = (NewsVO)aList.get(i);
%>
<tbody>
<tr>
	<td><%= nvo.getNnum() %> </td>
	<td><%= nvo.getNname() %> </td>
	<td><a href="newsSelectOne.t?nnum=<%= nvo.getNnum() %>"><%= nvo.getNtitle() %></a></td>
	<td><img src="/semi-project/fileupload/news/<%= nvo.getNphoto() %>" width="50" height="50" alt="image"></td>
	<td><%= nvo.getInsertdate() %> </td>
	<td><%= nvo.getUpdatedate() %> </td>		
</tr>	
<%
	}
%>	
<tr>
	<td colspan="6" style="text-align:right;">				
		<input type="button" value="글쓰기" id="I">
		<input type="button" value="글목록" id="SALL">
		<input type="button" value="처음으로" id="main">							
	</td>
</tr>
</tbody>
</table>
</form>
</div>
</body>
</html>