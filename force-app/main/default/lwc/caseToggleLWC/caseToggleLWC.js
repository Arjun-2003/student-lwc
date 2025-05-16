import { LightningElement, track } from 'lwc';

export default class CaseToggleLWC extends LightningElement {
    @track isChildVisible = false;

    toggleChildVisibility() {
        this.isChildVisible = !this.isChildVisible;
    }
}