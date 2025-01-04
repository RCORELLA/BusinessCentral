page 50190 "RCB Forecasting Worksheet"
{
    AutoSplitKey = true;
    Caption = 'RCB Forecasting Worksheet';
    DelayedInsert = true;
    // InsertAllowed = false;
    // ModifyAllowed = false;
    PageType = Worksheet;
    SaveValues = true;
    SourceTable = "RCB Forecast Import Buffer";
    SourceTableView = sorting("Forecast Name", "Line No.");
    UsageCategory = Tasks;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            field(Forecast; ForecastName)
            {
                Caption = 'Nombre de la previsión';
                ApplicationArea = All;
            }
            field(customerNo; CustomerNo)
            {
                ApplicationArea = All;
            }
            repeater(Group)
            {
                Editable = false;
                field("Forecast Name"; Rec."Forecast Name")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Line No."; Rec."Line No.")
                {
                    Visible = false;
                    ApplicationArea = All;
                }

                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field("File Name"; Rec."File Name")
                {
                    ApplicationArea = All;
                }
                // field("Sheet Name"; Rec."Sheet Name")
                // {
                //     ApplicationArea = All;
                // }
                // field("Imported Date"; Rec."Imported Date")
                // {
                //     ApplicationArea = All;
                // }
                // field("Imported Time"; Rec."Imported Time")
                // {
                //     ApplicationArea = All;
                // }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("&Import")
            {
                Caption = '&Importar';
                Image = ImportExcel;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                ToolTip = 'Importar datos de excel';

                trigger OnAction()
                var
                begin
                    if ForecastName = '' then
                        Error('El nombre de la previsión está en blanco');
                    ReadExcelSheet();
                    ImportExcelData();
                end;
            }

        }
    }

    var
        ForecastName: Code[10];
        FileName: Text[100];
        SheetName: Text[100];

        CustomerNo: Code[20];

        TempExcelBuffer: Record "Excel Buffer" temporary;
        UploadExcelMsg: Label 'Selecciona un fichero de Excel';
        NoFileFoundMsg: Label 'Fichero no encontrado';




    local procedure ReadExcelSheet()
    var
        FileMgt: Codeunit "File Management";
        IStream: InStream;
        FromFile: Text[100];
    begin
        UploadIntoStream(UploadExcelMsg, '', '', FromFile, IStream);
        if FromFile <> '' then begin
            FileName := FileMgt.GetFileName(FromFile);
            SheetName := TempExcelBuffer.SelectSheetsNameStream(IStream);
        end else
            Error(NoFileFoundMsg);
        TempExcelBuffer.Reset();
        TempExcelBuffer.DeleteAll();
        TempExcelBuffer.OpenBookStream(IStream, SheetName);
        TempExcelBuffer.ReadSheet();
    end;

    local procedure ImportExcelData()
    var
        ForecastImportBuffer: Record "RCB Forecast Import Buffer";
        RowNo: Integer;
        ColNo: Integer;
        LineNo: Integer;
        MaxRowNo: Integer;

    begin
        RowNo := 0;
        ColNo := 0;
        MaxRowNo := 0;
        LineNo := 0;
        ForecastImportBuffer.Reset();
        if ForecastImportBuffer.FindLast() then
            LineNo := ForecastImportBuffer."Line No.";
        TempExcelBuffer.Reset();
        if TempExcelBuffer.FindLast() then begin
            MaxRowNo := TempExcelBuffer."Row No.";
        end;

        customerNo := GetValueAtCell(2, 2);


        for RowNo := 4 to MaxRowNo do begin
            LineNo := LineNo + 10000;
            ForecastImportBuffer.Init();
            Evaluate(ForecastImportBuffer."Forecast Name", ForecastName);
            ForecastImportBuffer."Line No." := LineNo;

            Evaluate(ForecastImportBuffer."Sell-to Customer No.", customerNo);
            Evaluate(ForecastImportBuffer."Item No.", GetValueAtCell(RowNo, 1));
            Evaluate(ForecastImportBuffer.Quantity, GetValueAtCell(RowNo, 3));

            ForecastImportBuffer."Sheet Name" := SheetName;
            ForecastImportBuffer."File Name" := FileName;
            ForecastImportBuffer."Imported Date" := Today;
            ForecastImportBuffer."Imported Time" := Time;
            ForecastImportBuffer.Insert();
        end;
        Message('Excel is successfully imported.');
    end;

    local procedure GetValueAtCell(RowNo: Integer; ColNo: Integer): Text
    begin

        TempExcelBuffer.Reset();
        If TempExcelBuffer.Get(RowNo, ColNo) then
            exit(TempExcelBuffer."Cell Value as Text")
        else
            exit('');
    end;
}