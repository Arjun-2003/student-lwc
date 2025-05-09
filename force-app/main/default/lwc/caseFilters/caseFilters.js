import { LightningElement, track, wire } from 'lwc';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import CASE_OBJECT from '@salesforce/schema/Case';
import STATUS_FIELD from '@salesforce/schema/Case.Status';
import PRIORITY_FIELD from '@salesforce/schema/Case.Priority';
import ORIGIN_FIELD from '@salesforce/schema/Case.Origin';

export default class CaseFilter extends LightningElement {
    @track status = 'All';
    @track priority = 'All';
    @track origin = 'All';

    statusOptions = [];
    priorityOptions = [];
    originOptions = [];

    @wire(getObjectInfo, { objectApiName: CASE_OBJECT })
    objectInfo;

    @wire(getPicklistValues, {
        recordTypeId: '$objectInfo.data.defaultRecordTypeId',
        fieldApiName: STATUS_FIELD
    })
    wiredStatusValues({ data }) {
        if (data) {
            this.statusOptions = [{ label: 'All', value: 'All' }, ...data.values];
        }
    }

    @wire(getPicklistValues, {
        recordTypeId: '$objectInfo.data.defaultRecordTypeId',
        fieldApiName: PRIORITY_FIELD
    })
    wiredPriorityValues({ data }) {
        if (data) {
            this.priorityOptions = [{ label: 'All', value: 'All' }, ...data.values];
        }
    }

    @wire(getPicklistValues, {
        recordTypeId: '$objectInfo.data.defaultRecordTypeId',
        fieldApiName: ORIGIN_FIELD
    })
    wiredOriginValues({ data }) {
        if (data) {
            this.originOptions = [{ label: 'All', value: 'All' }, ...data.values];
        }
    }

    handleChange(event) {
        const { name, value } = event.detail;
        if (name === 'status') this.status = value;
        else if (name === 'priority') this.priority = value;
        else if (name === 'origin') this.origin = value;
    }

    get filters() {
        return {
            Status: this.status,
            Priority: this.priority,
            Origin: this.origin
        };
    }
}
