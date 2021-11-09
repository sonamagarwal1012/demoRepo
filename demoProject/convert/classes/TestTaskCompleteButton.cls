@istest
public class TestTaskCompleteButton {
    static testmethod void taskCompleteBtn(){
      task t1=new task(subject='test');
        insert t1;
        
        ApexPages.currentPage().getParameters().put('id',t1.id);

        
        apexpages.StandardController sc=new apexpages.StandardController(t1);
        taskcompleteButton tc=new taskCompleteButton(sc);
        
        tc.complete();
        
        
        
    }
}