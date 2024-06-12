package a.b.c.common;

public class CodeUtil {
	
	//성별 라벨
	public static final String[] gender_value= {"남자","여자"};
	
	//생년월일
	public static String birth(String s) {
			
		String s0 ="";
		String s1 ="";
		String s2 ="";
		String ss ="";
		
		if(s !=null&& s.length() >0) {
								int sLen = s.length();
								if(8 == sLen) {
												s0= s.substring(0,4);
												s1= s.substring(4,6);
												s2= s.substring(6);
												ss= s0 + "-" + s1 + "-" + s2;
												
								}
			
		}
		
		return ss;
	}
	
	//성별
	public static String gender(String s) {
					return "M".equals(s.toUpperCase()) ? "남자" : "여자";
		
	}
	
	public static void main (String args[]) {
		
		//생년월일
		String b = CodeUtil.birth("20210801");
		System.out.println("b >>> :" +b);
		
		//성별
		String g = CodeUtil.gender("02");
		System.out.println("g >>> :" + g);
		
		
	}

}
