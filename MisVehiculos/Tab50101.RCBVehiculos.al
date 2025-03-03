table 50101 "RCB Vehiculos"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; id; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;

        }
        field(2; Modelo; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "RCB Modelos";

        }
        field(3; Descripción; text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(4; Matrícula; code[20])
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(PK; id)
        {
            Clustered = true;
        }
    }



}