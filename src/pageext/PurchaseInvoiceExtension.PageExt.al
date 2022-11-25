pageextension 50101 "Purchase Invoice Extension" extends "Purchase Invoice"
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

