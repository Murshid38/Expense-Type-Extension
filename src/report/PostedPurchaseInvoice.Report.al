report 50101 "Posted Purchase Invoice"
{
    ApplicationArea = All;
    Caption = 'Posted Purchase Invoice';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './layouts/PostedPurchaseInvoice.rdl';
    DefaultLayout = RDLC;
    dataset
    {
        dataitem(PurchInvHeader; "Purch. Inv. Header")
        {
            CalcFields = Amount, "Amount Including VAT", "Invoice Discount Amount";

            column(ComName; ComInfo.Name)
            {
                IncludeCaption = true;
            }
            column(ComAddress; ComInfo.Address)
            {
                IncludeCaption = true;
            }
            column(ComEmail; ComInfo.Name)
            {
                IncludeCaption = true;
            }
            column(ComTelephone; ComInfo."Phone No.")
            {
                IncludeCaption = true;
            }
            column(ComWebsite; ComInfo."Home Page")
            {
                IncludeCaption = true;
            }
            column(ComRegNo; ComInfo."Registration No.")
            {
                IncludeCaption = true;
            }
            column(BuyfromVendorName; "Buy-from Vendor Name")
            {
                IncludeCaption = true;
            }

            column(BuyfromAddress; "Buy-from Address")
            {
                IncludeCaption = true;
            }
            column(BuyfromContactNo; "Buy-from Contact No.")
            {
                IncludeCaption = true;
            }
            column(PostingDate; "Posting Date")
            {
                IncludeCaption = true;
            }
            column(PurchInvNo; "No.")
            {
                IncludeCaption = true;
            }

            column(VendorInvoiceNo; "Vendor Invoice No.")
            {
                IncludeCaption = true;
            }

            column(Payment_Terms_Code; "Payment Terms Code")
            {
                IncludeCaption = true;
            }

            column(DueDate; "Due Date")
            {
                IncludeCaption = true;
            }
            column(ExpenseType; "Expense Type")
            {
                IncludeCaption = true;
            }

            column(Amount; Amount)
            {
                IncludeCaption = true;
            }
            column(Amount_Including_VAT; "Amount Including VAT")
            {
                IncludeCaption = true;
            }
            column(Invoice_Discount_Amount; "Invoice Discount Amount")
            {
                IncludeCaption = true;
            }

            dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
            {

                DataItemLink = "Document No." = field("No.");
                DataItemLinkReference = PurchInvHeader;
                RequestFilterFields = "No.";
                column(No_; "No.")
                {
                    IncludeCaption = true;

                }
                column(Description; Description)
                {
                    IncludeCaption = true;

                }
                column(Unit_of_Measure_Code; "Unit of Measure Code")
                {
                    IncludeCaption = true;

                }
                column(Quantity; Quantity)
                {
                    IncludeCaption = true;
                }
                // column(Line_Amount; "Line Amount")
                // {
                //     IncludeCaption = true;
                // }
                column(Direct_Unit_Cost; "Direct Unit Cost")
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
