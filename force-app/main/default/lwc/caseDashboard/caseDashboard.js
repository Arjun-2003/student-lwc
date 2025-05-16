import { LightningElement} from 'lwc';

export default class caseDashboard extends LightningElement {
    isChildVisible = false;

    toggleChildVisibility() {
        this.isChildVisible = !this.isChildVisible;
    }
}