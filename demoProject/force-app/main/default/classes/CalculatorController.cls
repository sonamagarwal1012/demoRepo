public class CalculatorController {
    integer num1,num2,result;
    public integer getNum1(){
        return num1;
    }
    public integer getNum2(){
        return num2;
    }
    public integer getResult(){
        return result;
    }
    public void setNum1(integer n1){
        num1=n1;
    }
    public void setNum2(integer n2){
        num2=n2;
    }
    public PageReference add(){
        result=num1+num2;
        return null;
    }
    public PageReference sub(){
        result=num1-num2;
        return null;
    }
    public PageReference Mul(){
        result=num1*num2;
        return null;
    }
    public PageReference div(){
        result=num1/num2;
        return null;
    }
}