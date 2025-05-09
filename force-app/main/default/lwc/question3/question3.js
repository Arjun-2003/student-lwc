import { LightningElement,api ,track} from 'lwc';
import acc from '@salesforce/apex/ContactCtrl.acc';
export default class Question3 extends LightningElement {
 @api recordId;
 @track data;
 @track conData;
 connectedCallback() {
        if (this.recordId) {
           acc({accountId:this.recordId}).then((res)=>{
             this.data = res;
           }).catch((err)=>{
              console.log('OUTPUT : ',err);
           })
        } else {
            alert('RecordId is not available');
            return
        }
    }
    listCon(e){
       if(this.data){
       this.conData = this.data
       }
    }
}