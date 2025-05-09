import { LightningElement } from 'lwc';

export default class InputNameButtonLWC extends LightningElement {
    inputText = "Enter Your Name : ";
    afterButtonClick;

    enterName(event) {
        this.enteredName = event.target.value;
    }

    clickButtonOk(){
        this.afterButtonClick = "Hello Mr. "+this.enteredName;
    }
}