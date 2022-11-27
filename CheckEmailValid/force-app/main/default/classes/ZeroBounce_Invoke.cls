public class ZeroBounce_Invoke {

    @InvocableMethod(label='Check Email Valid' description='description')
    public static void getEmailAddress(List<Id> ids) {
        
        Contact contact = [SELECT Id, Email From Contact Where Id =:ids];
        System.debug(contact.Email);
        verifyEmail(String.valueOf(contact.Email), String.valueOf(contact.Id));
        
    }

    @future(callout=true)
    public static void verifyEmail(String Email, String Id) {

        try {
            Boolean validEmail = false;

            String doRequest = ZeroBounce_Http_Utils.doRequest(Email);

            if (doRequest =='valid') {
                validEmail = true;
            }

            List<Contact> updateContact = [SELECT Id, Email_Valid__c From Contact where Id =:Id];
            for (Contact obj_contact : updateContact) {
                obj_contact.Email_Valid__c = validEmail ;
            } 
            Update updateContact;
            System.debug('Update Contact: ' + updateContact);


        } catch (Exception e) {
            
        }
    }
}
