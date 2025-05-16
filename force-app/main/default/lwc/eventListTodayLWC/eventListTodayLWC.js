import { LightningElement, wire, track } from 'lwc';
import getUpcomingEvents from '@salesforce/apex/EventController3.getUpcomingEvents';
import getVisibleEvents from '@salesforce/apex/EventInternalExternal.getVisibleEvents';

const COLUMNS = [
    { label: 'Event Name', fieldName: 'Name' },
    { label: 'Date', fieldName: 'Event_Date__c', type: 'date' },
    { label: 'Type', fieldName: 'Event_Type__c' },
    { label: 'Location', fieldName: 'Location__c' },
    {
        label: 'Booking',
        type: 'button',
        typeAttributes: {
            label: 'Book Registration',
            name: 'bookRegistration',
            variant: 'brand'
        }
    }
];

export default class UpcomingEvents extends LightningElement {
    @track typeFilter = 'All';
    @track nameKeyword = '';
    columns = COLUMNS;
    events = []; 
    error;

    @wire(getUpcomingEvents, { typeFilter: '$typeFilter', nameKeyword: '$nameKeyword' })
    wiredEvents({ data, error }) {
        if (data) {
            this.events = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.events = [];
        }
    }

    handleTypeChange(event) {
        this.typeFilter = event.detail.value;
    }

    handleSearchInput(event) {
        this.nameKeyword = event.target.value;
    }

    handleRowAction(event) {
        const actionName = event.detail.action.name;
        const row = event.detail.row;

        if (actionName === 'bookRegistration') {
            console.log(`Booking registration for event: ${row.Name}`);
        }
    }

    get typeOptions() {
        return [
            { label: 'All', value: 'All' },
            { label: 'Internal', value: 'Internal' },
            { label: 'External', value: 'External' }
        ];
    }
}
