trigger TransferContacts on Account (after update) {
   Set<Id> Id1 = new Set<Id>();
   Map<Id, String> old = new Map<Id, String>();
   Map<Id, String> new1 = new Map<Id, String>();
   List<Contact> con = new List<Contact>();
    for (Account a : Trigger.new)
 {
        if (a.OwnerId != Trigger.oldMap.get(a.Id).OwnerId)
         {
        old.put(a.Id, Trigger.oldMap.get(a.Id).OwnerId);
        new1.put(a.Id, a.OwnerId);
        Id1.add(a.Id);
 }

      }
         if (!Id1.isEmpty()) {
for (Account acc : [SELECT Id, (SELECT Id, OwnerId FROM Contacts) FROM Account WHERE Id in :Id1])
           {
   String new2 = new1.get(acc.Id);
   String old1 = old.get(acc.Id);
        for (Contact c : acc.Contacts)
            {
            if (c.OwnerId == old1)
            {  
                Contact c1 = new Contact(Id = c.Id, OwnerId = new2);  
             con.add(c1);
             }
 }
 }
 }
   update con;
        }