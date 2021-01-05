import { LightningElement, track } from 'lwc';
import insertMetadata from '@salesforce/apex/CustomMetadataUtils.insertMetadata';
import getCustomMetadata from '@salesforce/apex/CustomMetadataUtils.getCustomMetadata';


export default class ExposeMetadata extends LightningElement {
    name;
    jwt;
    password;
    registered;

    @track customMetadata;

    updateName(event){
        this.name = event.target.value;
    }

    updateJwt(event){
        this.jwt = event.target.value;
    }

    updatePassword(event){
        this.password = event.target.value;
    }

    updateRegistered(event){
        this.registered = event.target.checked;
    }

    saveMetadata(){
        insertMetadata({name: this.name, jwt: this.jwt, pword: this.password, registered: this.registered})
        .then((result) => {
            console.log(result);
        });
    }

    loadMetadata(){
        getCustomMetadata()
        .then((result) =>{
            console.log(result);
            this.customMetadata = result;
        });
    }

}