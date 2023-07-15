page 60100 "API Customers AprendeBC"
{
    PageType = API;
    Caption = 'API Customers AprendeBC';
    APIPublisher = 'rcb';
    APIGroup = 'aprendeBC';
    APIVersion = 'v2.0';
    EntityName = 'customer';
    EntitySetName = 'customers';
    SourceTable = Customer;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(number; rec."No.")
                {
                    Caption = 'No.';

                }
                field(customerName; rec.Name)
                {
                    Caption = 'Nombre Cliente';

                }
                field(vatRegistrationNo; rec."VAT Registration No.")
                {
                    Caption = 'VAT Registration No.';

                }

            }
        }
    }
}
