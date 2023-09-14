page 51100 "API SEPA"
{
    APIGroup = 'aprendeBC';
    APIPublisher = 'rcb';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'apiSEPA';
    DelayedInsert = true;
    EntityName = 'mandate';
    EntitySetName = 'mandates';
    PageType = API;
    SourceTable = "SEPA Direct Debit Mandate";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(id; Rec.ID)
                {
                    Caption = 'ID';
                }
                field(customerNo; Rec."Customer No.")
                {
                    Caption = 'Customer No.';
                }
                field(validFrom; Rec."Valid From")
                {
                    Caption = 'Valid From';
                }
                field(validTo; Rec."Valid To")
                {
                    Caption = 'Valid To';
                }
                field(blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';
                }
                field(customerEmail; customerEmail)
                {
                    Caption = 'Customer Email';
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        customer: Record Customer;
    begin
        if customer.get(rec."Customer No.") then
            customerEmail := customer."E-Mail";

    end;


    var
        customerEmail: Text;

}
