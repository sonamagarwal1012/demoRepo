({
	
    doInit  : function(component, event, helper) {
		var action = component.get("c.getItems");
        action.setCallback(this, function(response){
            var state = response.getState();
           
            if (component.isValid() && state === "SUCCESS") {
           
               
                component.set("v.items", response.getReturnValue());
                 
            }
        });
        
        $A.enqueueAction(action);
	},
    
    CreateCamping : function(component, event, helper){
        
        helper.validateFields (component,component.find("name"));
        helper.validateFields (component,component.find("Price"));
        helper.validateFields (component,component.find("Quantity"));
        if(component.get("v.er") === false)
        {     
            //Here I removed the lines and shifted the code to the helperJs       
            console.log('Before:'+Items);            
            helper.createItem(component,Item);             
             console.log('After:'+Items);                    
        }
	}  ,
    handleAddItem : function(component, event, helper){
        var newItem = event.getParam("item");
          var action = component.get("c.saveItem");
        action.setParams(item:newItem);
        action.setCallback(this.function(response){
                    var state=response.getState();
        if(state=='SUCCESS'){
            var items = component.get("v.items");
                items.push(response.getReturnValue());
                component.set("v.items", items);
        }
                           })
    },
})