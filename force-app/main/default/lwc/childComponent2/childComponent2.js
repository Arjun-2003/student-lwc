import { LightningElement, api } from 'lwc';

export default class ChildComponent2 extends LightningElement {
    @api Name = '';

    afterInput(event) {
        this.Name = event.target.value;
    }

    afterClick() {
        const sendData = new CustomEvent('myevent', {
            detail: this.Name,
        });
        this.dispatchEvent(sendData);
    }
}











































/*import { LightningElement, api } from 'lwc';

export default class ChildComponent2 extends LightningElement {
    @api Name = '';

    afterInput(event) {
        this.Name = event.target.value;
    }

    afterClick() {
        const sendData = new CustomEvent('my_event', {
            detail: this.Name,
            bubbles: true,
            composed: true
        });
        this.dispatchEvent(sendData);
    }
}
*/ 