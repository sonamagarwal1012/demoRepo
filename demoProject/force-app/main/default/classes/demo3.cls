public class demo3 {
    
public void greet(DayOfWeek d)
{
    if(d==DayOfWeek.Monday || d==DayOfWeek.Tuesday || d==DayOfWeek.Wednesday || d==DayOfWeek.Thursday)
        system.debug('boring week days');
    else if(d==DayOfWeek.Friday)
        system.debug('Weekend is about to come');
         else
        system.debug('Happy Weekend');
}


}