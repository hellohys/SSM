import org.junit.Test;
import java.util.LinkedList;
import java.util.Queue;

/**
 * @author hys
 * @create 2022-07-10
 * @project_name SSM
 */
public class QueueTest{
    String str=new String("hello");
    char[]ch={'a','b'};
    public static void main(String args[]){
        QueueTest ex=new QueueTest();
        ex.change(ex.str,ex.ch);
        System.out.print(ex.str+" and ");
        System.out.print(ex.ch);
    }
    public void change(String str,char ch[]){
        str="test ok";
        char[] ch1 = {'c'};
        ch= ch1;
    }
}


