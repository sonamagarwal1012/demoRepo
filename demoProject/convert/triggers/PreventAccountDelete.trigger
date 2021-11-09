trigger PreventAccountDelete on Account (before delete) {
    for(account a1:trigger.old){
    a1.adderror('cant delete any account record');
}
}