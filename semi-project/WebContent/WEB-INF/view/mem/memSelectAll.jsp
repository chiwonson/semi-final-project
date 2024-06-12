<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ page import="org.apache.log4j.LogManager" %>  
<%@ page import="org.apache.log4j.Logger" %>   

<%@page import="a.b.c.mem.vo.MemberVO"%>  
<%@page import="a.b.c.common.EncryptAES"%>   
<%@page import="a.b.c.common.CodeUtil"%>

<%@page import="java.util.ArrayList"%>
 
<% request.setCharacterEncoding("UTF-8");%>    
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("memSelectAll.jsp >>> : ");
%>

<%
	Object obj = request.getAttribute("listAll");
	if (obj == null) return;
	
	// 검색 조회후 설정된 값 유지용 데이터
	MemberVO search_tvo = (MemberVO)request.getAttribute("search_tvo");
	String searchFilter = search_tvo.getSearchFilter();
	String keyword = search_tvo.getKeyword();
	
	ArrayList<MemberVO> aList = (ArrayList<MemberVO>)obj;
	int nCnt = aList.size();
	System.out.println("조회건수 nCnt >>> : " + nCnt);
	
%>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원검색</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){	
		alert("jQuery ready() 함수 블럭 진입 >>> : ");
	
	//tnum
		$(document).on("click", "#tnum", function(){
	
		if($(this).prop('checked')){
							$('.tnum').prop('check',false);
							$(this).prop('checked',true);
		}
	});
	
	//검색버튼
	$(document).on("click", "#searchBtn", function(){
				alert("searchBtn >>> : ");
				$("#memFormAll").attr({"method" : "GET"
									  ,"action": "memSelectAll.t"	
				}).submit();
	});
	
	var searchFilter = "<%=searchFilter%>";
	var keyword ="<%=keyword%>";
	
	if(searchFilter==null||searchFilter=="null"||searcFilter==""){
			$("#searchFilter").val("key1");
		}else{
			$("#searchFilter").val(searchFilter);
		}
		if(keyword==null || keyword=="null" || keyword==""){
			$("#keyword").val("");
		}else{
			$("#keyword").val(keyword);	
	}
	
		//검색버튼 ===
		
		//I
		$(document).on("click", "#I", function(){
			//alert("I >>> : ");
			location.href="memForm.t";
		});
		
		// SALL
		$(document).on("click", "#SALL", function(){			
			location.href="memSelectAll.t";		
		});
		//메인으로
        $(document).on('click', '#main', function(){
			location.href="index.jsp";
	
		});
});
	
</script>
<style>
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
	#memFormAll {
		display: inline-block;
		margin-top: 50px;
	}
	

</style>

</head>
<body>
	<h3>회원검색</h3>
	<hr>
	<div>
		<form name="memFormAll" id="memFormAll">
			<table>
				<thead>
					<tr>
						<td colspan="10" align="center">
							<h3>회원정보</h3>
							<%= "조회건수 ::: " +nCnt  %>							
						</td>
					</tr>
<!-- 검색 루틴 =====================-->		
					<tr>
						<td colspan="10" style="texe-align:left;">
						<select id="searchFilter" name="searchFilter">
							<option value="key1" selected >전체 --------</option>
							<option value="key1"  >회원번호 </option>
							<option value="key1"  >이름</option>
							<option value="key1"  >아이디 </option>
						</select>
						<label for="keyword">검색어</label>
						<input type="text" id="keyword" name="keyword" size="15" placeholder="검색어 입력"><br>
						&nbsp;&nbsp;
						<button type="button" id="searchBtn">검색</button>
						<button type="reset" id="resetsBtn">리셋</button>
						<input type="button" id="main" value="메인으로">
						</td>
					</tr>
<!-- 검색 루틴 ======================= -->
					<tr>
						<th><input type="checkbox" name="chkAll" id="chkAll"></th>
						<th>회원번호</th>
						<th>이름</th>
						<th>아이디</th>
						<th>성별</th>
						<th>이메일</th>
						<th>사진</th>
					</tr>
				</thead>
				<%
					for(int i=0; i<nCnt; i++){
											MemberVO tvo= (MemberVO)aList.get(i);

				%>
				<tbody>
					<tr>
						<td>
							<input type="checkbox" class="mnum" name="mnum" id="mnum" value=<%= tvo.getTnum() %>>
						</td>		
						<td><%= tvo.getTnum() %> </td>
						<td><%= tvo.getTname() %> </td>
						<td><%= tvo.getTid() %> </td>
						<td><%= CodeUtil.gender(tvo.getTgender()) %> </td>
						<td><%= tvo.getTemail() %> </td>	
						<td><img src="/semi-project/fileupload/mem/<%= tvo.getTphoto() %>" border="1" width="50" height="50" alt="image"></td>		
					</tr>				
					<%
						}//end of if
					%>						
				
			
			</table>
		</form>
	</div>

</body>
</html>