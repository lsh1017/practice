import java.util.Scanner;

public class assignment2_1 {
	public static void main(String args[])
	{
		int cnt[] = new int[26]; // 소문자
		int cnt2[] = new int[26]; // 대문자
		
		Scanner scan = new Scanner(System.in);
		String str;
		
		System.out.print("문장을 입력하세요: ");
		str = scan.nextLine();
		
		for(int i=0; i<str.length(); i++) {
			char ch = str.charAt(i);
			
			if(ch >= 'A' && ch <= 'Z') {
				cnt2[ch - 'A']++;
			}
			else if(ch>='a' && ch <= 'z') {
				cnt[ch-'a']++;
			}
		}
		
		System.out.println("소문자 문자의 수");
		for(int i = 0; i<26; i++) {
			if(cnt[i] > 1) {
				System.out.println((char)(97+i) + " : " + cnt[i]);
			}
		}
		System.out.println("대문자 문자의 수");
		for(int i = 0; i<26; i++) {
			if(cnt2[i] > 1) {
				System.out.println((char)(65+i) + " : " + cnt2[i]);
			}
		}
	}
}


