/*
    CustomMetadataCallbackHandler
    Author: Michael Holt
    Date: 5th January 2021

    Class to allow custom metadata to be inserted.
*/

public class CustomMetadataCallbackHandler implements Metadata.DeployCallback {
    public void handleResult(Metadata.DeployResult result,
                             Metadata.DeployCallbackContext context) {
        if (result.status == Metadata.DeployStatus.Succeeded) {
        } else {
            // Deployment was not successful
        }
    }
}