({
	packItem : function(component, event, helper) {
        var btn1=event.getSource();
        var btn2=btn1.getlabel();
        var a = component.get("v.item",true);
        a.Packed__c = true;
        component.set("v.item",a);
        btn.set("v.disabled",true);
        
		
	}
})