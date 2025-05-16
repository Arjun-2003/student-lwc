import { LightningElement, wire, track } from 'lwc';
import getUpcomingEvents from '@salesforce/apex/EventController4.getUpcomingEvents';
import deleteEvent from '@salesforce/apex/EventController4.deleteEvent';
import getRegistrationsByEvent from '@salesforce/apex/EventController4.getRegistrationsByEvent';
import cancelRegistration from '@salesforce/apex/EventController4.cancelRegistration'; 
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';

const ACTIONS = [
    { label: 'Edit', name: 'edit' },
    { label: 'Delete', name: 'delete' },
    { label: 'View Registrations', name: 'viewRegistrations' }
];

const COLUMNS = [
    { label: 'Event Name', fieldName: 'Name' },
    { label: 'Date', fieldName: 'Event_Date__c', type: 'date' },
    { label: 'Type', fieldName: 'Event_Type__c' },
    { label: 'Location', fieldName: 'Location__c' },
    { label: 'Max Attendees', fieldName: 'Max_Attendees__c', type: 'number' },
    { label: 'Registered', fieldName: 'Current_Attendees__c', type: 'number' },
    { type: 'action', typeAttributes: { rowActions: ACTIONS } }
];

export default class AdminEventManager extends LightningElement {
    @track events = [];
    @track columns = COLUMNS;
    @track showForm = false;
    @track selectedEventId = null;
    @track formTitle = 'New Event';
    @track isAdmin = true;

    @track registrations = [];
    @track showRegistrationModal = false;
    wiredResult;

    @wire(getUpcomingEvents)
    wiredEvents(result) {
        this.wiredResult = result;
        if (result.data) {
            this.events = result.data;
        } else if (result.error) {
            this.showToast('Error', result.error.body.message, 'error');
        }
    }

    openNewForm() {
        this.selectedEventId = null;
        this.formTitle = 'New Event';
        this.showForm = true;
    }

    handleRowAction(event) {
        const actionName = event.detail.action.name;
        const row = event.detail.row;

        if (actionName === 'edit') {
            this.selectedEventId = row.Id;
            this.formTitle = 'Edit Event';
            this.showForm = true;
        } else if (actionName === 'delete') {
            this.deleteEvent(row.Id);
        } else if (actionName === 'viewRegistrations') {
            this.viewRegistrations(row.Id);
        }
    }

    deleteEvent(eventId) {
        deleteEvent({ eventId })
            .then(() => {
                this.showToast('Success', 'Event deleted', 'success');
                return refreshApex(this.wiredResult);
            })
            .catch(error => {
                this.showToast('Error deleting event', error.body.message, 'error');
            });
    }

    viewRegistrations(eventId) {
        getRegistrationsByEvent({ eventId })
            .then(result => {
                this.registrations = result.map(r => ({
                    ...r,
                    isRegistered: r.Status__c === 'Registered'
                }));
                this.showRegistrationModal = true;
                this.selectedEventId = eventId;
            })
            .catch(error => {
                this.showToast('Error fetching registrations', error.body.message, 'error');
            });
    }

    async handleSuccess() {
        this.showForm = false;
        this.showToast('Success', 'Event saved', 'success');
        if (this.wiredResult) {
            try {
                await refreshApex(this.wiredResult);
            } catch (e) {
                this.showToast('Error', 'Failed to refresh event list', 'error');
            }
        }
    }

    closeForm() {
        this.showForm = false;
    }

    closeRegistrationModal() {
        this.showRegistrationModal = false;
    }

    handleCancelRegistration(event) {
        const registrationId = event.target.dataset.id;

        cancelRegistration({ registrationId })
            .then(() => {
                this.showToast('Success', 'Registration cancelled successfully', 'success');
                this.registrations = this.registrations.map(reg => {
                    if (reg.Id === registrationId) {
                        return {
                            ...reg,
                            Status__c: 'Cancelled',
                            isRegistered: false
                        };
                    }
                    return reg;
                });
            })
            .catch(error => {
                this.showToast('Error', error.body.message, 'error');
            });
    }

    showToast(title, message, variant) {
        this.dispatchEvent(new ShowToastEvent({
            title,
            message,
            variant
        }));
    }
}
