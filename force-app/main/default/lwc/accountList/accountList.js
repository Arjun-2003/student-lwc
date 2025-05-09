import { LightningElement , track} from 'lwc';
import getAccounts from '@salesforce/apex/AccountController2.getAccounts';
export default class accountList extends LightningElement {
    @track searchKey = '';
    @track accounts = [];
    
    handleSearchChange(event)
    {
        this.searchKey = event.target.value;
    }
    handleSearchClick(){
        getAccounts({searchKey:this.searchKey})
        .then(result=>{
            this.accounts = result;
            this.error = undefined;
        })
    }
}