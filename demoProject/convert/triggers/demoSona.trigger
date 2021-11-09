trigger demoSona on Account (before update,before delete) {
    
list<contact> C1=new list<contact>();
    if(trigger.isbefore && trigger.isupdate){
    for(account a:trigger.new){
        list<contact> c=[select id,lastname,phone from contact where accountid=:a.id];
        for(contact c2:c){
        c2.phone=a.phone;
        C1.add(c2);
    }
    }
    update C1;
    }
    if (trigger.isbefore && trigger.isdelete){
        for(account a:trigger.old){
            list<contact> C3=[select id,lastname from contact where accountid=:a.id];
            delete C3;
        }
    }
}