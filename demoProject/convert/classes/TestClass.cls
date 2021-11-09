@istest
public class TestClass {
    public static testmethod void increaseVolume(){
        TvRemoteControl rc=new Tvremotecontrol(10);
        integer newVolume=rc.increaseVolume(30);
        system.assertequals(40,newVolume);
    }
    static testmethod void decreaseVolume(){
        TvRemoteControl rc=new Tvremotecontrol(10);
        integer newVolume=rc.increaseVolume(5);
        system.assertequals(5,newVolume);
    }
    static testmethod void minVolume(){
        TvRemoteControl rc=new Tvremotecontrol(10);
        integer newVolume=rc.increaseVolume(100);
        system.assertequals(0,newVolume);
    }
    static testmethod void maxVolume(){
        TvRemoteControl rc=new Tvremotecontrol(10);
        integer newVolume=rc.increaseVolume(60);
        system.assertequals(50,newVolume);
    }
}