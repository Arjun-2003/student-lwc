import { LightningElement, api } from 'lwc';

export default class ParentComponent extends LightningElement {
    @api message = "Hello Child!";
}