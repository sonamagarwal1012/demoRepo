import { LightningElement,track } from 'lwc';

export default class MyComponent extends LightningElement {
@track name;
hendleNameChange(event){
this.name=event.target.value;
}

}