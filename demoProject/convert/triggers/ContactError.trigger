trigger ContactError on Contact (before insert) {
set<id> s1=new set<id>();
for(contact con:trigger.new){
s1.add(con.accountid);
}
map<id,account> m1=new map<id,account>([select phone from account where id in:s1]);
for(contact c1:trigger.new){
    account a=m1.get(c1.accountid);
if(a.phone==null){
c1.adderror('account can not be created');
}
}
}