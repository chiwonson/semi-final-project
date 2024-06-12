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
				'method':'POST',
				'enctype':'multipart/form-data'
				
				
			}).submit();
			
		});
		//메인으로
			        $(document).on('click', '#main', function(){
						location.href="index.jsp";
					});
			});
		
</script>

<style>
	body {
			background-image: url('/semi-project/img/img_main/main4.jpg');
			background-size: cover;
			background-repeat: no-repeat;
			text-align: center; /* 텍스트를 가운데 정렬합니다 */
		}
		
		/* 입력 창을 투명하게 만듭니다 */
		input[type="text"], input[type="password"], input[type="file"], input[id="ncontent""] {
			background-color: transparent;
			border: 1px solid #000; /* 아래 테두리를 추가하여 입력 창을 보다 명확하게 나타냅니다 */
			text-align: center; 
		}

</style>

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
			<input type="button" value="기사등록" id="newsbtn">
			<input type="reset" value="처음부터">
			<input type="button" id="main" value="메인으로">
			
		</td>				
	</tr>
</table>
</form>
</body>
</html>