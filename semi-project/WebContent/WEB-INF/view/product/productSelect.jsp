<%@page import="a.b.c.product.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<%

	Object obj = request.getAttribute("listS");
	List<ProductVO> list = (List)obj;
	
	String pprice = "";
	ProductVO _pvo = null;
	if (list.size() == 1) {
		_pvo = list.get(0);
		System.out.println(_pvo.getPnum());
		pprice = _pvo.getPprice();
	} 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/semi-project/js/common.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		let pprice = '<%= pprice %>';
		pprice = comma(pprice);
		console.log(pprice);
		$('#pprice').val(pprice);
		
		$(document).on('change', '#hcnt', function(){
			let cntS = $('#hcnt').val();			
			let htotal = comma_replace(pprice) * cntS;			
			$('#htotal').val(comma(htotal));
		});
		
		$(document).on('click', '#orderBtn', function(){
			$('#orderForm').attr({
				'action':'orderInsertForm.t',
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
		
		/* 입력 창을 투명하게 만듭니다 */
		input[type="text"], input[type="password"], input[type="file"] {
			background-color: transparent;
			border: 1px solid #000; /* 아래 테두리를 추가하여 입력 창을 보다 명확하게 나타냅니다 */
			text-align: center; 
		}
</style>

</head>
<body>
<div>
<form name="orderForm" id="orderForm">
<table border="1">
<tr>
<td rowspan="7" align="center" vertical-align="middle">
<img src="/semi-project/fileupload/product/<%= _pvo.getPphoto() %>" width="100" height="100">
</td>
<td align="center" colspan="2" >
<input 	type="text" name="pname" id="pname" value="<%= _pvo.getPname() %>" 
		style="text-align:center; border: none; backgroud: bransparent;" readonly />	
</td>
</tr>
<tr>
<td align="right" colspan="2">
<input 	type="text" name="pprice" id="pprice" value="<%= pprice %>" style="border: none; text-align:right;" readonly />&nbsp;원
</td>
</tr>
<tr>
<td><label style="text-align: right">수량 :</label></td>
<td align="right">  
	<select name="hcnt" id="hcnt">
		<option value="0" selected>0</option>
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
	</select>
</td>
</tr>
<tr>
<td><label style="text-align: right">총 합계 :</label> </td>
<td align="right">
<input 	type="text" name="htotal" id="htotal" value="0" 
		style="text-align:right; border: none;" readonly />&nbsp;원
<input type="hidden" name="pphoto" id="pphoto" value="<%= _pvo.getPphoto() %>" >
<input type="hidden" name="pnum" id="pnum" value="<%= _pvo.getPnum() %>" >
</td>
</tr>
<tr>
<td align="center" colspan="2">
<input type="button" id="orderBtn" value="구매하기" style="margin:auto; display:block; width:100px; height:50px;" >
</td>
</tr>
</table>	
</form>
</div>
</body>
</html>