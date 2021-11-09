trigger CountofContact on Account (after insert) {
    list<contact> C=new list<contact>();
    for(account a:trigger.new){
    contact C1=new contact(lastname='bani',accountid=a.id);
        contact C2=new contact(lastname='gaurav',accountid=a.id);
        C.add(C1);
        C.add(C2);
    }
    insert C;
}