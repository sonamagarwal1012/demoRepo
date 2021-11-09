import { LightningElement } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import {createRecord} from 'lightning/uiRecordApi';
import {NavigationMixin} from 'lightning/navigation';
export default class AccountCreate_API extends NavigationMixin(LightningElement) {
    name;
    phone;
    handleChange(event){
        if(event.target.name="name"){
            this.name=event.target.value;
        }
        else if(event.target.name="phone"){
            this.phone=event.target.value;
        }
    }
    handleAccountCreateButton(){
        const fields={};
        fields[NAME_FIELD.fieldApiName]=this.name;
        fields[PHONE_FIELD.fieldApiName]=this.phone;
        const recordInput={apiName : ACCOUNT_OBJECT.objectApiName,fields};
        createRecord(recordInput)
        .then(account=>{
            this.accountId=account.id;
            this.dispatchEvent(new ShowToastEvent({
                 title:"Success",
                 message : "Account created",
                 variant : "success",
            }),
            );
            this[NavigationMixin]({
                type:"standard__recordPage",
                attributes:{
                    recordId:account.id,
                    objectApiName :'Account',
                    actionName :'view'
                }
            })
        })
        .catch(error=>{
            this.dispatchEvent(new ShowToastEvent({
                title:"Error Creating Record",
                message : error.body.message,
                variant : "error",
           }),
           );
        });
    }
}