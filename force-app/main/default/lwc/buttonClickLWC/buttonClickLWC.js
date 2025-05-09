import { LightningElement } from 'lwc';

export default class ButtonClickLWC extends LightningElement {
    buttonLabel = 'Click Me';

    afterClick() {
        this.buttonLabel = 'Clicked!'; 
    }
}
