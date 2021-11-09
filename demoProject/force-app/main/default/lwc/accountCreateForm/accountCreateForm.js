import { LightningElement } from 'lwc';
import account_name from '@salesforce/schema/Account.Name';
import account_type from '@salesforce/schema/Account.Type';
import account_industry from '@salesforce/schema/Account.Industry';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import {NavigationMixin} from 'lightning/navigation';
export default class AccountCreateForm extends NavigationMixin(LightningElement) {
    objectApiName='Account';
    fieldLst=[account_name,account_type,account_industry];
    handleAccountCreate(event){
        const env = new ShowToastEvent({
            title:"Account Create",
            message:"Record Id: "+event.detail.id,
            variant:"success",
        });
        this.dispatchEvent(env);
        this[NavigationMixin.Navigate]({
            type :"standard__recordPage",
            attributes: {
                recordId : event.detail.id,
                objectApiName:'Account',
                actionName :'view'
            },
        });
    }
}