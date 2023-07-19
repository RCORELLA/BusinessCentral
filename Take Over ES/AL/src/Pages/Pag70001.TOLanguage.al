page 70001 "TO Language"
{
    Caption = 'TO Etiquetas';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "TO - Labels";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Label ID"; Rec."Label ID")
                {
                    ApplicationArea = All;
                }
                field("Language Code"; Rec."Language Code")
                {
                    ApplicationArea = All;

                }
                field("Text Value"; Rec."Text Value")
                {
                    ApplicationArea = All;

                }

            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}