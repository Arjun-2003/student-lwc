import { LightningElement, wire } from 'lwc';
import getLatestAccounts from '@salesforce/apex/AccountController.getLatestAccounts';

export default class LatestAccounts extends LightningElement {
    accounts;
    error;

    @wire(getLatestAccounts)
    wiredAccounts({ data, error }) {
        if (data) {
            this.accounts = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.accounts = undefined;
        }
    }
}
