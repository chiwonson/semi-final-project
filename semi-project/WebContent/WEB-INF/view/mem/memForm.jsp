<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팬 가입서</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0
     	maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
  
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>     	
     	   
<script  src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script src="/kosSpring/js/validation.js"></script>

<script type="text/javascript">
	alert("자바스크립트 블럭 진입 >>> : ");
	$(document).ready(function(){
								alert("jQuert ready() 함수진입 >>> : ");
							
						//아이디 중복체크 Ajax 비동기 방식 시작 =====================================
						$(document).on("click", "#midbtn", function(){
										alert("tidbtn >>> : ");
										
										let idCheckURL 	= "Idcheck.t";
										let reqType 	= "GET";
										let dataParam 	= {mid:$("#mid").val(), };
										
										$.ajax({
												url		: idcheckURL,
												type	: reqType,
												data	: dataParam,
												success	: whenSuccess,
												error	: whenError
										});
										function whenSuccess(resData){
														alert("redData >>> : " + resData);
														if ("ID_YES" == resdata){
																	alert("아이디 사용가능 : ID_YES.");
																	$("#mkid").css('background-color', 'yellow');
																	$("#tid").attr("readonly", true);
																	$("#tpw").focus();
															
														}else if("ID_NO" == resData){
																	alert("이미 사용중인 아이디입니다. ID_NO");
																	$("#tid").val('');
																	$("#tid").focus();
															
														};
														
										}
										function whenError(e){
													alert("e >>> : " + e.responseText);
										}
						});	
						
						$("#tpw").on('change', function(){
									let pVal = $("#tpw").val();
										alert(">>> : " + pVal);
									let pBool = pwValidation(pVal);
										alert(pBool);
						});
						
						//비밀번호 체크
						$('#pwCheck').click(function(){
							
								console.log("pwCheck 함수진입");
								var pw 		= $("#tpw").val();
								var pw_1	= $("#tpw_1").val();
									alert("pw >>> : " + pw);
									alert("pw_1 >>> : " + pw_1);
								if(pw == pw_1){
									alert("비밀번호가 같습니다.");
									return true;
								}else{
										alert("비밀번호가 다릅니다.");
										$("#tpw").val('');
										$("#tpw_1").val('');
										$("#tpw").focus();
										return false;
								}
						});
						
						//사진
						
						//폼태그 데이터 콘트롤러에 보내기
						$(document).on("click", "btn", function(){
												alert("btn 버튼 블럭 진입 >>> : ");
												console.log("btn >>> : ");
												
												$('#memForm').attr({
													'action':'memInsert.t',
													'method':'POST',
													'enctype':'multipart/form-data'
						}).submit();
		});
	});
</script>
  
<style type="text/css">

	div{
		margin:0 auto;
		border:1px solid #081A4D;
	}
	
	td, th {
			padding : 5px;
	}
	h3{
		text-align: center;
	}
	
	table, th, td{
				border:1px solid black;
	}

</style>  
  
     	

</head>
<body>
	<h3><font size="5" style="color:blue;"> 토트넘 회원가입</font></h3>
	<hr>
	<div>
		<form name="memForm" id="memForm">
			<table>
				<tr>
					<td colspan="2" align="center">
						<font size="4" style="color:blue;"> 토트넘 회원가입서</font>
						<img src="/semi-project/img/son.jpg" width="25" height="25" alt="image">
					</td>
				</tr>
				
				<tr>
					<td>회원번호</td>
					<td><input type="text" name="tnum" id="tnum" readonly/></td>
				</tr>
				
				<tr>
					<td>회원이름</td>
					<td>
					<input type="text" name="tname" id="tname"/>
					</td>
				</tr>
				
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" name="tid" id="tid" placeholder="아이디체크" style="width:100px" />
						<input type="button" name="midbtn" id="midbtn" value="아이디중복확인"  />
					</td>
				</tr>
								
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="text" class="imf" name="tpw" placeholder="비밀번호 8자리" style="width:100px" maxlength="8"/>
						
						<input type="password" name="tpw_1" id="tpw_1" placeholder="비밀번호 확인" style="width:100px"/>
						<input type="button" value="비밀번호확인" id="pwcheck"/><br/>
					</td>
					
				<tr>	
					<td>사진</td>
					<td>
						<input type="file" name="tphoto"/><br>
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
					<button type="button" id="btn">확인</button>
					<button type="reset">다시</button>
					</td>					
				</tr>
			</table>
		
		</form>
	</div>

</body>
</html>