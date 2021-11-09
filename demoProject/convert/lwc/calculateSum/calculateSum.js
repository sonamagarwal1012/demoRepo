import { LightningElement,api } from 'lwc';
import calculateSumResult from '@salesforce/apex/calculateSum.calculateSumResult';
export default class CalculateSum extends LightningElement {
    sum;
    error;
    fNUmber;
    sNumber;
    @api title;
    @api greeting;
    handleSubmit(){
        calculateSumResult({firstNumber:this.fNUmber,secondNumber:this.sNumber})
        .then(result=>{
            this.sum=result;
        })
        .catch(error=>{
            this.error=error;
        });
    }
    handleChange(event){
        if(event.target.name==='fstNumber'){
            this.fNUmber=event.target.value;
        }
        else if(event.target.name==='scndNumber'){
            this.sNumber=event.target.value;
        }

    }

}