import { LightningElement ,wire} from 'lwc';
import getAccountList from '@salesforce/apex/lwcClass.getAccountList';
import getContacts from '@salesforce/apex/lwcClass.getContacts';
export default class Lwc extends LightningElement {
    columns=[
        {label:'First Name',fieldName:'FirstName'},
        {label:'Last Name',fieldName:'LastName'}
    ]
    @wire(getAccountList) accounts;
    accountId='';
    contacts;
    //@wire(getContacts,{accountId:'$accountId'}) contacts;
    
    onValueSelection(event){
        //event.preventDefault();
        const accountId1=event.target.value;
        this.accountId = accountId1;
        if(accountId1!=null){
            getContacts(
                {accountId:accountId1}
                )
            .then(result => {
                console.log('===result==');
                this.contacts=result;
            })
            .catch(error =>{
                console.log('===error==');
                this.error=error;
            });
        }
        alert("you have selected : "+this.accountId);
        } 
        
    }