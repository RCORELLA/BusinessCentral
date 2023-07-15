page 60102 "APIPostedInvoiceSales.Page"
{
    APIGroup = 'aprendeBC';
    APIPublisher = 'rcb';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'apiPostedInvoiceSalesPage';
    DelayedInsert = true;
    EntityName = 'postedSalesInvoice';
    EntitySetName = 'postedSalesInvoices';
    PageType = API;
    SourceTable = "Sales Invoice Header";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(billToCustomerNo; Rec."Bill-to Customer No.")
                {
                    Caption = 'Bill-to Customer No.';
                }
                field(billToName; Rec."Bill-to Name")
                {
                    Caption = 'Bill-to Name';
                }
                field(orderDate; Rec."Order Date")
                {
                    Caption = 'Order Date';
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                }
                field(paymentTermsCode; Rec."Payment Terms Code")
                {
                    Caption = 'Payment Terms Code';
                }
                field(dueDate; Rec."Due Date")
                {
                    Caption = 'Due Date';
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                }
                field(amount; Rec.Amount)
                {
                    Caption = 'Amount';
                }
                field(vatRegistrationNo; Rec."VAT Registration No.")
                {
                    Caption = 'VAT Registration No.';
                }
                field(paymentMethodCode; Rec."Payment Method Code")
                {
                    Caption = 'Payment Method Code';
                }
            }
        }
    }
}
