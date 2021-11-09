import { LightningElement,api } from 'lwc';
import contact_FirstName from '@salesforce/schema/Contact.FirstName';
import contact_LastName from '@salesforce/schema/Contact.LastName';
import contact_email from '@salesforce/schema/Contact.Email';
import contact_phone from '@salesforce/schema/Contact.Phone';
import contact_Account from '@salesforce/schema/Contact.AccountId';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
export default class ContactUpdate extends LightningElement {
    @api objectApiName;
    @api recordId;
    fieldLst=[contact_FirstName,contact_LastName,contact_email,contact_phone,contact_Account];
    handleUpdateContact(event){
         const evt= new ShowToastEvent({
             title:"Contact Update",
             message:"Contact Record "+event.detail.fields.LastName.value+" is successfully updated",
             variant:"success"
         });
         this.dispatchEvent(evt);
    }
}