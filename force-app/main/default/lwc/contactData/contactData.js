import { LightningElement, wire, track } from 'lwc';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';

import CONTACT_OBJECT from '@salesforce/schema/Contact';
import LEVEL_FIELD from '@salesforce/schema/Contact.Level__c';

export default class ContactData extends LightningElement {
        @track levelOptions = [];
    
        @wire(getObjectInfo, { objectApiName: CONTACT_OBJECT })
        objectInfo;
    
        @wire(getPicklistValues, {
            recordTypeId: '$objectInfo.data.defaultRecordTypeId',
            fieldApiName: LEVEL_FIELD
        })
        wiredPicklistValues({ data, error }) {
            if (data) {
                this.levelOptions = data.values;
            } else if (error) {
                console.error('Error loading Level picklist', error);
            }
        }
    }