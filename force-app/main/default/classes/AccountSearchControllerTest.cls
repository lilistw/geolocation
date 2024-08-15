@isTest
private class AccountSearchControllerTest {

@isTest
    static void testSearchAccounts() {
        User adminUser = createAdminUser();
        System.runAs(adminUser){
            // Test data setup
            String searchTerm = 'Acct1';
            List<Account> testAccounts = new List<Account>{
                new Account(Name = 'Acct1', Phone = '{PHONE_PLACEHOLDER}', Website = 'https://www.example.com', BillingStreet = '123 Main St', BillingCity = 'Anytown', BillingState = 'CA', BillingPostalCode = '12345'),
                new Account(Name = 'Acct2', Phone = '{PHONE_PLACEHOLDER}', Website = 'https://www.example.com', BillingStreet = '123 Main St', BillingCity = 'Anytown', BillingState = 'CA', BillingPostalCode = '12345')
            };
            Database.insert(testAccounts);

            // Perform the search
            List<Account> searchedAccounts = AccountSearchController.searchAccounts(searchTerm);

            // Assert the results
            System.assertEquals(1, searchedAccounts.size(), 'Unexpected number of searched accounts');
            Account searchedAccount = searchedAccounts[0];
            System.assertEquals(testAccounts[0].Id, searchedAccount.Id, 'Incorrect searched account');
            System.assertEquals(testAccounts[0].Name, searchedAccount.Name, 'Incorrect searched account name');
            System.assertEquals(testAccounts[0].Phone, searchedAccount.Phone, 'Incorrect searched phone number');
            System.assertEquals(testAccounts[0].Website, searchedAccount.Website, 'Incorrect searched website');
            System.assertEquals(testAccounts[0].BillingStreet, searchedAccount.BillingStreet, 'Incorrect searched billing street');
            System.assertEquals(testAccounts[0].BillingCity, searchedAccount.BillingCity, 'Incorrect searched billing city');
            System.assertEquals(testAccounts[0].BillingState, searchedAccount.BillingState, 'Incorrect searched billing state');
            System.assertEquals(testAccounts[0].BillingPostalCode, searchedAccount.BillingPostalCode, 'Incorrect searched billing postal code');
        }
    }
}