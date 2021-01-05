/*
    CustomMetadataUtils
    Author: Michael Holt
    Date: 5th January 2020

    Insert and read from the Custom Metadata Type My_Metadata__mdt
*/


public without sharing class CustomMetadataUtils{

    @AuraEnabled
    public static String insertMetadata(String name, String jwt, String pword, boolean registered) {
        try{
            Metadata.CustomMetadata customMetadata =  new Metadata.CustomMetadata();
            customMetadata.fullName = 'MHolt__My_Metadata__mdt.' + name;
            customMetadata.label = name;

            Metadata.CustomMetadataValue jwtField = new Metadata.CustomMetadataValue();
            Metadata.CustomMetadataValue pwordField = new Metadata.CustomMetadataValue();
            Metadata.CustomMetadataValue registeredField = new Metadata.CustomMetadataValue();
            jwtField.field = 'MHolt__JWT__c';
            jwtField.value = jwt;
            pwordField.field = 'MHolt__Password__c';
            pwordField.value = pword;
            registeredField.field = 'MHolt__Registered__c';
            registeredField.value = registered;
            
            customMetadata.values.add(jwtField);
            customMetadata.values.add(pwordField);
            customMetadata.values.add(registeredField);

            Metadata.DeployContainer mdContainer = new Metadata.DeployContainer();
            
            System.debug(customMetadata);
            mdContainer.addMetadata(customMetadata);
            CustomMetadataCallbackHandler callback = new CustomMetadataCallbackHandler();
            Id jobId = Metadata.Operations.enqueueDeployment(mdContainer, callback);
            return 'Success';
        }catch(Exception e)
        {
            system.debug(e.getMessage());
            return e.getMessage();
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<My_Metadata__mdt> getCustomMetadata(){
        return [SELECT Id, DeveloperName, JWT__c, Password__c, Registered__c FROM My_Metadata__mdt];
    }
}
