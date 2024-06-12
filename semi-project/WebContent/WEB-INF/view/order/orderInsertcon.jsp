<%@page import="a.b.c.order.vo.OrderVO"%>
<%@page import="a.b.c.common.NumUtil"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.log4j.LogManager"%>
<%@page import="org.apache.log4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("orderInsertcon.jsp 페이지 >>> : ");
	
	Object objt = request.getAttribute("listOrderAll");	

	List<OrderVO> listAll = (List<OrderVO>)objt;
	int nCnt = listAll.size();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="orderList" id="orderList">
<table border="1" align="center">
<%
String pnum = "";
String pname = "";
String pprice = "";
String hcnt = "";
String htotal = "";
int htotalcomma = 0;
String idate = "";
int htot = 0;
for(int i=0; i<nCnt; i++){		
	OrderVO ovo = listAll.get(i);
	pnum = ovo.getPnum();
	pname = ovo.getPname();
	pprice = ovo.getPprice();
	hcnt = ovo.getHcnt();
	htotal = ovo.getHtotal();
	htotalcomma = Integer.parseInt(NumUtil.comma_replace(ovo.getHtotal()));
	idate = ovo.getInsertdate();
%>

<tr>
	<td align="left" style="width:300px;">상품번호 : <%= pnum %></td>
	<td>상품이름 : <%= pname %></td>
	<td>상품 가격 : <%= pprice %></td>
	<td>수량 : <%= hcnt %></td>
	<td>가격 : <%= htotal %></td>
	<td>날짜 : <%= ovo.getInsertdate() %></td>
</tr>

<%
	htot += htotalcomma;
}//end of for
%>
<tr>
	<td colspan="6" align="right">
		총 가격 : <%= htot %>
	</td>
</tr>
</table>
</form>

<%
/*
	String result = "";
	
	result += "| ";
	result += "상품이름 : "+ pname +", ";
	result += "상품가격 : "+ pprice +", ";
	result += "수량 : "+ hcnt +", ";
	result += "가격 : "+ htotal +", ";
	result += "날짜 : "+ idate;
	result += " |";
	result += "<br>";
	System.out.println(result);
	out.println(result);
*/
%>

</body>
</html>