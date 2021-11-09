trigger AccountTrigger on account(after insert){
    set<String> setOfPhoneNumbers= new set<String>();
    list<Contact> conLst = new list<Contact>();
    for(account accObj:trigger.new){
        if(accObj.phone !=null){
            setOfPhoneNumbers.add(accObj.phone);
        }
    }
    if(setOfPhoneNumbers.size()>0){
        for(contact conObj : [select id,title,phone from contact where phone !='']){
            if(setOfPhoneNumbers.contains(conObj.phone)){
                conObj.title='PRIMARY CONTACT - '+conObj.title;
                conLst.add(conObj);
            }
        }
    }
    if(conLst.size()>0){
        update conLst;
    }
}