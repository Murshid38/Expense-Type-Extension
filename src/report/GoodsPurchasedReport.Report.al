report 50104 "Goods Purchased Report"
{
    ApplicationArea = All;
    Caption = 'Goods Purchased Report';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './layouts/GoodsPurchasedReport.rdl';
    DefaultLayout = RDLC;
    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterFields = "Inventory Posting Group";

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
                // RequestFilterFields = "Posting Date";
                column(ItemNo; "Item No.")
                {
                    IncludeCaption = true;
                }
                column(InvoicedQuantity; "Invoiced Quantity")
                {
                    IncludeCaption = true;
                }
                column(RemainingQuantity; "Remaining Quantity")
                {
                    IncludeCaption = true;
                }
                column(PostingDate; "Posting Date")
                {
                    IncludeCaption = true;
                }

                trigger OnPreDataItem()//this is a loop
                begin
                    if (PDate1 <> 0D) and (PDate2 <> 0D) then
                        SetRange("Posting Date", PDate1, PDate2);
                end;
            }
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
}
