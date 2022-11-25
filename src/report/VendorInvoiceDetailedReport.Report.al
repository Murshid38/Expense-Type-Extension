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
            column(Name; Name)
            {
            }

            dataitem(PurchInvHeader; "Purch. Inv. Header")
            {

                RequestFilterFields = "Expense Type";

                dataitem("Purchase Line"; "Purchase Line")
                {

                    DataItemLink = "Document No." = field("No.");
                    //ensuring Purchase Line table Document No. field and Purch. Inv. Header table No. field is same value

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
