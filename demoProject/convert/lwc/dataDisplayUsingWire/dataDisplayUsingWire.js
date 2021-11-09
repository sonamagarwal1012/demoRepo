import { LightningElement,track,wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';
import getAccountRecords from '@salesforce/apex/AccountController.getAccountRecords';
export default class DataDisplayUsingWire extends LightningElement {
    accountData;
    accountData1;
    error;
    columns=[
        {label:'Name',fieldName:'Name',type:'text'},
        {label:'Phone',fieldName:'Phone',type:'phone'}
    ]
    @wire(getAccounts) accountRecords({error,data}){
        if(data){
            this.accountData=data;
        }
        else if(error){
            this.accountData=undefined;
        }
    }

    connectedCallback(){
        getAccountRecords()
        .then(result=>{
            this.accountData1=result;
        })
        .catch(error=>{
            this.error=error;
        });

    }
}