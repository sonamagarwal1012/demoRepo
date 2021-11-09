public class email1 {
    public pagereference show(){
    messaging.SingleEmailMessage msg=new messaging.SingleEmailMessage();
    string[] s=new string[] {'sonamagarwal9194@gmail.com'};
        msg.setToAddresses(s);
    string[] s1=new string[] {'abc@xyz.com'};
        msg.setCcAddresses(s1);
        msg.setsubject('test');
        msg.setplaintextbody('hi sonam');
        msg.sethtmlbody('<H1> THIS is sonam agarwal page</H1>');
        messaging.sendemail(new messaging.SingleEmailMessage[]{msg});
        return null;
}
}