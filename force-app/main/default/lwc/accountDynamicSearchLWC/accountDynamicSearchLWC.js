import { LightningElement, track } from 'lwc';
import searchAccounts from '@salesforce/apex/ContactController.searchAccounts';

const COLUMNS = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Industry', fieldName: 'Industry' },
    { label: 'Phone', fieldName: 'Phone' },
    { label: 'Type', fieldName: 'Type' }
];

export default class AccountSearch extends LightningElement {
    @track searchKey = '';
    @track accounts;
    @track error;
    columns = COLUMNS;

    handleSearchKeyChange(event) {
        this.searchKey = event.target.value;
        if (this.searchKey) {
            this.fetchAccounts();
        } else {
            this.accounts = undefined;
            this.error = undefined;
        }
    }

    fetchAccounts() {
        searchAccounts({ searchKey: this.searchKey })
            .then((result) => {
                this.accounts = result;
                this.error = undefined;
            })
            .catch((error) => {
                this.accounts = undefined;
                this.error = error.body.message;
            });
    }
}
