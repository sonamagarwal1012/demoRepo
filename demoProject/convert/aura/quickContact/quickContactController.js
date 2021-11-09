({
	doInit : function(component, event, helper) {
		var action=component.get("c.getAccount");
        action.setparams({"accountid":component.get("v.recordId")});
        action.setCallback(this,function(reponse){
            var state=response.getState();
        if(state==="SUCCESS"){
            component.set("v.account",response.getreturnValue());
        }
        else{
            console.log('problem getting account,state:'+state);
        }
	});
        $A.enqueueAction(action);
},
    HandleSavecontact: function(component, event, helper) {
        var saveContactAction=component.get("c.getSavecontact");
        saveContactAction.setParams({"accountId":component.get("v.recordId"),
                                     "contact":component.get("v.newcontact")});
        savecontactaction.setCallback(this,function(response){
            var state=response.getstate();
            if(state==="SUCCESS"){
                var toastMassage=$A.get("e.force:showToast");
                toastMessage.setparams({"title":"contact saved",
                                        "message":"a new contact was created"});
                $A.get("e.force:quickCloseAction").fire();
                toastmessage.fire();
                $A.get("e.force:refreshView").fire();
            }
            if(state==="ERROR"){
                console.log('problem saving contact,response state:'+state);
            }
            else{
                console.log('unknown issue,response state:'+state);
                            
                            }
                  })
        $A.enqueueAction(saveContactAction);
    },
    HandleCancel : function(component, event, helper) {
    $A.get("e.force:closeQuickAction").fire();
}
})