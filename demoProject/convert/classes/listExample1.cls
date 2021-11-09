public class listExample1 {
    public list<student> result{get;set;}
    public listExample1(){
        result=new list<student>();
        student s1=new student('sonam',21);
        student s2=new student('riya',20);
        student s3=new student('sonia',25);
        result.add(s1);
        result.add(s2);
        result.add(s3);
    }
}