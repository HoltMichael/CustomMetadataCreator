/*
    CustomMetadata_Test
    Author: Michael Holt
    Date: 5th January 2021

    Rubbish Test Class
*/

@isTest
public with sharing class CustomMetadata_Test {
    @isTest
    public static void tester() {
        CustomMetadataUtils.insertMetadata('name', 'jwt', 'pword', true);
        CustomMetadataUtils.getCustomMetadata();
    }
    
}
