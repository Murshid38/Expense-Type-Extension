pageextension 50102 "Posted Purchase Invoice Ext" extends "Posted Purchase Invoice"
{
    layout
    {
        addafter("Vendor Invoice No.")
        {
            field("Expense Type"; Rec."Expense Type")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the value of Expense Type';
            }
        }
    }
}
