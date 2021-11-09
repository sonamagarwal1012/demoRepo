public class demo5 {
    public void accountMap(){
        id i1='1234';
        id i2='5678';
        id i3='2986';
account a1= new account(Name='abc');
    account a2= new account(Name='def');
        account a3= new account(Name='efg');
        
        Map<Id,account> m1=new Map<Id,account>();
        m1.put(i1,a1);
        m1.put(i2,a2);
        m1.put(i3,a3);
        system.debug(m1);
            
}
}