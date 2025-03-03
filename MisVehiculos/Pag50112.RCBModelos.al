page 50112 "RCB Modelos"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "RCB Modelos";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Modelo; Rec.Modelo)
                {

                }
                field("Descripción Modelo"; Rec."Descripción Modelo")
                {

                }
                field("Marca"; Rec."Marca")
                {

                }

            }
        }

    }

}