public class hello {

	public static int setRandomA(){
		int intValue = 0;

		while(true){
			intValue = (int)(Math.random() * (499999 - 1))+1;
			if(intValue >= 100000){
				break;
			}
		}

		intValue += 500000;

		return intValue;
	}

    public static void main(String[] args) {
        // Prints "Hello, World" to the terminal window.
        System.out.println("Hello, World");

        for(int i = 0; i< 10000; i++)
        {
        	System.out.println(setRandomA());
        }
    }

}