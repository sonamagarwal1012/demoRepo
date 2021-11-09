global class iterable implements iterator<account>{
public list<account> acc;
    integer i;
    public iterable(){
        acc=[select id,name from account];
        i=0;
    }
    public boolean hasNext(){
        if(i>acc.size()){
            return false;
        }
        else{
            return true;
        }
    }
    public account next(){
        if(i==0)
            return null;
            i++;
            return acc[i-1];
        
    }
}