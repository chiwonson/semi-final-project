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
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
<h3>Tottenham News</h3>
<hr>
<div>
<form name="newsFormAll" id="newsFormAll">
<table>
<thead>
<tr>
	<th><input type="checkbox" name="chkAll" id="chkAll"></th>
	<th>회원번호</th>
	<th>작성자</th>
	<th>제목</th>
	<th>사진</th>
	<th>내용</th>
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
	<td>
		<input type="checkbox" class="nnum" name="nnum" id="nnum" value=<%= nvo.getNnum() %>>
	</td>		
	<td><%= nvo.getNnum() %> </td>
	<td><%= nvo.getNname() %> </td>
	<td><%= nvo.getNtitle() %> </td>
	<td><img src="/kosSpring/fileupload/mem/<%= nvo.getNphoto() %>" border="1" width="50" height="50" alt="image"></td>
	<td><%= nvo.getNcontent() %> </td>
	<td><%= nvo.getInsertdate() %> </td>
	<td><%= nvo.getUpdatedate() %> </td>		
</tr>	
<%
	}//end of if
%>	
<tr>
	<td colspan="8" style="text-align:right;">				
		<input type="button" value="글쓰기" id="I">
		<input type="button" value="글목록" id="SALL">
		<input type="button" value="글수정" id="U">
		<input type="button" value="글삭제" id="D">									
	</td>
</tr>
</tbody>
</table>
</form>
</div>
</body>
</html>














