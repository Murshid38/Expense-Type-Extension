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

            dataitem(ItemLedgerEntry; "Item Ledger Entry")
            {
                DataItemLink = "Item No." = field("No.");
                DataItemLinkReference = Item;
                RequestFilterFields = "Posting Date";
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
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    var
        ComInfo: Record "Company Information";

    trigger OnPreReport()
    begin
        ComInfo.Get();
    end;
}
