<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOARD : 게시판 : 글쓰기 </title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	alert("자바스크립트 블럭 진입 >>> : ");
	
	$(document).ready(function(){
		alert("jQuery ready()함수 블럭 진입 >>> : ");
		
		$(document).on("click", "#tBtn", function(){
			console.log("tBtn >>> : ");
			
			$('#boardForm').attr({
				'action':'boardInsert.t',
				'method':'POST',
				'enctype':'multipart/form-data'
			}).submit();
		});
	});	
</script>
<style type="text/css">

	h3 {
		text-align: center;
	}
	
	.tt {
		text-align: center;
	}
</style>
</head>
<body>
	<h1>insertForm.jsp</h1>
	<hr>
	<form name="Insert" id="insert">
		<table border="1" class="align">
			<tr>
				<td colspan="2" class="align"> 입력	</td>
			</tr>
			
			<tr>
				<td class="align"> 회원번호 </td>
				<td><input type="text" name="tnum" id="tnum" size="30"></td>
			</tr>
			
			<tr>
				<td class="align"> 회원이름</td>
				<td><input type="text" name="tname" id="tname" size="20"></td>
			</tr>
			
			<tr>
				<td class="align">비밀번호</td>
				<td><input type="password" name="tpw" id="tpw" size="20"></td>
			</tr>
			
			<tr>
				<td>사진</td>
					<td>
					<input type="file" name="tfile" id="tfile">
				</td>
			
			</tr>
			
			<tr>
				<td colspan="2" class="align">
					<input type="button" value="글쓰기" id="tBtn">
				</td>
			</tr>
		</table>	
	</form>

</body>
</html>