import java.util.Scanner;

public class Reverse {
		public static void main(String args[])
		{
			String message;
			Scanner scan = new Scanner(System.in);
			
			System.out.println("�Է��ϼ���:");
			message = scan.nextLine();
			
			for(int i = message.length()-1; i>=0; i--)
			{
				System.out.print(message.charAt(i));
			}
		}
}

