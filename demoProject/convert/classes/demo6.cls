public class demo6{
    public void accountMap(){
        Id i1='1234';
        Id i2='5678';
        Id i3='2986';
account a1= new account(id='i1',Name='abc');
    account a2= new account(id='i2',Name='def');
        account a3= new account(id='i3',Name='efg');
        
        Map<Id,account> m1=new Map<Id,account>();
        m1.put(a1.id,a1);
        m1.put(a2.id,a2);
        m1.put(a3.id,a3);
        system.debug(m1);
    }
           

}