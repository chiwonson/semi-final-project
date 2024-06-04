<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN FORM</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- 카카오 로그인 api  -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">

	//카카오 로그인=======================
	window.Kakao.init('5445c1b6dac2a182d0b050a46858cb01'); // 사용하려는 앱의 JavaScript 키 입력
	
	function kakaoLoginApi(){
						alert("kakaoLoginApi >>> : ");
						
						window.kakao.Auth.logtin({
										
							success: function(autoObj){
											
								// console.log( "authObj >>> : " + JSON.stringify(authObj));					
								window.Kakao.API.request({
					
								url: '/v2/user/me',
								
								success : function(res) {
									console.log( "res  >>> : " + JSON.stringify(res));                   
				                        
			                        let k_id = res.id;
			                        let k_email = res.kakao_account.email;
			                        let k_gender = res.kakao_account.gender;
			                        let k_nickname = res.properties.nickname;
			                        let k_profile_image = res.properties.profile_image;
			                    	 // let k_thumbnail_image = res.properties.thumbnail_image;
			                        
			                        console.log("k_id >>> : " + k_id);
			                        console.log("k_email >>> : " + k_email);
			                        console.log("k_gender >>> : " + k_gender);
			                        console.log("k_nickname >>> : " + k_nickname);
			                        console.log("k_profile_image >>> : " + k_profile_image);
			                        // console.log("k_thumbnail_image >>> : " + k_thumbnail_image);
			                        
			                        kakaoLogin(k_id, k_email);						
								}
							});				
						}
					});
				}
	
			function kakaoLogin(k_id, k_email){
				alert("kakaoLogin >>> : " + k_id + " : " + k_email);
				
				// Ajax 호출해서 로직 만들기 대신 자바스크립트 location 이용해보기  
				// 학생들은 코딩할 때는 Ajax 로 하기 
				location.href="/kosSpring/kakaoLogin.k?snstype=01&snsid="+k_id+"&snsemail="+k_email;							
			}
			//카카오 로그인 ================
					$(document).ready(function(){
			
			$("#mid").attr('placeholder', '아이디 ');
			$("#mpw").attr('placeholder', '비밀번호 ');
			
			$("#loginBtn").click(function(){
				console.log("loginBtn >>> : ");
				
				$('#loginForm').attr({
					'action':"loginCheck.k",
					'method':'POST',
					'enctype':'application/x-www-form-urlencoded'
				}).submit();
			});		
		});
</script>
	
<style type="text/css">
	
	.div1{
		background: cyan;
		border: 1px solid red;
		width: 300px;
		height: 300px;
		margin: 100px auto;	
	}
		
</style>
</head>
<body>
	<div class="div1">
		<h1 align="center">Login Test</h1>
		<hr>
		<form name="loginForm" id="loginForm">
			<table border="1" align="center">
				<tr>
					<td><input type="text" name="mid" id="mid" style="width:200px;"></td>
				</tr>
				
				<tr>
					<td><input type="password" name="mpw" id="mpw" style="width:200px;"></td>
				</tr>
				
				<tr>
					<td>
					<button type="button" id="loginBtn" style="width:208px; background-color: yellow;">로그인</button>
					</td>
				</tr>
				
				<tr>
					<td align="right">
					<a href="idFindForm.k"><font size="2">아이디찾기</font></a> | 
					<a href="pwFindForm.k"><font size="2">비밀번호찾기<font></a>
					</td>
				</tr>
				
				<tr>
					<td>
					<a href="javascript:kakaoLoginApi()">
					<img height="30" width="208" src="/semi-project/img/img_sns/o.jpg"/></a>
					</td>
				</tr>
				
				<tr>
					<td>
					<a href="<%= apiURL %>">
					<img height="30" width="208" src="/semi-project/img/img_sns/naver.PNG"/>
					</a>
					</td>
				</tr>
			</table> 
		</form>
	</div>

</body>
</html>