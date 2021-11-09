public class email2 {
public final list<id> contactids;
    public list<contact> con;
    public email2(apexpages.standardcontroller controller){
        con=[select id from contact limit 250];
        for(integer i=0;i<=250;i++){
            contactids.add(con[i].id);
        }
    }
    public pagereference sendemail(){
        messaging.MassEmailMessage msg=new messaging.MassEmailMessage();
        msg.setTargetObjectIds(contactids);
        messaging.sendemail(new messaging.MassEmailMessage[]{msg});
        
        return null;
    }
}