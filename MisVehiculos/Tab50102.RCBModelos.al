table 50102 "RCB Modelos"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Modelo; code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Descripción Modelo"; text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(3; "Marca"; code[20])
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(Key1; Modelo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Modelo, Marca, "Descripción Modelo")
        {
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}