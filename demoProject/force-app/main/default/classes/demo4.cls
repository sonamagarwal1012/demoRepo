public class demo4 {
    public void pos(){
position__c p1=new position__c(Name='Software enginner', Job_Description__c='Software engineer');
position__c p2=new position__c(Name='Teacher', Job_Description__c='Teaching');
position__c p3=new position__c(Name='Administrator', Job_Description__c='Admin');

List<position__c> listPos=new List<position__c>();
listPos.add(p1);
listPos.add(p2);
listPos.add(p3);
insert listPos;
        listpos.set(1,p3);
        listpos.clear();
        

for(position__c p4:listPos)
{
    system.debug(p4.Name);
    
}
}
}