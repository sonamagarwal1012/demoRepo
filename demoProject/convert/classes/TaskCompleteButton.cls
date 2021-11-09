public class TaskCompleteButton {
     public final task t2;
    public TaskCompleteButton(apexpages.StandardController controller){
       id t1=apexpages.currentPage().getparameters().get('id');
         t2=[select id,status,subject from task where id=:t1];
        t2.Status='Completed';
        t2.subject='Completed';
    }
    public pagereference Complete(){
         update t2;
      PageReference pf = new ApexPages.StandardController(t2).view();
      pf.setRedirect(true);
return pf;
    }
}