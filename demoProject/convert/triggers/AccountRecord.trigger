trigger AccountRecord on Account (before update,before delete) {
list<contact> con=new list<contact>();
if(trigger.isBefore && trigger.isUpdate){
for(account a:trigger.new){
list<contact> c=[select id,phone from contact where accountid=:a.id];
for(contact c2:c){
c2.phone=a.phone;
con.add(c2);
}
}
}
update con;
list<contact> con1=new list<contact>();
if(trigger.isbefore && trigger.isDelete){
for(account a1:trigger.old){
list<contact> c3=[select id from contact where accountid=:a1.id];
delete c3;
}
}

}