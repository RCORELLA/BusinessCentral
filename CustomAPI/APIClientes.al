page 60100 "API Clientes AprendeBC"
{
    PageType = API;
    Caption = 'API Clientes AprendeBC';
    APIPublisher = 'rcb';
    APIGroup = 'aprendebc';
    APIVersion = 'beta';
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
                field(nombreCliente; rec.Name)
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