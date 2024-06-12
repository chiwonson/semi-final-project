<%@page import="a.b.c.order.vo.OrderVO"%>
<%@page import="a.b.c.common.NumUtil"%>
<%@page import="java.util.List"%>
<%@page import="a.b.c.product.vo.ProductVO"%>
<%@page import="org.apache.log4j.LogManager"%>
<%@page import="org.apache.log4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("productSelectAll.jsp 페이지 >>> : ");

	//페이징 변수 세팅
	int pageSize = 0;
	int groupSize = 0;
	int curPage = 0;
	int totalCount = 0;

	Object objPaging = request.getAttribute("pagingPVO");
	ProductVO pagingPVO = (ProductVO)objPaging;
	
	Object obj = request.getAttribute("listAll");	
	
	List<ProductVO> list = (List<ProductVO>)obj;	
	int nCnt = list.size();
		
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/semi-project/js/common.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(document).on('click', '#ibtn', function(){
			$('#productList').attr({
				'action':'productInsertForm.t',
				'method':'GET',
			}).submit();
		});
		$(document).on('click', '#sbtn', function(){
			$('#productList').attr({
				'action':'productSelectAll.t',
				'method':'GET',
			}).submit();
		});
		$(document).on('click', '#orderall', function(){
			let urlV = 'orderSelectAll.t';
			$.ajax({
				url: urlV,
				dataType: "text",		
				success: function(data) {$("#view").html(data);}		
			});
		});
		window.onload=function(){
			let urlV = 'orderSelectAll.t';
			$.ajax({
				url: urlV,
				dataType: "text",		
				success: function(data) {$("#view").html(data);}		
			});
		}

		$(document).on('click', '#confirm', function(){
			alert("결제완료");
			location.href="orderDelete.t";
		});
		$(document).on('click', '#main', function(){
			location.href="index.jsp";
		});
	});
</script>
<style type="text/css">

	table, th, td {
	    border: 1px solid #bcbcbc;	    
	}

	th {
		text-align: center;
	}
	
	table {
		margin: 20px auto;
		width: 900px;
	}
</style>

<style>
	body {
			background-image: url('/semi-project/img/img_main/main2.jpg');
			background-size: cover;
			background-repeat: no-repeat;
			text-align: center; /* 텍스트를 가운데 정렬합니다 */
			margin: 20px auto;
			width: 900px;
		}
		
		input[type="text"], input[type="password"], input[type="file"] {
		    background-color: rgba(255, 255, 255, 0.5); 
		    border: 1px solid #000; 
		    text-align: center; 
}
		
</style>


</head>
<body>
<h3 align="center">상품리스트</h3>
<hr>
<form name="productList" id="productList">
<table border="1" align="center">
<%
String pnum = "";
String pprice = "";
String pname = "";
for(int i=0; i<nCnt; i++){		
	ProductVO _pvo = list.get(i);		
	pnum = _pvo.getPnum();
	pprice = _pvo.getPprice();
	pprice = NumUtil.comma(pprice);
	pname = _pvo.getPname();
	
	// 페이징 세팅
	pageSize = Integer.parseInt(pagingPVO.getPageSize());
	groupSize = Integer.parseInt(pagingPVO.getGroupSize());
	curPage = Integer.parseInt(pagingPVO.getCurPage());
	totalCount = Integer.parseInt(_pvo.getTotalCount());
%>
<tbody>
<tr>
	<td rowspan="4" align="center" style="width:100px;">
		<img src="/semi-project/fileupload/product/<%= _pvo.getPphoto() %>" width="150" height="150"><br>
	</td>
	<td align="left" style="width:300px;">상품번호 : <%= pnum %></td>
	<td rowspan="4" align="center" vertical-align="middle" style="width:100px;">	
		<a href="productSelect.t?pnum=<%= pnum %>" style="color: red; padding: 50px; 30px;">구매</a>
	</td>
</tr>
<tr><td align="left" style="width:300px;">상품이름 : <%= pname %></td></tr>
<tr><td>상품 가격 : <%= pprice %></td></tr>
<tr><td>상품 등록일 : <%= _pvo.getInsertdate() %></td></tr>
<%
}//end of for
%>
</tbody>
<tfoot>
<tr>
<td colspan="3">
<jsp:include page="productPaging.jsp" flush="true">
	<jsp:param name="url" value="productSelectAll.t"/>
	<jsp:param name="str" value=""/>
	<jsp:param name="pageSize" value="<%=pageSize%>"/>
	<jsp:param name="groupSize" value="<%=groupSize%>"/>
	<jsp:param name="curPage" value="<%=curPage%>"/>
	<jsp:param name="totalCount" value="<%=totalCount%>"/>
</jsp:include>
<tr align="right">
	<td colspan="3">
		<input type="button" id="sbtn" value="조회">
		<input type="button" id="ibtn" value="상품입력">
		<input type="button" id="main" value="처음으로">
	</td>
</tr>
</td>
</tr>					
</tfoot>
</table>
</form>
<!--  
<button id="orderall">내역</button>
-->
<div id="view"></div>
<div align="right">
	<button id="confirm">결제</button>
</div>
</body>
</html>