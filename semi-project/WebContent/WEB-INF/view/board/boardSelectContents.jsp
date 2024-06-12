<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%@ page import="a.b.c.board.vo.BoardVO" %> 
<%@ page import="a.b.c.common.CodeUtil" %> 
<%@ page import="java.util.List" %> 

<% request.setCharacterEncoding("UTF-8"); %>
<%
	Object obj = request.getAttribute("listS");
	if (obj == null) return;
	
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
		
		$(document).on("click", "#pwBtn", function(){
			let input_bpw = prompt('비밀번호를 입력하세요', 'aaa');
			
			if (input_bpw.length > 0){
				console.log(input_bpw);
				
				let pwcheckURL = "boardPwCheck.h";
				let reqType = "POST";
				let dataParam = {
					bnum: $("#bnum").val(),
					bpw: input_bpw,
				};
				
				console.log("dataParam >>> : " + dataParam);
				
				$.ajax({
					url: pwcheckURL,
					type: reqType,
					data: dataParam,
					success: whenSuccess,
					error: whenError
				});
				
				function whenSuccess(resData){
					console.log("resData >>> : " + resData);
					if ("ID_YES" == resData){
						alert("비밀번호 GOOD.");
						
						$("#updateBtn").css('background-color','yellow');
						if($("#updateBtn").prop("disabled")==true);{
							$("#updateBtn").attr("disabled", false);
						}
					}else if ("ID_NO" == resDataFlag){
						alert("비밀번호 BAD.");
						return;
					};
				}
				function whenError(e){
					console.log("e >>> : "+ e.responseText);
				}
			
			}	
				
		});	
		
		$(document).on("click", "#like_1", function(e){
			alert("like_1 버튼 클릭 >>> :");
			
			let boardLikeURL = "like_cnt_1.t";
			let reqType = "GET";
			let dataParam = {
				like_cnt_1: $(this).val(),
				mnum: $("mnum").val(),
				num: $("bnum").val(),
			};
			dataParam = $("#boardUpdateForm").serialize();
			console.log("dataParam >>> : "+ dataParam);
			
			$.ajax({
				url: boardLikeURL,
				type: reqType,
				data: dataParam,
				success: whenSuccess
			});
			
			function whenSuccess(resData){
				alert("resData >>> : " + resData);
				console.log("resData >>> : " + resData);
				$("#disp_cnt_recom").text(resData).val();
			}
			
		});
		
		$(document).on("click", "#like_2", function(e){
			alert("like_2 버튼 클릭 >>> : ");
			
			let boardLikeURL = "like_cnt_2.t";
			let reqType = "GET";
			let dataParam = {
				like_cnt_1: $(this).val(),
				mnum: $("mnum").val(),
				bnum: $("bnum").val(),
			};
			dataParam = $("#boardUpdateForm").serialize();
			console.log("dataParam >>> : " + dataParam);
			
			$.ajax({
				url: boardLikeURL,
				type: reqType,
				data: dataParam,
				success: whenSuccess
			});
			
			function whenSuccess(resData){
				alert("resData >>> : " + resData);
				console.log("resData >>> : " + resData);
				$("#disp_cnt_stop").text(resData).val();
					
			}

		});
		$(document).on("click", "#like_3", function(e){
			alert("like_3 버튼 클릭 >>> : 준비중 입니다.");
		});
		
		$(document).on("click", "#insertBtn", function(){
			location.href="boardForm.t";
		});
		$(document).on("click", "#selectAllBtn", function(){
			$("#boardUpdateForm").attr({"method":"GET",
			"action":"boardSelectAll.t"}).submit();
		});
		
		$(document).on("click", "#updateBtn", function(){
			alert("updateBtn");
			$("#boardUpdateForm").attr({"method":"GET",
			"action":"#boardUpdate.t"}).submit();		
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

	table, hd, h3 {
		text-align: center;
		border: 1px;
	}
	
	table {
	   width: 100%;
	   border: 1px solid #444;
	   border-collapse: collapse;
  	}
	
	th, td {
	   border: 1px solid #444;
	   padding: 10px;
	}
	
	.td_1 {
		font-size: 12px;
		color: black;		
	}
	
	.td_2 {
		font-size: 12px;
		color: black;
		text-align:right;
	}
</style>	
</head>
<body>
<h3>게시글 내용</h3>
<hr>
<div>
<form name="boardUpdateForm" id="boardUpdateForm">
<table>
<tr>
<td>제목</td>
<td colspan="4" style="text-align:left;width:400;">
	<font size="4" style="color:black;"><%= _bvo.getBsubject() %></font>
	<input type="hidden" name="bnum" id="bnum" value="<%= "B0002" %>" />
	<input type="hidden" name="mnum" id="mnum" value="<%= "M202211090004" %>" />
</td>
<td  class="td_2"> 조회 <%= _bvo.getBhit() %> &nbsp; 작성일자 : <%= _bvo.getUpdatedate() %></td>
</tr>
<tr>
	<td>작성자</td>
	<td><%= _bvo.getBname() %></td>
	<td>카테고리</td><td class="td_1"><%= "업체 후기" %></td>
	<td>상세</td><td class="td_1"><%= "충청북도 청주시 흥덕구 > 카페/식당" %></td>
</tr>
<tr>
	<td colspan="6" style="text-align:left">
		<img src="/semi-project/fileupload/board/<%= _bvo.getBfile() %>" border="1"
		width="100" height="100" alt="image"><br>
	</td>
</tr>
<tr>
	<td colspan="6" style="text-align:left">
		<textarea name="content" id="content" rows="5" cols="100"><%= _bvo.getBcontent() %>
		</textarea>
	</td>
</tr>
<tr>
<td colspan="6" style="text-align:left">
<button type="button" class="like_1" name="like_1" id="like_1">추천
<p>
<img src='/Spring/img/img_board/heart.png' style='width:12px; margin:3px 3px 0 ;'>
	
</p>
</button>
<button type="button" class="like_2" name="like_2" id="like_2">반대
<p>
<img src='Spring/img/img_board/thumb_rev.png' style='width:12px; margin:3px 3px 0 0;'>

</p>
</button>
<button type="button" class="like_3" name="like_3" id="like_3">신고
<p>
<img src='/Spring/img/img_board/alarm.png' style='width:18px; margin-top:1px; '>
</p>
</button>
</td>
</tr>
<tr>
<td colspan="6" align="center">
<button type="button" id="insertBtn">글쓰기</button>
<button type="button" id="selectAllBtn">글목록</button>
</td>
</tr>
</table>
</form>
</div>
</body>
</html>