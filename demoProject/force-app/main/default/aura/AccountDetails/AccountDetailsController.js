({
	doInit : function(component, event, helper) {
        
        var actionPlan = component.get("c.getDetails");
         actionPlan.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.acrWrapper", response.getReturnValue() );
               }
             
             debugger;
             var acrWrapper=component.get("v.acrWrapper");
             var acrAccountChildWrapper=acrWrapper.lstAccountChild;
              var acrBillingChildWrapper=acrWrapper.lstBillingChild;
             var acrChild=JSON.stringify(acrAccountChildWrapper);
              if(acrAccountChildWrapper[0].sms==true || acrAccountChildWrapper[0].voice==true )
                 {
                   component.set("v.AccountUpdates",true);
                 }
           
             for(var i=1;i<acrAccountChildWrapper.length;i++){
               
                 if(acrAccountChildWrapper[i].email==true || acrAccountChildWrapper[i].sms==true || acrAccountChildWrapper[i].voice==true )
                 {
                   component.set("v.AccountUpdates",true);
                 }
              
              
             }
                         for(var i=0;i<acrBillingChildWrapper.length;i++){
               
                 if(acrBillingChildWrapper[i].email==true || acrBillingChildWrapper[i].sms==true || acrBillingChildWrapper[i].voice==true )
                 {
                   component.set("v.BillingUpdates",true);
                 }
              
              
             }
             }); 
        $A.enqueueAction(actionPlan);
    },
    handleEditClick:function(component, event, helper) {
        
        component.set("v.isDisabled",false);
        component.set("v.buttonSelected",true);
    },
    handleCancelClick :function(component, event, helper) {
        
        component.set("v.isDisabled",true);
        component.set("v.buttonSelected",false);
    },
    
    onClickOfSMSAndVoice :function(component, event, helper) {
        debugger;
        var paramName = event.getSource().get("v.value");
        var tempList = paramName.split('#');
        
        var field = tempList[1];
        var acrWrapper=component.get("v.acrWrapper");
        var lstBiilingChildWrapper=acrWrapper.lstBillingChild;
         var selected = event.getSource().get("v.checked");
        for(var i=0;i<lstBiilingChildWrapper.length;i++){
            debugger;
            if(lstBiilingChildWrapper[i].fieldName==tempList[0]){
                if(field =='SMS' && selected==true && lstBiilingChildWrapper[i].voice==true)
                   lstBiilingChildWrapper[i].voice=false;
                if(field =='Voice'  && lstBiilingChildWrapper[i].sms==true && selected==true)
                   lstBiilingChildWrapper[i].sms=false;
            }
        }
        acrWrapper.lstBillingChild = lstBiilingChildWrapper;
        component.set("v.acrWrapper",acrWrapper);
		
        
        /*debugger;
        var indexAndName = event.getSource().get("v.name");
        var tempList = indexAndName.split('#');
        var index = parseInt(tempList[0], 10);
        var field = tempList[1];
         console.log('index->'+index);
         console.log('field->'+field);
        alert('==='+index);
        alert('===1'+field);
        var selected = event.getSource().get("v.checked");
        
        var accountList = component.get("v.acrWrapper");
        var accountBiling = JSON.stringify(accountList.lstBillingChild);
        console.log('account billing before-->'+JSON.stringify(accountBiling));
        //var getAuraId = component.find("toggleSMSAndVoice");
       
        var Email = accountBiling[index].email;
        var sms = accountBiling[index].sms;
        var voice = accountBiling[index].voice;
        var selectedID = event.getSource().getLocalId();
        console.log('Email->'+Email);
        console.log('sms->'+sms);
        console.log('voice->'+voice);
        if(sms != false && voice != false){
            if(!sms){
                accountBiling[index].sms = true;
            }
            else{
                accountBiling[index].sms = false;
            }
            if(!voice){
                accountBiling[index].voice = true;
            }
            else{
                accountBiling[index].voice = false;
            }
        }
        else{
            if(selected){
                accountBiling[index].field = false;
            }
            else{
                accountBiling[index].field = true;
            }
        }
        accountList.lstBillingChild = accountBiling;
        component.set("v.acrWrapper",accountList);
        console.log('account billing after-->'+JSON.stringify(accountBiling));
        */
    },
    saveAccountDetails :function(component, event, helper) {
    //if (helper.requiredValidation(component, event)){
    debugger;
            var acrWrapper=component.get("v.acrWrapper");
        var acrChildWrapper=acrWrapper.lstAccountChild;
        var acrBillingChildWrapper=acrWrapper.lstBillingChild;
        var formValid = true;
        
        for(var i=0;i<acrChildWrapper.length;i++){
            if(acrChildWrapper[i].sms==true && acrChildWrapper[i].voice==true){
                component.set("v.isOpen", true);
                formValid = false;
                return;
            }
        }
        for(var i=0;i<acrBillingChildWrapper.length;i++){
            if(acrBillingChildWrapper[i].sms==true && acrBillingChildWrapper[i].voice==true){
                component.set("v.isOpen", true);
                formValid = false;
                return;
            }
        }
         for(var i=0;i<acrChildWrapper.length;i++){
            if(acrChildWrapper[i].sms==true && acrChildWrapper[i].voice==true){
                component.set("v.isOpen", true);
                formValid = false;
                return;
            }
        }
        component.set("v.toggleSpinner", true);

               var action = component.get("c.saveACRDetails");
        	var acrChild=JSON.stringify(component.get("v.acrWrapper"));
                  action.setParams({
                    'acrWrapper': acrChild
                  });
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (state == "SUCCESS") {
                    var storeResponse = response.getReturnValue();
                    component.set("v.toggleSpinner", false);
                    //component.set("v.isSuccessful", true);
                    component.set("v.acrWrapper", storeResponse);
                    
                }
                var acrWrapper=component.get("v.acrWrapper");
             var acrAccountChildWrapper=acrWrapper.lstAccountChild;
              var acrBillingChildWrapper=acrWrapper.lstBillingChild;
             var acrChild=JSON.stringify(acrAccountChildWrapper);
              if(acrAccountChildWrapper[0].sms==true || acrAccountChildWrapper[0].voice==true )
                 {
                   component.set("v.AccountUpdates",true);
                 }
           
             for(var i=1;i<acrAccountChildWrapper.length;i++){
               
                 if(acrAccountChildWrapper[i].email==true || acrAccountChildWrapper[i].sms==true || acrAccountChildWrapper[i].voice==true )
                 {
                   component.set("v.AccountUpdates",true);
                 }
              
              
             }
                         for(var i=0;i<acrBillingChildWrapper.length;i++){
               
                 if(acrBillingChildWrapper[i].email==true || acrBillingChildWrapper[i].sms==true || acrBillingChildWrapper[i].voice==true )
                 {
                   component.set("v.BillingUpdates",true);
                 }
              
              
             }
            });
            $A.enqueueAction(action);
       // } 
    
},
    closeModel:function(component, event, helper) {
        component.set("v.isOpen", false);
    },
  
})