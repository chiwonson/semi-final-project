<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기사 등록</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(document).on("click", "#newsbtn", function(){
			console.log("newsForm >>> : ");								
			$('#newsForm').attr({
				'action':'newsInsert.t',
				'method':'GET',
				'enctype':'multipart/form-data'
			}).submit();
		});
	});	
</script>
</head>
<body>
<h3 style="text-align:center;">뉴스 등록</h3>
<hr>
<form name="newsForm" id="newsForm">
<table border="1" align="center">
	<tr>
		<td>작성자</td>
		<td>
			<input type="text" name="nname" id="nname" style="width:150px">
		</td>
	</tr>
	<tr>
		<td>뉴스 제목</td>
		<td>
			<input type="text" name="ntitle" id="ntitle" style="width:500px">
		</td>
	</tr>
	<tr>
		<td>사진</td>
		<td>
			<input type="file" name="nphoto" id="nphoto">
		</td>
	</tr>
	<tr>
		<td>기사 내용</td>
		<td>
			<textarea rows="10" cols="80" name="ncontent" id="ncontent"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="right">				
			<input type="button" value="상품등록" id="newsbtn">
			<input type="reset" value="처음부터">
		</td>				
	</tr>
</table>
</form>
</body>
</html>