import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class EventRegistrationLWC  extends LightningElement {
    handleSuccess() {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Registration successfully!',
                    variant: 'success'
                })
            );
            this.dispatchEvent(new CustomEvent('registered'));
        }
}   

