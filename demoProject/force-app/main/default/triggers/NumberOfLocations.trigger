trigger NumberOfLocations on Account (after insert) {
    map<id,decimal> m1=new map<id,decimal>();
    set<id> s1=new set<id>();
    list<contact> con=new list<contact>();
    for(account a:trigger.new){
        m1.put(a.id,a.No_Of_Locations__c);
        s1.add(a.id);
        }
list<account> a1=[select id,No_Of_Locations__c from account where id IN :s1];
    for(account a2:a1){
        for(integer i=0;i<=a2.No_Of_Locations__c;i++){
            contact c=new contact();
            c.lastname='contact'+i;
            c.accountid=a2.id;
            con.add(c);
            
        }
    }
    insert con;
}