public class email3 {
account acc;
    public string myname{get;set;}
    public email3(){
    acc=[select id,name from account limit 1];
}
    public pagereference show(){
        messaging.SingleEmailMessage mymail=new messaging.SingleEmailMessage();
        messaging.emailfileattachment email=new messaging.EmailFileAttachment();
        pagereference pdf=page.pdfattachment;
        pdf.getparameters().put('id',(string)acc.id);
        blob b=pdf.getcontent();
        email.setfilename('attachment.pdf');
        email.setbody(b);
        mymail.setplaintextbody('please find the attachment');
         string[] s=new string[] {'sonamagarwal9194@gmail.com'};
        mymail.setToAddresses(s);
        mymail.setfileattachments(new messaging.emailfileattachment[]{email});
        messaging.sendemail(new messaging.email[]{mymail});
        
            
        
        return null;
}
}