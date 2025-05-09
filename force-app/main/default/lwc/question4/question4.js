import { LightningElement } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class Question4 extends LightningElement {
    contact = {};

    handleChange(e) {
        this.contact[e.target.dataset.id] = e.target.value;
    }

    createContact() {
        if (!this.contact.LastName || !this.contact.Email) {
            this.showToast('Error', 'Name and Email are required', 'error');
            return;
        }

        createRecord({ apiName: 'Contact', fields: this.contact })
            .then(c => this.showToast('Success', 'Contact created', 'success'))
            .catch(e => this.showToast('Error', e.body.message, 'error'));
    }

    showToast(title, message, variant) {
        this.dispatchEvent(new ShowToastEvent({ title, message, variant }));
    }
}