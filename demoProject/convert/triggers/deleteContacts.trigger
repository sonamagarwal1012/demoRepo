trigger deleteContacts on Account (before insert) {
list<string> a=new list<string>();
    for(account a1:trigger.new)
    {
       a.add(a1.name);
         }
    list<contact> contacts=[select id,name from contact where name in:a];
    delete contacts;
}