import { LightningElement, api} from 'lwc';

export default class PriPubApi extends LightningElement {
   
    @api recordId;   
    @api objectApiName;   
    message = "Hello Developer";
    // showRecordId;
    

    // connectedCallback(){
    //     setTimeout(() => {
    //         console.log("show record: " + this.recordId);
    //         this.showRecordId = this.recordId;
    //     }, 10000);   
    // }
    

}