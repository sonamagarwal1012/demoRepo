public class TvRemoteControl {
integer volume;
    static final integer maxVolume=50;
    public TvRemoteControl(integer v){
        volume=v;
}
    public integer increaseVolume(integer amount){
        volume+=amount;
            if(volume>maxVolume){
                volume=maxVolume;
            }
        return Volume;
    }
     public integer decreaseVolume(integer amount){
        volume-=amount;
            if(volume<0){
                volume=0;
            }
        return Volume;
    }
}