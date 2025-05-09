import { LightningElement, track, wire } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import { deleteRecord } from 'lightning/uiRecordApi';
import { refreshApex } from '@salesforce/apex';
import getCases from '@salesforce/apex/CaseController.getFilteredCases';

const columns = [
    { label: 'Subject', fieldName: 'Subject' },
    { label: 'Status', fieldName: 'Status' },
    { label: 'Priority', fieldName: 'Priority' },
    { label: 'Origin', fieldName: 'Origin' },
    {
        type: 'action',
        typeAttributes: {
            rowActions: [
                { label: 'View', name: 'view' },
                { label: 'Edit', name: 'edit' },
                { label: 'Delete', name: 'delete' }
            ]
        }
    }
];

export default class CaseList extends NavigationMixin(LightningElement) {
    @track cases;
    @track error;
    @track isFormOpen = false;
    @track selectedCaseId;
    @track filters = {
        Status: 'All',
        Priority: 'All',
        Origin: 'All'
    };

    columns = columns;
    wiredCasesResult;

    @wire(getCases, { status: '$filters.Status', priority: '$filters.Priority', origin: '$filters.Origin' })
    wiredCases(result) {
        this.wiredCasesResult = result;
        const { data, error } = result;
        if (data) {
            this.cases = data;
            this.error = undefined;
        } else if (error) {
            this.error = error.body?.message || 'Unknown error';
            this.cases = undefined;
        }
    }

    handleRowAction(event) {
        const { name } = event.detail.action;
        const { Id } = event.detail.row;

        console.log('Row action triggered:', name, Id);

        if (name === 'view' || name === 'edit') {
            this.navigateToRecord(Id, name);
        } else if (name === 'delete') {
            this.deleteCase(Id);
        }
    }
    navigateToRecord(recordId, action) {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: recordId,
                objectApiName: 'Case',
                actionName: action
            }
        });
    }

    deleteCase(recordId) {
        deleteRecord(recordId)
            .then(() => {
                return refreshApex(this.wiredCasesResult);
            })
            .catch(error => {
                console.error('Error deleting record:', error);
                this.error = error.body?.message || 'Error deleting case';
            });
    }
    handleModalClose() {
        this.isFormOpen = false;
        this.selectedCaseId = null;
    }
    handleNewCase() {
        this.selectedCaseId = null; 
        this.isFormOpen = true;
    }
}
