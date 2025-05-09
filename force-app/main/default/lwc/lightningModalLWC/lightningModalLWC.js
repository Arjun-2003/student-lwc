import { api } from 'lwc';
import LightningModal from 'lightning/modal';

export default class CaseCreateModal extends LightningModal {
    @api content;

    clickOnOk() {
        this.close('OK');
    }
}
