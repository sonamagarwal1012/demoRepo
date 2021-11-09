trigger AvoidLeadInsertion on Lead (before insert) {
for(Lead L1:trigger.new)
{
  list<Lead> L2=[select Email from lead where Email='contact.email'] ;
    if(L2.size()>0)
        {
            L1.Email.adderror('contact with Email is existing');
        }
        }
    
}