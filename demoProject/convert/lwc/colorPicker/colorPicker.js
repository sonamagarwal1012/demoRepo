import { LightningElement } from 'lwc';

export default class ColorPicker extends LightningElement {
    handleColorChange(event){
        const colorChangeText = event.target.value;
        const evt= new CustomEvent('colorchange',{
            detail:{colorChangeText}
        }
        );
        this.dispatchEvent(evt);
    }
}