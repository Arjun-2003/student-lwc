import { LightningElement } from 'lwc';

export default class ParentComponent2 extends LightningElement {
    datafromchild = '';

    handleDataFromChild(event) {
        this.datafromchild = event.detail;
    }
}
