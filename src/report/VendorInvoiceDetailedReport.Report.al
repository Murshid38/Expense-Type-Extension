report 50103 "Vendor Invoice Detailed Report"
{
    ApplicationArea = All;
    Caption = 'Vendor Invoice Detailed Report';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './layouts/VendorInvoiceDetailed.rdl';
    DefaultLayout = RDLC;
    dataset
    {
        dataitem(Vendor; Vendor)
        {
            column(ComName; ComInfo.Name)
            {
                IncludeCaption = true;
            }
            column(ComAddress; ComInfo.Address)
            {
                IncludeCaption = true;
            }

            column(ReportDate; Today)
            {
            }
            column(VendorName; Name)
            {
                IncludeCaption = true;
            }

            dataitem(PurchInvHeader; "Purch. Inv. Header")
            {

                column(Vendor_Invoice_No_; "Vendor Invoice No.")
                {
                    IncludeCaption = true;
                }
                column(Expense_Type; "Expense Type")
                {
                    IncludeCaption = true;
                }
                dataitem("Purchase Inv Line"; "Purch. Inv. Line")
                {

                    DataItemLink = "Document No." = field("No.");
                    //ensuring Purchase Line table Document No. field and Purch. Inv. Header table No. field is same value

                    DataItemLinkReference = PurchInvHeader;
                    // RequestFilterFields = "No.";
                    //Item	Qty	Line Amount	Line Discount	Final Line Amount 

                    column(No_; "No.")
                    {
                        IncludeCaption = true;

                    }
                    column(ItemQuantity; Quantity)
                    {
                        IncludeCaption = true;

                    }
                    column(Direct_Unit_Cost; "Direct Unit Cost")
                    {
                        IncludeCaption = true;

                    }
                    column(Line_Discount_Amount; "Line Discount Amount")
                    {
                        IncludeCaption = true;
                    }
                    column(Final_Line_Amount; "Line Amount")
                    {
                        //this field represents amount after discount(Final Line Amount)
                        IncludeCaption = true;
                    }
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
