<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%@ page import="a.b.c.board.vo.BoardVO" %> 
<%@ page import="a.b.c.common.CodeUtil" %> 
<%@ page import="java.util.List" %> 

<% request.setCharacterEncoding("UTF-8");%> 
<%
	Object obj = request.getAttribute("listS");
	if (obj == null)return;
	
	List<BoardVO> list = (List<BoardVO>)obj;
	int nCnt = list.size();
		
	BoardVO _bvo = null;
	if (nCnt == 1){
		_bvo = list.get(0);
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		$(document).on("click", "#pwbtn", function(){
		
			let pwcheckURL = "boardPwCheck.t";
			let reqType = "POST";
			let dataParam = {
					bnum: $("#bnum").val(),
					bpw: $("#bpw").val(),
			};
			console.log("dataParam >>> : "+ dataParam);
		
			$.ajax({
				url: pwcheckURL,
				type: reqType,
				data: dataParam,
				success: whenSuccess,
				error: whenError
			});
		
			function whenSuccess(resData){
				console.log("resData >>> : "+ resData);
				if ("ID_YES" == resData){
					alert("비밀번호 GOOD.");
				
					$("#U").css('background-color','yellow');
				}else if ("ID_NO" == resData){
					alert("비밀번호 BAD.");
					return;
				};
			}
			function whenError(e){
				console.log("e >>> : "+ e.responseText);
			}
		});
	
		$(document).on("click", "#U", function(e){
			alert("U");
			e.preventDefault();
			$("#boardUpdateForm").attr({ "method":"GET",
			"action":"boardUpdate.t"}).submit();
		});
	
		$(document).on("click", "#D", function(e){
			alert("D");
			e.preventDefault();
			$("#boardUpdateForm").attr({ "method":"GET",
			"action":"boardDelete.t"}).submit();
		});
	
	});
</script>
<style type="text/css">
	body {
        background-image: url('/semi-project/img/img_main/main.jpg');
        background-size: cover;
        background-repeat: no-repeat;
        text-align: center;
    }
	div {
		margin: 0 auto;
		border:1px solid #6d82f3;
		display:table;
	}
	
	table, h3{
		border: 1px;
	}
	
	table {
		width: 100%;
		border: 1px solid #444;
		border-collapse: collapse;
	}
	
	th, td{
		border: 1px solid #444;
		padding: 10px;
	}
	.mem{ text-align: center;}

</style>
</head>
<body>
<h3 style="text-align:center;">게시글 내용</h3>
<hr>
<div>
<form name="boardUpdateForm" id="boardUpdateForm">
<table>
<tr>
<td colspan="2" align="center">게시판 글수정하기</td>
</tr>
<tr>
<td class="mem">글번호</td>
<td><input type="text" name="bnum" id="bnum" value="<%= _bvo.getBnum() %>"readonly/></td>
</tr>
<tr>
<td class="mem">제목</td>
<td>
<input type="text" name="bsubject" id="bsubject" value="<%= _bvo.getBsubject() %>" style="width:100px" readonly/>
</td>
</tr>
<tr>
<td class="mem">이름</td>
<td><input type="text" name="bname" id="bname" value="<%= _bvo.getBname() %>"readonly/></td>
</tr>
<tr>
<td class="mem">소개글</td>
<td>
<textarea name="bcontent" id="bcontent" rows="5" cols"50%"><%= _bvo.getBcontent() %>
</textarea>
</td>
</tr>
<tr>
<td class="mem">사진</td>
<td>
<img src="/semi-project/fileupload/board/<%= _bvo.getBfile()%>" border="1" width="40" height="50" alt="image">
</td>
</tr>
<td class="mem">등록일</td>
<td>
<input type="text" name="sbinsertdate" id="sbinsertdate" value="<%= _bvo.getInsertdate() %>" readonly/>
</td>
</tr>
<td class="mem">수정일</td>
<td>
<input type="text" name="sbupdatedate" id="sbundatedate" value="<%= _bvo.getUpdatedate() %>" readonly/>
</td>
</tr>
<td class="mem">패스워드</td>
<td>
<input type="text" name="bpw" id="bpw" />
<button type="button" id="pwbtn">비밀번호</button>

</td>
<tr>
<td colspan="2" align="right">
<button type="button" id="U">수정</button>
<button type="button" id="D">삭제</button>
</td>
</tr>
</table>
</form>
</div>
</body>
</html>