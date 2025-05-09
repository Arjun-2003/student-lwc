import { LightningElement } from 'lwc';
import lightningModalLWC from 'c/lightningModalLWC';

export default class Container extends LightningElement {
    showModal = true;
    result;

    async afterClickShowModal(){
        this.result = await lightningModalLWC.open({
            size : 'large',
            description: 'Accesible description of modal\'s purpose ',
            content: 'Passed into content api',

        });
        console.log(result);

    }
}