({
	handleClick : function(component, event, helper) {
		var btnclicked=event.getSource();
        var btnMessage=btnclicked.get("v.label");
        console.log("handleClick2: Message: " + newMessage);
        component.set("sonam",btnMessage);
	}
})