<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(document).on('click', '#pbtn', function(){
			console.log("pbtn >>> : ");
			$('#productForm').attr({
				'action':'productInsert.t',
				'method':'POST',
				'enctype':'multipart/form-data'
			}).submit();
		});
	});
</script>


<style>
	body {
			background-image: url('/semi-project/img/img_main/main2.jpg');
			background-size: cover;
			background-repeat: no-repeat;
			text-align: center; /* 텍스트를 가운데 정렬합니다 */
		}
		
		input[type="text"], input[type="password"], input[type="file"] {
		    background-color: rgba(255, 255, 255, 0.5); 
		    border: 1px solid #000; 
		    text-align: center; 
	}
</style>
</head>
<body>
<h3 style="text-align:center;">상품 등록하기</h3>
<hr>
<form name="productForm" id="productForm">
<table border="1" align="center">
<tr>
	<td colspan="2" align="center">상품 입력창</td>
</tr>
<tr>
	<td>상품이름</td>
	<td><input type="text" name="pname" id="pname" style="width:300px"></td>
</tr>
<tr>
	<td>상품이미지</td>
	<td><input type="file" name="pphoto" id="pphoto"></td>
</tr>
<tr>
	<td>상품가격</td>
	<td><input type="text" name="pprice" id="pprice" style="width:150px"></td>
</tr>
<tr>
	<td>상품수량</td>
	<td><input type="text" name="pcnt" id="pcnt" style="width:50px"></td>
</tr>
<tr>
	<td colspan="2" align="right">				
		<input type="button" value="상품등록" id="pbtn">		
	</td>				
</tr>	
</table>
</form>
</body>
</html>