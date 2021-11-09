trigger deleteContact on Account (before insert) {
    for(account a:trigger.new){
    list<contact> a1=[select lastname from contact where lastname='a.name'];
        for(contact c1:a1)
        {
            delete c1;
        }

}
}