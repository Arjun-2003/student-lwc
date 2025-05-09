import { LightningElement,track , wire } from 'lwc';
import getOpportunities from '@salesforce/apex/OpportunityController.getOpportunities';
export default class question10 extends LightningElement {

    @track opportunities;
    @track error;
    @track isLoading = true;

    @wire(getOpportunities)
    wiredOpportunities({data,error}){
        
        if(data){
            this.opportunities=data;
            this.isLoading=false;
            this.error=undefined;
        }
        else if(error)
        {
            this.error=error;
            this.opportunities=undefined;
        }
    }
    
}