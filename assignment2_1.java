import java.util.Scanner;

public class assignment2_1 {
	public static void main(String args[])
	{
		int cnt[] = new int[26]; // �ҹ���
		int cnt2[] = new int[26]; // �빮��
		
		Scanner scan = new Scanner(System.in);
		String str;
		
		System.out.print("������ �Է��ϼ���: ");
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
		
		System.out.println("�ҹ��� ������ ��");
		for(int i = 0; i<26; i++) {
			if(cnt[i] > 1) {
				System.out.println((char)(97+i) + " : " + cnt[i]);
			}
		}
		System.out.println("�빮�� ������ ��");
		for(int i = 0; i<26; i++) {
			if(cnt2[i] > 1) {
				System.out.println((char)(65+i) + " : " + cnt2[i]);
			}
		}
	}
}


