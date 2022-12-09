report 50104 "Goods Purchased Report"
{
    ApplicationArea = All;
    Caption = 'Goods Purchased Report';
    UsageCategory = ReportsAndAnalysis;
    // RDLCLayout = './layouts/GoodsPurchasedReport.rdl';
    RDLCLayout = './layouts/GoodsPurchasedReportNew.rdl';
    DefaultLayout = RDLC;
    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterFields = "Inventory Posting Group";
            // CalcFields = Inventory;
            PrintOnlyIfDetail = true;
            column(Unit_Cost; "Unit Cost")
            {
                IncludeCaption = true;
            }
            column(Inventory_Posting_Group; "Inventory Posting Group")
            {
                IncludeCaption = true;
            }
            column(PostingDateStart; PDate1)
            {
            }
            column(PostingDateEnd; PDate2)
            {
            }

            dataitem(ItemLedgerEntry; "Item Ledger Entry")
            {
                DataItemLink = "Item No." = field("No.");
                DataItemLinkReference = Item;
                column(ItemNo; "Item No.")
                {
                    IncludeCaption = true;
                }
                column(InvoicedQuantity; "Invoiced Quantity")
                {
                    IncludeCaption = true;
                }
                column(PostingDate; "Posting Date")
                {
                    IncludeCaption = true;
                }
                column(Entry_Type; "Entry Type")
                {
                    IncludeCaption = true;
                }
                // column(Inventory; InventoryPerItem)
                // {
                // }
                column(Quantity; Quantity)
                {
                    IncludeCaption = true;
                }

                column(Remaining_Quantity; "Remaining Quantity")
                {
                    IncludeCaption = true;
                }


                trigger OnPreDataItem()//this is a loop
                begin
                    SetRange("Entry Type", "Entry Type"::Purchase);
                    if (PDate1 <> 0D) and (PDate2 <> 0D) then
                        SetRange("Posting Date", PDate1, PDate2);
                end;

                // trigger OnAfterGetRecord()
                // begin
                //     Clear(InventoryPerItem);
                //     if LastItem <> "Item No." then
                //         // Item.CalcFields(Inventory);
                //     InventoryPerItem := Item.Inventory;

                //     LastItem := Item."No.";
                // end;
            }

            // trigger OnAfterGetRecord()
            // begin
            //     Clear(InventoryPerItem);
            // end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(DateFilter)
                {
                    Caption = 'Date Filter';

                    field(PostingDateStart; PDate1)//we are setting the PDate2 variable here using PostingDateEnd field
                    {
                        ToolTip = 'Starting Date';
                        Caption = 'From';
                        ApplicationArea = all;
                    }
                    field(PostingDateEnd; PDate2)//we are setting the PDate2 variable here using PostingDateEnd field
                    {
                        ToolTip = 'Ending Date';
                        Caption = 'To';
                        ApplicationArea = all;
                    }
                }
            }
        }
    }


    var
        PDate1: Date;
        PDate2: Date;
    //     InventoryPerItem: Decimal;
    //     LastItem: Code[20];
}
