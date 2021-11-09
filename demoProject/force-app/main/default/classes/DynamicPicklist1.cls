public class DynamicPicklist1 {
list<selectOption> O1=new List<selectOption>();
    public list<selectOption> getName(){
        list<account> a1=[select id,name from account ];
        for(account a2:a1){
        O1.add(new selectOption(a2.name,a2.name));
    }
    
    return O1;
    }
}