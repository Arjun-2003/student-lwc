import { LightningElement, wire, track } from 'lwc';
import { refreshApex } from '@salesforce/apex';
import getCurrentUser from '@salesforce/apex/MyeventClass.getCurrentUser';
import getMyEvents from '@salesforce/apex/MyeventClass.getMyEvents';

export default class MyEventsLWC extends LightningElement {
    @track user;
    @track registrations = [];

    columns = [
        { label: 'Event Name', fieldName: 'name' },
        { label: 'Date', fieldName: 'date', type: 'date' },
        { label: 'Location', fieldName: 'location' }
    ];

    wiredUserResult;
    wiredEventsResult;

    @wire(getCurrentUser)
    wiredUserMethod(result) {
        this.wiredUserResult = result;
        if (result.data) {
            this.user = result.data;
        }
    }

    @wire(getMyEvents)
    wiredEventsMethod(result) {
        this.wiredEventsResult = result;
        if (result.data) {
            this.registrations = result.data.map(row => ({
                Id: row.Id,
                name: row.Event__r.Name,
                date: row.Event__r.Event_Date__c,
                location: row.Event__r.Location__c
            }));
        }
    }
    refreshData() {
        refreshApex(this.wiredEventsResult);
        refreshApex(this.wiredUserResult);
    }

    get showNoData() {
        return this.registrations.length === 0;
    }
}
