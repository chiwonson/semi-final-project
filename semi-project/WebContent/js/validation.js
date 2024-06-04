/**
 * 
 */

function pwValidation (sV){
	
	alert("sV >>> : " + sV);
	var bool = false;
		
	var nCnt = 0;		// 패스워드 전체 길이
	var nCnt_A = 0;		// 대문자
	var nCnt_a = 0;		// 소문자
	var nCnt_x = 0;		// 특수 기호
	var nCnt_n = 0;		// 숫자
	
	if (sV != null && sV.length > 0) {
		
		var sVlen = sV.length;
		console.log("sVlen >>> : " + sVlen);
		
		// 길이 체크
		if (8 <= sVlen && sVlen <= 12) {
			console.log("if 문 >>> : " + sV);
			
			for (var i=0; i < sVlen; i++) {
				
				var cS = sV.charCodeAt(i);			
				console.log("cS_10 >>> : " + cS);
				cS = cS.toString(16);
				console.log("cS_16 >>> : " + cS);
				cS = "0x" + cS
				console.log("0x_cS_16 >>> : " + cS);
				
				// 대문자 체크
				if (0x41 <= cS && cS <= 0x5A) {
					nCnt_A++;
				}else{}
				
				// 소문자 체크
				if (0x61 <= cS && cS <= 0x7A) {
					nCnt_a++;
				}else{}
				
				// 특수 기호 체크
				// ! : 21, " : 22, # : 23, $ : 24, % : 25, & : 26, ' : 27
				if (0x21 <= cS && cS <= 0x27) {
					nCnt_x++;
				}else{}
				
				// 숫자 체크
				if (0x30 <= cS && cS <= 0x39) {
					nCnt_n++;					
					console.log("nCnt_n >>> : " + nCnt_n);
				}else{}
				
				nCnt++;
			}
			
			console.log("nCnt >>> : " + nCnt);
			console.log("nCnt_A >>> : " + nCnt_A);
			console.log("nCnt_a >>> : " + nCnt_a);
			console.log("nCnt_x >>> : " + nCnt_x);
			console.log("nCnt_n >>> : " + nCnt_n);
		}else {
			console.log("데이터 길이가 >>> : ");
		}
	}else {
		console.log("데이터가 있어야 >>> : ");
	}
	
	
	

	
	return bool;
	
}