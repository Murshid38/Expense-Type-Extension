report 50100 "Purchase Invoice"
{
    ApplicationArea = All;
    Caption = 'Purchase Invoice';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './layouts/PurchaseInvoice.rdl';
    DefaultLayout = RDLC;
    dataset
    {
        dataitem(PurchaseHeader; "Purchase Header")
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

            dataitem("Purchase Line"; "Purchase Line")
            {

                DataItemLink = "Document No." = field("no."), "Document Type" = field("Document Type");
                //"no." is from purchase header table, "Document No." is from purchase line table
                DataItemLinkReference = PurchaseHeader;
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
