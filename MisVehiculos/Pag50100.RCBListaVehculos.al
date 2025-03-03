page 50110 "RCB Lista Vehículos"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "RCB Vehiculos";
    CardPageId = "RCB Vehículos Card";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(id; Rec.id)
                {

                }
                field(Modelo; Rec.Modelo)
                {

                }
                field(Descripción; Rec.Descripción)
                {

                }
                field(Matrícula; Rec.Matrícula)
                {

                }
            }
        }

    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin
                    Message('Esto es una acción');
                end;
            }
        }
    }
}