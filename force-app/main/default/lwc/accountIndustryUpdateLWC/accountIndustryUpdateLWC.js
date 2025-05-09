import { LightningElement, api } from 'lwc';
import { updateRecord } from 'lightning/uiRecordApi';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import ID_FIELD from '@salesforce/schema/Account.Id';

export default class AccountIndustryUpdater extends LightningElement {
    @api recordId;
    Industry = '';

    Industryfnc(event) {
        this.Industry = event.target.value;
    }
    click() {
        const fields = {};
        fields[ID_FIELD.fieldApiName] = this.recordId;
        fields[INDUSTRY_FIELD.fieldApiName] = this.Industry;

        const recordInput = { fields };

        updateRecord(recordInput)
            .then(() => {
                alert('Industry updated successfully');
            })
            .catch(error => {
                alert('Error updating industry \n' + error.body.message);
            });
    }
}


























































































































/*import { LightningElement, api } from 'lwc';
import { updateRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import ID_FIELD from '@salesforce/schema/Account.Id';

export default class AccountIndustryUpdater extends LightningElement {
    @api recordId;
    Industry = '';

    Industryfnc(event) {
        this.Industry = event.target.value;
    }
    click() {
        const fields = {};
        fields[ID_FIELD.fieldApiName] = this.recordId;
        fields[INDUSTRY_FIELD.fieldApiName] = this.Industry;

        const recordInput = { fields };

        updateRecord(recordInput)
            .then(() => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Industry updated successfully',
                        variant: 'success'
                    })
                );
                this.template.querySelector('lightning-input').value = '';
            })
            .catch(error => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error updating industry',
                        message: error.body.message,
                        variant: 'error'
                    })
                );
            });
    }
}*/