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

<script src="/semi-project/js/validation.js"></script>

<script type="text/javascript">
	alert("자바스크립트 블럭 진입 >>> : ");
	$(document).ready(function(){
								alert("jQuert ready() 함수진입 >>> : ");
						//회원번호
						//이름
						
						//아이디 중복체크 Ajax 비동기 방식 시작 =====================================
						$(document).on("click", "#tidbtn", function(){
										alert("tidbtn >>> : ");
										
										let idCheckURL 	= "Idcheck.t";
										let reqType 	= "GET";
										let dataParam 	= {mid:$("#tid").val(), };
										
										$.ajax({
												url		: idCheckURL,
												type	: reqType,
												data	: dataParam,
												success	: whenSuccess,
												error	: whenError
										});
										function whenSuccess(resData){
														alert("redData >>> : " + resData);
														if ("ID_YES" == resData){
																	alert("아이디 사용가능 : ID_YES.");
																	$("#tkid").css('background-color', 'blue');
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
						
						// 성별
						
						// 이메일 
						$('#temail2').change(function(){	
						$("#temail2 option:selected").each(function () {
							if($(this).val()== '1'){ //직접입력일 경우 
									var aa = $("#temail1").val();					
									$("#temail1").val(''); //값 초기화 
									$("#temail1").attr("readonly",false); //활성화 				
							}else{ //직접입력이 아닐경우 
									$("#temail1").val($(this).text()); //선택값 입력 
									$("#temail1").attr("readonly",true); //비활성화 
							}}); 
						}); 
										
						//취미
						
						// 생년월일
						$("#tbirth").on("input", function(){
							var m = $("#tbirth");
							if (m.val().length > m.maxlength){
								m.valu = m.value.slice(0, m.maxlength);
							}
						});		
				        // 월 
				        $("#tbirth1").append("<option value=''>월--- </option>");
				        for(var i = 1; i <= 12; i++){
				        	if (i < 10){ i = '0'+i;}
				            $("#tbirth1").append("<option value='"+ i +"'>"+ i + "</option>");
				        }
				        // 일 
				        $("#tbirth2").append("<option value=''>일 ---</option>");
				        for(var i = 1; i <= 31; i++){
				        	if (i < 10){ i = '0'+i;}
				            $("#tbirth2").append("<option value='"+ i +"'>"+ i + "</option>");
				        }
				        //메인으로
				        $(document).on('click', '#main', function(){
							location.href="index.jsp";
						});
												
						
						//폼태그 데이터 콘트롤러에 보내기
						$(document).on("click", "#btn", function(){
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

	body {
		background-image: url('/semi-project/img/img_main/main.jpg');
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

	/* 입력 창을 센터로 정렬합니다 */
	#memForm {
		display: inline-block;
		margin-top: 50px;
	}

</style>  
</head>
<body>
	<h3><font size="5" style="color:blue;" aline="center"> 토트넘 회원가입</font></h3>
	<hr>
	<div>
		<form name="memForm" id="memForm" >
			<table>
				<tr>
					<td colspan="2" align="center">
						<font size="4" style="color:blue;"> 토트넘 회원가입서</font>
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
						<input type="button" name="tidbtn" id="tidbtn" value="아이디중복확인"  />
					</td>
				</tr>
								
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="password" class="imf" name="tpw" placeholder="비밀번호 8자리" style="width:100px" maxlength="8"/>
						
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
					<td>성별</td>
					<td> 
						<input type="radio" name="tgender" id="tgender_m" value="M" checked/> 남자
						<input type="radio" name="tgender" id="tgender_f" value="F"  /> 여자					    
					</td>
				</tr>
				
				<tr>
					<td>생년월일</td>
					<td>		
						<input type="text" name="tbirth" id=tbirth 
						       placeholder="년(4자)" maxlength="4" style="width:50px"/>
						<select name="tbirth1" id="tbirth1"></select>
					       <select name="tbirth2" id="tbirth2"></select>
					</td>
				</tr>
				
				<tr>
					<td>이메일</td>
					<td>		
						<input type="text" name="temail" id=temail style="width:100px" />
						@ <input type="text" name="temail1" id=temail1 style="width:100px" placeholder="직접입력" />
						  <select name="temail2" id="temail2" style="width:100px;margin-right:10px">
					       	 <option value="1" selected>직접입력</option>
					      		 <option value="naver.com">naver.com</option>	       	   
					     		 <option value="gmail.com">gmail.com</option>
					     		 <option value="daum.net">daum.net</option>	       	   
					        </select>
					</td>
				</tr>
				
				<tr>	 
					<td>선호선수</td>
					<td> 
						<input type="checkbox" name="thobby" value="th1" />손흥민		      
					    <input type="checkbox" name="thobby" value="th2" />벤 데이비스
					    <input type="checkbox" name="thobby" value="th3" />피에르 호이비에르
					    <input type="checkbox" name="thobby" value="th4" />티모 베르너<br>
					    <input type="checkbox" name="thobby" value="th5" />제임스 메디슨
					    <input type="checkbox" name="thobby" value="th6" />로드리고 벤탕쿠르		      
					    <input type="checkbox" name="thobby" value="th7" />크리스티안 로메로
					    <input type="checkbox" name="thobby" value="th8" />히샬리송<br>
					    <input type="checkbox" name="thobby" value="th9" />라두 드라구신
					    <input type="checkbox" name="thobby" value="th10" />프레이저 포스터
				   </td>
				</tr>	 
				
				
				
				
				<tr>
					<td colspan="2">
					<button type="button" id="btn">확인</button>
					<button type="reset">다시</button>
					<input type="button" id="main" value="메인으로">
					</td>					
				</tr>
				
				
				
			</table>
		
		</form>
	</div>

</body>
</html>