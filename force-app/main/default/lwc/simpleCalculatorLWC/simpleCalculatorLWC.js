import { LightningElement } from 'lwc';

export default class Calculator extends LightningElement {
    firstNumber = 0;
    secondNumber = 0;
    result = 0;
   
    handleFirstChange(event) {
        this.firstNumber = event.target.value
    }

    handleSecondChange(event) {
        this.secondNumber = event.target.value
    }

    handleAddition() {
         this.result = this.firstNumber + this.secondNumber;
         this.template.querySelector('.hehe1').value = Number(0)
         this.template.querySelector('.hehe').value = Number(0)
    }
         }