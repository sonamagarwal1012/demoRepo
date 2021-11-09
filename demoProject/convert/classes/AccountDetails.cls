public class AccountDetails 
{
    @AuraEnabled
    public static ParentWrapper getDetails()

    {
        //changes
        string parentChild='';
        /*contact objCon=[select id from contact where id in(select contactid from user where id=userInfo.getUserId())];
        account objAcc=[select id,parentid from account where id in(select last_active_account__c from contact where id =:objCon.id)];
        if(objAcc.parentid==''|| objAcc.parentId==null)
            string parentChild='Parent';
            else
                string parentChild='Child';*/
        
        //String parentChild='Parent';
        parentChild='Parent';
		
		list<Account_Details__mdt> lstMetaData = [select id,MasterLabel,API_Name__c,Section_Label__c,Section_Type__c,Default_Email__c,Parent_Child__c from Account_Details__mdt
												 order by MasterLabel];
												 
        for(AccountContactRelation objAcr : [select id,A_disconnect_notice_is_issued__c,Important_account_updates_Occur__c,Important_Payment_Updates__c,
                                             Open_Service_Requests_Completed__c,Open_Service_Requests_Updated__c,Your_payment_has_been_processed__c,
                                             Your_payment_has_been_returned__c,account.ParentId from accountcontactrelation where accountid='0010K00001ywDoq' 
                                             and contactid='0032800000beEC5'])
        {
			list<childWrapper> lstAccountChild = new list<childWrapper>();
            list<childWrapper> lstBillingChild = new list<childWrapper>();
			
			for(Account_Details__mdt objMetaData : lstMetaData)
			{
				string response = '';
				response = string.valueOf(objAcr.get(objMetaData.API_Name__c));
				
				if(objMetaData.Section_Type__c=='Account')
				{
					childWrapper objChild = new childWrapper(objMetaData.Section_Label__c,objMetaData.API_Name__c);
					
					if(response!=null && response.contains('Email'))
						objChild.email = true;
					if(response!=null && response.contains('Voice'))
						objChild.voice = true;
					if(response!=null && response.contains('SMS'))
						objChild.sms = true;
					if(objMetaData.Default_Email__c == true)
                        objChild.email = true;
                    
					if((objAcr.account.ParentId!=null && (objMetaData.Parent_Child__c=='Child' || objMetaData.Parent_Child__c=='Both')) ||
						(objAcr.account.ParentId==null && (objMetaData.Parent_Child__c=='Parent' || objMetaData.Parent_Child__c=='Both')))
						lstAccountChild.add(objChild);
				}
				
				if(objMetaData.Section_Type__c=='Billing')
				{
					childWrapper objChild = new childWrapper(objMetaData.Section_Label__c,objMetaData.API_Name__c);
					
					if(response!=null && response.contains('Email'))
						objChild.email = true;
					if(response!=null && response.contains('Voice'))
						objChild.voice = true;
					if(response!=null && response.contains('SMS'))
						objChild.sms = true;
					if((objAcr.account.ParentId!=null && (objMetaData.Parent_Child__c=='Child' || objMetaData.Parent_Child__c=='Both')) ||
						(objAcr.account.ParentId==null && (objMetaData.Parent_Child__c=='Parent' || objMetaData.Parent_Child__c=='Both')))
						lstBillingChild.add(objChild);
				}
			}
			
            ParentWrapper objParent = new ParentWrapper(objAcr,lstAccountChild, lstBillingChild);
            return objParent ;
        }
        return null;
    }
    
@AuraEnabled
    public static ParentWrapper saveACRDetails(string acrWrapper) {
        
        ParentWrapper objParent = (ParentWrapper)JSON.deserialize(acrWrapper, ParentWrapper.class);
        list<childWrapper> lstAccountChild = new list<childWrapper>();
        list<childWrapper> lstBillingChild = new list<childWrapper>();
        lstAccountChild=objParent.lstAccountChild;
        lstBillingChild=objParent.lstBillingChild;
        accountContactRelation objACR=objParent.objACR;
        
        for(childWrapper obj : lstAccountChild)
        {
            if(obj.email==true && obj.voice==false && obj.sms==false)
            objACR.put(obj.fieldAPIName,'Email');
        /*if(lstAccountChild[0].email==false && lstAccountChild[0].voice==true && lstAccountChild[0].sms==false)
            objACR.Important_account_updates_Occur__c='Voice';
         if(lstAccountChild[0].email==false && lstAccountChild[0].voice==false && lstAccountChild[0].sms==true)
            objACR.Important_account_updates_Occur__c='SMS';*/
        if(obj.email==true && obj.voice==true && obj.sms==false)
            objACR.put(obj.fieldAPIName,'Email & Voice');
        if(obj.email==true && obj.voice==false && obj.sms==true)
            objACR.put(obj.fieldAPIName,'Email & SMS');
        }
         
        update objACR;
       
        return objParent;
    }   
	
    public class ParentWrapper
    {
        @AuraEnabled
        public AccountContactRelation objACR {get; set;}
        @AuraEnabled
        public list<childWrapper> lstAccountChild{ get; set;}
        @AuraEnabled
        public list<childWrapper> lstBillingChild{ get; set;}
        
        public ParentWrapper(AccountContactRelation acr, list<childWrapper> child, list<childWrapper> child1)
        {
            objACR = acr;
            lstAccountChild= child;
            lstBillingChild=child1;
        }
    }
    
    
    public class childWrapper
    {
        @AuraEnabled
        public string fieldName{get;set;}
        @AuraEnabled
        public string fieldAPIName{get;set;}
        @AuraEnabled
        public boolean email{get;set;}
        @AuraEnabled
        public boolean voice{get;set;}
        @AuraEnabled
        public boolean sms{get;set;}
        
        
        public childWrapper(string name,string APIName)
        {
            
            fieldName = name;
            fieldAPIName=APIName;
            email = false;
            voice = false;
            sms = false;
            
           
            
        }
    }
    
}