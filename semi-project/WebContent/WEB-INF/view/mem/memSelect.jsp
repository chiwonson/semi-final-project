<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.LogManager" %>  
<%@ page import="org.apache.log4j.Logger" %>    
    
<%@ page import="a.b.c.mem.vo.MemberVO" %> 
<%@ page import="a.b.c.common.CodeUtil" %> 
<%@page import="a.b.c.common.EncryptAES"%>   
<%@ page import="java.util.List" %>
    
<%request.setCharacterEncoding("UTF-8"); %>   
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("memSelect.jsp >>> : ");
%> 

<%
	Object obj = request.getAttribute("listS");
	if (obj==null) return;
	
	List<MemberVO> list=(List<MemberVO>)obj;
	int nCnt = list.size();
	
	String tpw = "";
	String tbirth="";
	String tbirth0="";
	String tbirth1="";
	String tbirth2="";
	String temail="";	
	String temails[]=null;
	String thobby="";
	
	MemberVO _tvo=null;
	_tvo=list.get(0);
	
	//패스워드
	EncryptAES ase = EncryptAES.getInstance();
	tpw = ase.aesDecode(_tvo.getTpw());
	logger.info("tpw >>> : " +tpw);
	
	//생년월일
	tbirth=CodeUtil.birth(_tvo.getTbirth());
	String birth[] = tbirth.split("-");
	tbirth0=birth[0];
	tbirth1=birth[1];
	tbirth2=birth[2];
	
	//이메일
	temail	= _tvo.getTemail();
	temails = temail.split("@");

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
				
		//이메일
		$('#temail2').change(function(){
									$("#temail2 option:selected").each(function () {
													if($(this).val()== '1'){//직접입력일경우
																var aa = $("#temail1").val();
																$("#temail1").val("");	//값 초기화
																$("#temail1").attr("readonly",false);	//활성화
															
														
													}else{	//직접입력이 아닐경우
														$("#memail1").val($(this).text()); //선택값 입력 
														$("#memail1").attr("readonly",true); //비활성화
														
													}									
									});			
		});
		
		//updateBtn
		$(document).on("clisk", "#updateBtn",function(){
					//aler("U >>> :");
					$("#memUpdateForm").attr({"method":"GET"
												,"action":"memUpdate.k"	
					}).submit();
		})
		
		
	});

</script>
</head>
<body>
	
	<h3>회원정보</h3>
	<hr>
	<div>
	<form name="memUpdateForm" id="memUpdateForm">
		<table>
			<tr>
				<td colspan="3" align="center">
					<font size="4" style="color:blue,">수정 && 삭제</font>
				</td>	
			</tr>
			
			<tr>
				<td>회원번호</td>
				<td>
					<input type="text" name="tnum" id="tnum" value="<%= _tvo.getTnum() %>" readonly/>
				</td>
				<td rowspan="5">
				</td>				
			</tr>
			
			<tr>
				<td>이름</td>
				<td><input type="text"name="tname" id="tname" value="<%= _tvo.getTname()%>">readonly/></td>
			</tr>
			
		</table>
	</form>
	</div>


</body>
</html>