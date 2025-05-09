public class Demo{
    public static void printoutput(Integer num1, Integer num2){
        Integer sum; 
        try {
            sum = num1 + num2;
        }
        catch (Exception ex){
            System.debug('catch statement is executed');
        }
        finally{
            System.debug('finally statement is executed');
            System.debug('Sum : '+sum);
        }
    }
}