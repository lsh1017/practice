import java.util.Scanner;
// 입력된 문자열을 거꾸로 출력
public class Reverse {
		public static void main(String args[])
		{
			String message;
			Scanner scan = new Scanner(System.in);
			
			System.out.println("Please Enter String:");
			message = scan.nextLine();
			
			for(int i = message.length()-1; i>=0; i--)
			{
				System.out.print(message.charAt(i));
			}
		}
}

