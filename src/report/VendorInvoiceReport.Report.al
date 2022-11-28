report 50102 "Vendor Invoice Report"
{
    ApplicationArea = All;
    Caption = 'Vendor Invoice Report';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './layouts/VendorInvoice.rdl';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(PurchInvHeader; "Purch. Inv. Header")
        {
            RequestFilterFields = "Expense Type", "Posting Date";
            column(ComName; ComInfo.Name)
            {
                IncludeCaption = true;
            }
            column(ComAddress; ComInfo.Address)
            {
                IncludeCaption = true;
            }
            column(ComAddress2; ComInfo."Address 2")
            {
                IncludeCaption = true;
            }
            column(ComAddress3; ComInfo.City)
            {
                IncludeCaption = true;
            }

            column(ReportDate; Today)
            {
            }

            column(BuyfromVendorName; "Buy-from Vendor Name")
            {
                IncludeCaption = true;
            }
            column(VendorInvoiceNo; "Vendor Invoice No.")
            {
                IncludeCaption = true;
            }
            column(InvoiceDiscountAmount; "Invoice Discount Amount")
            {
                IncludeCaption = true;
            }
            column(AmountIncludingVAT; "Amount Including VAT")
            {
                IncludeCaption = true;
            }

            column(RemainingAmount; "Remaining Amount")
            {
                IncludeCaption = true;
            }

            column(Expense_Type; "Expense Type")
            {
                IncludeCaption = true;
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
