table 50190 "RCB Forecast Import Buffer"
{
    Caption = 'RCB Forecast Import Buffer';

    fields
    {
        field(1; "Forecast Name"; Code[10])
        {
            Caption = 'Forecast Name';
            DataClassification = CustomerContent;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(3; "File Name"; Text[50])
        {
            Caption = 'File Name';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(4; "Sheet Name"; Text[30])
        {
            Caption = 'Sheet Name';
            DataClassification = CustomerContent;
        }
        field(5; "Imported Date"; Date)
        {
            Caption = 'Imported Date';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(6; "Imported Time"; Time)
        {
            Caption = 'Imported Time';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(7; "Sell-to Customer No."; Code[20])
        {
            Caption = 'Sell-to Customer No.';
            TableRelation = Customer;
            DataClassification = CustomerContent;
        }
        field(8; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = CustomerContent;
            TableRelation = Item;
        }
        field(10; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = CustomerContent;
        }


    }

    keys
    {
        key(Key1; "Forecast Name", "Line No.")
        {
            Clustered = true;
        }
    }
}