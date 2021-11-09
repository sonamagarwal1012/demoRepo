public class SelectOptions {
    string[] countries=new string[]{};
    list<selectOption> items;
    public pagereference test(){
        return null;
    }
    public string[] getcountries(){
        return countries;
    }
    public void setCountries(string[] countries){
        this.countries=countries;
    }
    public list<selectoption> getItems(){
        list<selectoption> options=new list<selectoption>();
        selectoption s1=new selectoption('india','INDIA');
        selectoption s2=new selectoption('canada','CANADA');
        selectoption s3=new selectoption('us','US');
        options.add(s1);
        options.add(s2);
        options.add(s3);
        return options;
    }
}