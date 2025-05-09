import { LightningElement } from 'lwc';

export default class CustomEvent extends LightningElement {
    buttonLabel = 'Click Me';

    afterClick() {
        this.buttonLabel = ''; 
    }
}